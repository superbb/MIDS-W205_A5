DROP TABLE hospitals;
CREATE EXTERNAL TABLE hospitals (
hosp_id VARCHAR(8), hosp_name VARCHAR(52), address VARCHAR(52), city VARCHAR(22), state VARCHAR(4), zip VARCHAR(7), county VARCHAR(22), phone VARCHAR(12), type VARCHAR(38), ownership VARCHAR(45), emergency_services VARCHAR(5)
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
"separatorChar" = ",",
"quoteChar" = '"',
"escapeChar" = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/hospitals';


DROP TABLE effective_care;
CREATE EXTERNAL TABLE effective_care (
hosp_id VARCHAR(8), hosp_name VARCHAR(52), address VARCHAR(52), city VARCHAR(22), state VARCHAR(4), zip VARCHAR(7), county VARCHAR(22), phone VARCHAR(12), condition VARCHAR(37), measure_id VARCHAR(18), measure_name VARCHAR(137), score VARCHAR(44), sample VARCHAR(15), footnote VARCHAR(181), measure_start_date VARCHAR(12), measure_end_date VARCHAR(12)
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
"separatorChar" = ",",
"quoteChar" = '"',
"escapeChar" = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/effective_care';


DROP TABLE readmissions;
CREATE EXTERNAL TABLE readmissions (
hosp_id VARCHAR(8), hosp_name VARCHAR(52), address VARCHAR(52), city VARCHAR(22), state VARCHAR(4), zip VARCHAR(7), county VARCHAR(22), phone VARCHAR(12), measure_name VARCHAR(137), measure_id VARCHAR(18), compared_to_national VARCHAR(37), denominator VARCHAR(15), score VARCHAR(44), lower_estimate VARCHAR(15), higher_estimate VARCHAR(15), footnote VARCHAR(58), measure_start_date VARCHAR(12), measure_end_date VARCHAR(12)
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
"separatorChar" = ",",
"quoteChar" = '"',
"escapeChar" = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/readmissions';


DROP TABLE measures;
CREATE EXTERNAL TABLE measures (
measure_name VARCHAR(159), measure_id VARCHAR(20), measure_start_quarter VARCHAR(8), measure_start_date VARCHAR(21), measure_end_quarter VARCHAR(8), measure_end_date VARCHAR(21)
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
"separatorChar" = ",",
"quoteChar" = '"',
"escapeChar" = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/measures';


DROP TABLE survey_responses;
CREATE EXTERNAL TABLE survey_responses (
hosp_id VARCHAR(8), hosp_name VARCHAR(52), address VARCHAR(52), city VARCHAR(22), state VARCHAR(4), zip VARCHAR(12), county VARCHAR(22), 
communication_nurses_achievement VARCHAR(15),
communication_nurses_improvement VARCHAR(15),
communication_nurses_dimension VARCHAR(15),
communication_doctors_achievement VARCHAR(15),
communication_doctors_improvement VARCHAR(15),
communication_doctors_dimension VARCHAR(15),
responsiveness_hosp_staff_achievement VARCHAR(15),
responsiveness_hosp_staff_improvement VARCHAR(15),
responsiveness_hosp_staff_dimension VARCHAR(15),
pain_management_achievement VARCHAR(15),
pain_management_improvement VARCHAR(15),
pain_management_dimension VARCHAR(15),
communication_about_medicines_achievement VARCHAR(15),
communication_about_medicines_improvement VARCHAR(15),
communication_about_medicines_dimension VARCHAR(15),
cleanliness_and_quietness_achievement VARCHAR(15),
cleanliness_and_quietness_improvement VARCHAR(15),
cleanliness_and_quietness_dimension VARCHAR(15),
discharge_information_achievement VARCHAR(15),
discharge_information_improvement VARCHAR(15),
discharge_information_dimension VARCHAR(15),
overall_achievement VARCHAR(15),
overall_improvement VARCHAR(15),
overall_dimension VARCHAR(15),
hcahps_base VARCHAR(15),
hcahps_consistency VARCHAR(15)
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
"separatorChar" = ",",
"quoteChar" = '"',
"escapeChar" = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/survey_responses';








