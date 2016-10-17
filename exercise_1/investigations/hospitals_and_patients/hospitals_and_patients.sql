/* HOSPITALS AND PATIENTS */
/* Note: load hospitals and states first. */
/* Do hospitals who rank highly on surveys have lower mortality rates?

To check, let's break up the hospitals into quartiles based on survey scores and then compare their mortality numbers.
 */

DROP TABLE IF EXISTS cond_mort_pre;

CREATE TABLE cond_mort_pre AS
SELECT
CASE WHEN c.hosp_id IS NULL THEN m.hosp_id ELSE c.hosp_id END AS hosp_id,
ntile(4) OVER (ORDER BY c.cond_avg DESC) AS quartile,
c.cond_avg,
m.avg_mort_rank
FROM i_ec_agg_scores c, i_readmission_rank_calcs_mort m 
WHERE c.hosp_id = m.hosp_id AND c.cond_avg IS NOT NULL;

DROP TABLE IF EXISTS cond_mort;
CREATE TABLE cond_mort AS
SELECT 
quartile, 
avg(cond_avg) AS ave_cond_avg,
avg(avg_mort_rank) AS ave_mort_rank
FROM cond_mort_pre
GROUP BY quartile;

SELECT * FROM cond_mort
ORDER BY quartile ASC;



