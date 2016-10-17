/* Methodology - find best hospitals ranked by readmissions

1. rank each hospital by measure_id.
(measures without scores are dropped)

2. get average of ranks for mortality and for readmission. 
(I thought about requiring a minimum amount here, but given the volume requirements to even have one category ranked, I figured just one would be enough)

3. get final scores as a weighted comination of the two ranks 

when both available: avg(readmission rank + 2x mortality rank) - since mortality is should count for more. 
if not: just use the one we have
*/

DROP TABLE IF EXISTS i_readmissions_ranks;

CREATE TABLE i_readmissions_ranks AS SELECT 
hosp_id,
rank() OVER (PARTITION BY measure_id ORDER BY score ASC) AS rank,
measure_id,
score,
denominator,
substring(measure_id,0,4) AS measure_type
FROM t_readmissions
WHERE score IS NOT NULL 
AND denominator IS NOT NULL;

DROP TABLE IF EXISTS i_readmission_rank_calcs_mort;

CREATE TABLE
i_readmission_rank_calcs_mort AS
SELECT 
hosp_id,
measure_type,
AVG(rank) AS avg_mort_rank,
SUM(rank) AS sum_mort_rank,
COUNT(rank) AS count_mort_rank
FROM i_readmissions_ranks
WHERE measure_type = 'MORT'
GROUP BY hosp_id, measure_type;

DROP TABLE IF EXISTS i_readmission_rank_calcs_read;

CREATE TABLE
i_readmission_rank_calcs_read AS
SELECT 
hosp_id,
measure_type,
AVG(rank) AS avg_read_rank,
SUM(rank) AS sum_read_rank,
COUNT(rank) AS count_read_rank
FROM i_readmissions_ranks
WHERE measure_type = 'READ'
GROUP BY hosp_id, measure_type;

DROP TABLE IF EXISTS
i_readmission_ranks_combined_pre;

CREATE TABLE i_readmission_ranks_combined_pre AS
SELECT 
CASE 
  WHEN r.hosp_id IS NULL THEN m.hosp_id
  WHEN m.hosp_id IS NULL THEN r.hosp_id
  ELSE r.hosp_id END AS hosp_id,
r.avg_read_rank, 
r.count_read_rank,
m.avg_mort_rank,
m.count_mort_rank,
CASE 
  WHEN r.count_read_rank IS NULL THEN m.avg_mort_rank
  WHEN m.count_mort_rank IS NULL THEN r.avg_read_rank
  ELSE (2 * m.avg_mort_rank + r.avg_read_rank)/3 END AS overall_mortread_rank_score
FROM i_readmission_rank_calcs_read r
FULL JOIN i_readmission_rank_calcs_mort m
ON m.hosp_id = r.hosp_id;

DROP TABLE IF EXISTS
i_readmission_ranks_combined;
CREATE TABLE i_readmission_ranks_combined AS
SELECT 
hosp_id, 
avg_read_rank, 
count_read_rank, 
avg_mort_rank, 
count_mort_rank, 
overall_mortread_rank_score,
rank() OVER (ORDER BY overall_mortread_rank_score ASC) AS rank
FROM i_readmission_ranks_combined_pre;


/*
For effective care

1. get avg scores per cond (remove/adjust non-100 and neg scale ones)
2. combine to get overall score
3. keep one table by cond to allow filtering

--why not by rank, because too many ties, just small value gets skewed if many tied for first.
*/

DROP TABLE IF EXISTS i_ec_adjusted_scores;

CREATE TABLE i_ec_adjusted_scores AS
SELECT
hosp_id,
measure_id,
condition,
CASE 
WHEN measure_id IN ("ED_1b","ED_2b","EDV","OP_18b") THEN "NA"
WHEN measure_id = "OP_1" THEN 100*(((64+15)-cast(score AS FLOAT))/64)
WHEN measure_id = "OP_3b" THEN 100*(((221+21)-cast(score AS FLOAT))/221)
WHEN measure_id = "OP_5" THEN 100*(((142)-cast(score AS FLOAT))/142)
WHEN measure_id = "OP_20" THEN 100*(((143)-cast(score AS FLOAT))/143)
WHEN measure_id = "OP_21" THEN 100*(((182+12)-cast(score AS FLOAT))/182)
WHEN measure_id = "OP_22" THEN 100*(((22)-cast(score AS FLOAT))/22)
WHEN measure_id = "VTE_6" THEN 100*(((71)-cast(score AS FLOAT))/71)
WHEN measure_id = "PC_01" THEN 100-cast(score AS FLOAT)
ELSE cast(score AS INT) END as score
FROM t_effective_care;

DROP TABLE IF EXISTS i_ec_cond_scores;
CREATE TABLE i_ec_cond_scores AS
SELECT
hosp_id,
condition,
AVG(score) AS cond_scores,
COUNT(score) AS cond_count
FROM i_ec_adjusted_scores
WHERE score IS NOT NULL AND score <> 'NA'
GROUP BY hosp_id, condition;


DROP TABLE IF EXISTS i_ec_agg_scores;
CREATE TABLE i_ec_agg_scores AS 
SELECT
hosp_id,
AVG(cond_scores) AS cond_avg,
COUNT(cond_scores) AS cond_count
FROM i_ec_cond_scores 
WHERE cond_scores IS NOT NULL
GROUP BY hosp_id;

/*
For survey scores, I just used an average of overall acievement, improvement, and dimension
*/
DROP TABLE IF EXISTS i_survey_agg_scores;
CREATE TABLE i_survey_agg_scores AS
SELECT 
hosp_id, 
overall_achievement, 
overall_improvement, 
overall_dimension,
CASE WHEN (overall_achievement+overall_improvement+overall_dimension) IS NOT NULL THEN (overall_achievement+ overall_improvement+overall_dimension)/3
WHEN (overall_achievement+overall_improvement) IS NOT NULL THEN (overall_achievement+overall_improvement)/2
 WHEN (overall_achievement+overall_dimension) IS NOT NULL THEN (overall_achievement+overall_dimension)/2
 WHEN (overall_improvement+overall_dimension) IS NOT NULL THEN (overall_improvement+overall_dimension)/2
 WHEN overall_achievement IS NOT NULL THEN overall_achievement
 WHEN overall_improvement IS NOT NULL THEN overall_improvement
 WHEN overall_dimension IS NOT NULL THEN overall_dimension
 END AS overall_score
FROM t_survey_responses;

---combine all together
DROP TABLE IF EXISTS all_combined_and_ranked_pre;
CREATE TABLE all_combined_and_ranked_pre AS
SELECT 
CASE 
WHEN mortread.hosp_id IS NOT NULL THEN mortread.hosp_id
WHEN survey.hosp_id IS NOT NULL THEN survey.hosp_id
WHEN care.hosp_id IS NOT NULL THEN care.hosp_id
ELSE "?" END AS hosp_id,
survey.overall_score AS survey,
RANK() OVER (ORDER BY survey.overall_score DESC) AS r_surv,
care.cond_avg AS care,
RANK() OVER (ORDER BY care.cond_avg DESC) AS r_care,
mortread.overall_mortread_rank_score,
RANK() OVER (ORDER BY mortread.overall_mortread_rank_score ASC) AS r_mortread
FROM i_readmission_ranks_combined mortread, i_survey_agg_scores survey, i_ec_agg_scores care WHERE
mortread.hosp_id = survey.hosp_id AND mortread.hosp_id = care.hosp_id;

DROP TABLE IF EXISTS all_combined_and_ranked;
CREATE TABLE all_combined_and_ranked AS
SELECT 
hosp_id,
CASE
  WHEN (r_surv+r_care+r_mortread) IS NOT NULL THEN (r_surv+r_care+r_mortread)/3
  WHEN (r_surv+r_care) IS NOT NULL THEN (r_surv+r_care)/2
  WHEN (r_surv+r_mortread) IS NOT NULL THEN (r_surv+r_mortread)/2
  WHEN (r_care+r_mortread) IS NOT NULL THEN (r_care+r_mortread)/2
  WHEN r_care IS NOT NULL THEN r_care
  WHEN r_surv IS NOT NULL THEN r_surv
  WHEN r_mortread IS NOT NULL THEN r_mortread
  END AS final_rank,
  r_surv AS survey_rank,
  r_care AS effective_care_rank,
  r_mortread AS readmissions_and_mortality_rank
  FROM all_combined_and_ranked_pre
  ORDER BY final_rank DESC;
  
/* TOP TEN HOSPITALS */ 
DROP TABLE IF EXISTS top_hospitals;
CREATE TABLE top_hospitals AS
SELECT hosp_name, 
final_rank,
survey_rank,
effective_care_rank,
readmissions_and_mortality_rank
FROM all_combined_and_ranked r
LEFT JOIN hospitals h
ON r.hosp_id = h.hosp_id
ORDER BY final_rank ASC;

SELECT  hosp_name, 
final_rank,
survey_rank,
effective_care_rank,
readmissions_and_mortality_rank
 FROM top_hospitals
ORDER BY final_rank ASC
LIMIT 10;


