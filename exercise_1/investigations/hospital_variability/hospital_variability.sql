/* HOSPITAL VARIABILITY */
/* Note: run best hospitals and best states before running this file */
/* To look at hospital variability, we just need to measure the difference between the top 16% and bottom 16% of hospitals within each state, that way we remove the outliers. The states with the greatest difference have the biggest variability. */

DROP TABLE IF EXISTS state_ntiles;
CREATE TABLE state_ntiles AS
SELECT 
state, 
NTILE(4) OVER (PARTITION BY state ORDER BY final_rank ASC) AS 
ntile,
final_rank
FROM states_pre;


DROP TABLE IF EXISTS state_q1;
DROP TABLE IF EXISTS state_q1;

CREATE TABLE state_q1 AS
SELECT 
state,
MAX(final_rank) AS q1
FROM state_ntiles
WHERE ntile = 1
GROUP BY state;

CREATE TABLE state_q3 AS
SELECT 
state,
MIN(final_rank) AS q3
FROM state_ntiles
WHERE ntile = 4
GROUP BY state;

DROP TABLE IF EXISTS state_ranges;
CREATE TABLE state_range AS
SELECT 
CASE WHEN t1.state IS NULL THEN t3.state 
ELSE t1.state END as state,
t3.q3-t1.q1 AS range,
t1.q1,
t3.q3
FROM state_q1 t1, state_q3 t3
WHERE t1.state=t3.state
ORDER BY range DESC;

SELECT r.state, range, q1, q3, s.state_rank 
FROM state_range r, top_states s
WHERE r.state=s.state
ORDER BY range DESC;
