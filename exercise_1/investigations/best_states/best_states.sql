/* BEST STATES

Note: must finish best hospitals first to run this. 
To get the best states, we can just aggregate the preliminary hospital scores per state, and then rank the same way we did the hospitals. */


DROP TABLE IF EXISTS states_pre;
CREATE TABLE states_pre AS
SELECT r.hosp_id, 
state,
final_rank,
survey_rank,
effective_care_rank,
readmissions_and_mortality_rank
FROM all_combined_and_ranked r
LEFT JOIN hospitals h
ON r.hosp_id = h.hosp_id;

DROP TABLE IF EXISTS top_states_pre;
CREATE TABLE top_states_pre AS
SELECT state,
avg(final_rank) AS avg_overall_rank,
avg(survey_rank) AS avg_survey_rank, 
avg(effective_care_rank) AS avg_ef_rank, 
avg(readmissions_and_mortality_rank) AS avg_mortread_rank
FROM states_pre
GROUP BY state;

DROP TABLE IF EXISTS top_states;
CREATE TABLE top_states AS
SELECT 
state, 
RANK() OVER (ORDER BY avg_overall_rank ASC) AS state_rank,
avg_overall_rank,
avg_survey_rank,
avg_ef_rank,
avg_mortread_rank
FROM top_states_pre
ORDER BY avg_overall_rank ASC;

SELECT * FROM top_states ORDER BY state_rank ASC;
