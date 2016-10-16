DROP TABLE IF EXISTS t_readmissions;

CREATE TABLE t_readmissions 
AS SELECT 
hosp_id, measure_id, compared_to_national, 
CAST(denominator AS INT) as denominator,
CAST(score AS FLOAT) AS score,
CAST(lower_estimate AS FLOAT) AS lower_estimate,
CAST(higher_estimate AS FLOAT) AS higher_estimate,
footnote
FROM readmissions;

