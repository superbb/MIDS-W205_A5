DROP TABLE IF EXISTS t_effective_care;

CREATE TABLE t_effective_care
AS SELECT 
hosp_id, 
condition, 
measure_id,
CASE
  WHEN score LIKE "Very High%" THEN 60000
  WHEN score LIKE "High%" THEN 50000
  WHEN SCORE LIKE "Medium%" THEN 30000
  WHEN SCORE LIKE "Low%" THEN 10000
  ELSE CAST(score AS INT) END AS score, 
CAST(sample AS INT) AS sample, 
footnote
FROM effective_care;
