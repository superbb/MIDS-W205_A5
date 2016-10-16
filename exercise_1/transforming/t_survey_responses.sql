DROP TABLE IF EXISTS t_survey_responses;
CREATE TABLE t_survey_responses 
AS SELECT hosp_id, 
CASE 
  WHEN communication_nurses_achievement LIKE "%0 out of%" THEN 0 
  WHEN communication_nurses_achievement LIKE "%1 out of%" THEN 1
  WHEN communication_nurses_achievement LIKE "%2 out of%" THEN 2
  WHEN communication_nurses_achievement LIKE "%3 out of%" THEN 3
  WHEN communication_nurses_achievement LIKE "%4 out of%" THEN 4
  WHEN communication_nurses_achievement LIKE "%5 out of%" THEN 5
  WHEN communication_nurses_achievement LIKE "%6 out of%" THEN 6
  WHEN communication_nurses_achievement LIKE "%7 out of%" THEN 7
  WHEN communication_nurses_achievement LIKE "%8 out of%" THEN 8
  WHEN communication_nurses_achievement LIKE "%9 out of%" THEN 9
  WHEN communication_nurses_achievement LIKE "%10 out of%" THEN 10
END AS communication_nurses_achievement, 
CASE 
  WHEN communication_nurses_improvement LIKE "%0 out of%" THEN 0 
  WHEN communication_nurses_improvement LIKE "%1 out of%" THEN 1
  WHEN communication_nurses_improvement LIKE "%2 out of%" THEN 2
  WHEN communication_nurses_improvement LIKE "%3 out of%" THEN 3
  WHEN communication_nurses_improvement LIKE "%4 out of%" THEN 4
  WHEN communication_nurses_improvement LIKE "%5 out of%" THEN 5
  WHEN communication_nurses_improvement LIKE "%6 out of%" THEN 6
  WHEN communication_nurses_improvement LIKE "%7 out of%" THEN 7
  WHEN communication_nurses_improvement LIKE "%8 out of%" THEN 8
  WHEN communication_nurses_improvement LIKE "%9 out of%" THEN 9
  WHEN communication_nurses_improvement LIKE "%10 out of%" THEN 10
END AS communication_nurses_improvement, 
CASE 
  WHEN communication_nurses_dimension LIKE "%0 out of%" THEN 0 
  WHEN communication_nurses_dimension LIKE "%1 out of%" THEN 1
  WHEN communication_nurses_dimension LIKE "%2 out of%" THEN 2
  WHEN communication_nurses_dimension LIKE "%3 out of%" THEN 3
  WHEN communication_nurses_dimension LIKE "%4 out of%" THEN 4
  WHEN communication_nurses_dimension LIKE "%5 out of%" THEN 5
  WHEN communication_nurses_dimension LIKE "%6 out of%" THEN 6
  WHEN communication_nurses_dimension LIKE "%7 out of%" THEN 7
  WHEN communication_nurses_dimension LIKE "%8 out of%" THEN 8
  WHEN communication_nurses_dimension LIKE "%9 out of%" THEN 9
  WHEN communication_nurses_dimension LIKE "%10 out of%" THEN 10
END AS communication_nurses_dimension, 
CASE 
  WHEN communication_doctors_achievement LIKE "%0 out of%" THEN 0 
  WHEN communication_doctors_achievement LIKE "%1 out of%" THEN 1
  WHEN communication_doctors_achievement LIKE "%2 out of%" THEN 2
  WHEN communication_doctors_achievement LIKE "%3 out of%" THEN 3
  WHEN communication_doctors_achievement LIKE "%4 out of%" THEN 4
  WHEN communication_doctors_achievement LIKE "%5 out of%" THEN 5
  WHEN communication_doctors_achievement LIKE "%6 out of%" THEN 6
  WHEN communication_doctors_achievement LIKE "%7 out of%" THEN 7
  WHEN communication_doctors_achievement LIKE "%8 out of%" THEN 8
  WHEN communication_doctors_achievement LIKE "%9 out of%" THEN 9
  WHEN communication_doctors_achievement LIKE "%10 out of%" THEN 10
END AS communication_doctors_achievement, 
CASE 
  WHEN communication_doctors_improvement LIKE "%0 out of%" THEN 0 
  WHEN communication_doctors_improvement LIKE "%1 out of%" THEN 1
  WHEN communication_doctors_improvement LIKE "%2 out of%" THEN 2
  WHEN communication_doctors_improvement LIKE "%3 out of%" THEN 3
  WHEN communication_doctors_improvement LIKE "%4 out of%" THEN 4
  WHEN communication_doctors_improvement LIKE "%5 out of%" THEN 5
  WHEN communication_doctors_improvement LIKE "%6 out of%" THEN 6
  WHEN communication_doctors_improvement LIKE "%7 out of%" THEN 7
  WHEN communication_doctors_improvement LIKE "%8 out of%" THEN 8
  WHEN communication_doctors_improvement LIKE "%9 out of%" THEN 9
  WHEN communication_doctors_improvement LIKE "%10 out of%" THEN 10
END AS communication_doctors_improvement, 
CASE 
  WHEN communication_doctors_dimension LIKE "%0 out of%" THEN 0 
  WHEN communication_doctors_dimension LIKE "%1 out of%" THEN 1
  WHEN communication_doctors_dimension LIKE "%2 out of%" THEN 2
  WHEN communication_doctors_dimension LIKE "%3 out of%" THEN 3
  WHEN communication_doctors_dimension LIKE "%4 out of%" THEN 4
  WHEN communication_doctors_dimension LIKE "%5 out of%" THEN 5
  WHEN communication_doctors_dimension LIKE "%6 out of%" THEN 6
  WHEN communication_doctors_dimension LIKE "%7 out of%" THEN 7
  WHEN communication_doctors_dimension LIKE "%8 out of%" THEN 8
  WHEN communication_doctors_dimension LIKE "%9 out of%" THEN 9
  WHEN communication_doctors_dimension LIKE "%10 out of%" THEN 10
END AS communication_doctors_dimension, 
CASE 
  WHEN responsiveness_hosp_staff_achievement LIKE "%0 out of%" THEN 0 
  WHEN responsiveness_hosp_staff_achievement LIKE "%1 out of%" THEN 1
  WHEN responsiveness_hosp_staff_achievement LIKE "%2 out of%" THEN 2
  WHEN responsiveness_hosp_staff_achievement LIKE "%3 out of%" THEN 3
  WHEN responsiveness_hosp_staff_achievement LIKE "%4 out of%" THEN 4
  WHEN responsiveness_hosp_staff_achievement LIKE "%5 out of%" THEN 5
  WHEN responsiveness_hosp_staff_achievement LIKE "%6 out of%" THEN 6
  WHEN responsiveness_hosp_staff_achievement LIKE "%7 out of%" THEN 7
  WHEN responsiveness_hosp_staff_achievement LIKE "%8 out of%" THEN 8
  WHEN responsiveness_hosp_staff_achievement LIKE "%9 out of%" THEN 9
  WHEN responsiveness_hosp_staff_achievement LIKE "%10 out of%" THEN 10
END AS responsiveness_hosp_staff_achievement, 
CASE 
  WHEN responsiveness_hosp_staff_improvement LIKE "%0 out of%" THEN 0 
  WHEN responsiveness_hosp_staff_improvement LIKE "%1 out of%" THEN 1
  WHEN responsiveness_hosp_staff_improvement LIKE "%2 out of%" THEN 2
  WHEN responsiveness_hosp_staff_improvement LIKE "%3 out of%" THEN 3
  WHEN responsiveness_hosp_staff_improvement LIKE "%4 out of%" THEN 4
  WHEN responsiveness_hosp_staff_improvement LIKE "%5 out of%" THEN 5
  WHEN responsiveness_hosp_staff_improvement LIKE "%6 out of%" THEN 6
  WHEN responsiveness_hosp_staff_improvement LIKE "%7 out of%" THEN 7
  WHEN responsiveness_hosp_staff_improvement LIKE "%8 out of%" THEN 8
  WHEN responsiveness_hosp_staff_improvement LIKE "%9 out of%" THEN 9
  WHEN responsiveness_hosp_staff_improvement LIKE "%10 out of%" THEN 10
END AS responsiveness_hosp_staff_improvement, 
CASE 
  WHEN responsiveness_hosp_staff_dimension LIKE "%0 out of%" THEN 0 
  WHEN responsiveness_hosp_staff_dimension LIKE "%1 out of%" THEN 1
  WHEN responsiveness_hosp_staff_dimension LIKE "%2 out of%" THEN 2
  WHEN responsiveness_hosp_staff_dimension LIKE "%3 out of%" THEN 3
  WHEN responsiveness_hosp_staff_dimension LIKE "%4 out of%" THEN 4
  WHEN responsiveness_hosp_staff_dimension LIKE "%5 out of%" THEN 5
  WHEN responsiveness_hosp_staff_dimension LIKE "%6 out of%" THEN 6
  WHEN responsiveness_hosp_staff_dimension LIKE "%7 out of%" THEN 7
  WHEN responsiveness_hosp_staff_dimension LIKE "%8 out of%" THEN 8
  WHEN responsiveness_hosp_staff_dimension LIKE "%9 out of%" THEN 9
  WHEN responsiveness_hosp_staff_dimension LIKE "%10 out of%" THEN 10
END AS responsiveness_hosp_staff_dimension, 
CASE 
  WHEN pain_management_achievement LIKE "%0 out of%" THEN 0 
  WHEN pain_management_achievement LIKE "%1 out of%" THEN 1
  WHEN pain_management_achievement LIKE "%2 out of%" THEN 2
  WHEN pain_management_achievement LIKE "%3 out of%" THEN 3
  WHEN pain_management_achievement LIKE "%4 out of%" THEN 4
  WHEN pain_management_achievement LIKE "%5 out of%" THEN 5
  WHEN pain_management_achievement LIKE "%6 out of%" THEN 6
  WHEN pain_management_achievement LIKE "%7 out of%" THEN 7
  WHEN pain_management_achievement LIKE "%8 out of%" THEN 8
  WHEN pain_management_achievement LIKE "%9 out of%" THEN 9
  WHEN pain_management_achievement LIKE "%10 out of%" THEN 10
END AS pain_management_achievement, 
CASE 
  WHEN pain_management_improvement LIKE "%0 out of%" THEN 0 
  WHEN pain_management_improvement LIKE "%1 out of%" THEN 1
  WHEN pain_management_improvement LIKE "%2 out of%" THEN 2
  WHEN pain_management_improvement LIKE "%3 out of%" THEN 3
  WHEN pain_management_improvement LIKE "%4 out of%" THEN 4
  WHEN pain_management_improvement LIKE "%5 out of%" THEN 5
  WHEN pain_management_improvement LIKE "%6 out of%" THEN 6
  WHEN pain_management_improvement LIKE "%7 out of%" THEN 7
  WHEN pain_management_improvement LIKE "%8 out of%" THEN 8
  WHEN pain_management_improvement LIKE "%9 out of%" THEN 9
  WHEN pain_management_improvement LIKE "%10 out of%" THEN 10
END AS pain_management_improvement, 
CASE 
  WHEN pain_management_dimension LIKE "%0 out of%" THEN 0 
  WHEN pain_management_dimension LIKE "%1 out of%" THEN 1
  WHEN pain_management_dimension LIKE "%2 out of%" THEN 2
  WHEN pain_management_dimension LIKE "%3 out of%" THEN 3
  WHEN pain_management_dimension LIKE "%4 out of%" THEN 4
  WHEN pain_management_dimension LIKE "%5 out of%" THEN 5
  WHEN pain_management_dimension LIKE "%6 out of%" THEN 6
  WHEN pain_management_dimension LIKE "%7 out of%" THEN 7
  WHEN pain_management_dimension LIKE "%8 out of%" THEN 8
  WHEN pain_management_dimension LIKE "%9 out of%" THEN 9
  WHEN pain_management_dimension LIKE "%10 out of%" THEN 10
END AS pain_management_dimension, 
CASE 
  WHEN communication_about_medicines_achievement LIKE "%0 out of%" THEN 0 
  WHEN communication_about_medicines_achievement LIKE "%1 out of%" THEN 1
  WHEN communication_about_medicines_achievement LIKE "%2 out of%" THEN 2
  WHEN communication_about_medicines_achievement LIKE "%3 out of%" THEN 3
  WHEN communication_about_medicines_achievement LIKE "%4 out of%" THEN 4
  WHEN communication_about_medicines_achievement LIKE "%5 out of%" THEN 5
  WHEN communication_about_medicines_achievement LIKE "%6 out of%" THEN 6
  WHEN communication_about_medicines_achievement LIKE "%7 out of%" THEN 7
  WHEN communication_about_medicines_achievement LIKE "%8 out of%" THEN 8
  WHEN communication_about_medicines_achievement LIKE "%9 out of%" THEN 9
  WHEN communication_about_medicines_achievement LIKE "%10 out of%" THEN 10
END AS communication_about_medicines_achievement, 
CASE 
  WHEN communication_about_medicines_improvement LIKE "%0 out of%" THEN 0 
  WHEN communication_about_medicines_improvement LIKE "%1 out of%" THEN 1
  WHEN communication_about_medicines_improvement LIKE "%2 out of%" THEN 2
  WHEN communication_about_medicines_improvement LIKE "%3 out of%" THEN 3
  WHEN communication_about_medicines_improvement LIKE "%4 out of%" THEN 4
  WHEN communication_about_medicines_improvement LIKE "%5 out of%" THEN 5
  WHEN communication_about_medicines_improvement LIKE "%6 out of%" THEN 6
  WHEN communication_about_medicines_improvement LIKE "%7 out of%" THEN 7
  WHEN communication_about_medicines_improvement LIKE "%8 out of%" THEN 8
  WHEN communication_about_medicines_improvement LIKE "%9 out of%" THEN 9
  WHEN communication_about_medicines_improvement LIKE "%10 out of%" THEN 10
END AS communication_about_medicines_improvement, 
CASE 
  WHEN communication_about_medicines_dimension LIKE "%0 out of%" THEN 0 
  WHEN communication_about_medicines_dimension LIKE "%1 out of%" THEN 1
  WHEN communication_about_medicines_dimension LIKE "%2 out of%" THEN 2
  WHEN communication_about_medicines_dimension LIKE "%3 out of%" THEN 3
  WHEN communication_about_medicines_dimension LIKE "%4 out of%" THEN 4
  WHEN communication_about_medicines_dimension LIKE "%5 out of%" THEN 5
  WHEN communication_about_medicines_dimension LIKE "%6 out of%" THEN 6
  WHEN communication_about_medicines_dimension LIKE "%7 out of%" THEN 7
  WHEN communication_about_medicines_dimension LIKE "%8 out of%" THEN 8
  WHEN communication_about_medicines_dimension LIKE "%9 out of%" THEN 9
  WHEN communication_about_medicines_dimension LIKE "%10 out of%" THEN 10
END AS communication_about_medicines_dimension, 

CASE 
  WHEN cleanliness_and_quietness_achievement LIKE "%0 out of%" THEN 0 
  WHEN cleanliness_and_quietness_achievement LIKE "%1 out of%" THEN 1
  WHEN cleanliness_and_quietness_achievement LIKE "%2 out of%" THEN 2
  WHEN cleanliness_and_quietness_achievement LIKE "%3 out of%" THEN 3
  WHEN cleanliness_and_quietness_achievement LIKE "%4 out of%" THEN 4
  WHEN cleanliness_and_quietness_achievement LIKE "%5 out of%" THEN 5
  WHEN cleanliness_and_quietness_achievement LIKE "%6 out of%" THEN 6
  WHEN cleanliness_and_quietness_achievement LIKE "%7 out of%" THEN 7
  WHEN cleanliness_and_quietness_achievement LIKE "%8 out of%" THEN 8
  WHEN cleanliness_and_quietness_achievement LIKE "%9 out of%" THEN 9
  WHEN cleanliness_and_quietness_achievement LIKE "%10 out of%" THEN 10
END AS cleanliness_and_quietness_achievement, 
CASE 
  WHEN cleanliness_and_quietness_improvement LIKE "%0 out of%" THEN 0 
  WHEN cleanliness_and_quietness_improvement LIKE "%1 out of%" THEN 1
  WHEN cleanliness_and_quietness_improvement LIKE "%2 out of%" THEN 2
  WHEN cleanliness_and_quietness_improvement LIKE "%3 out of%" THEN 3
  WHEN cleanliness_and_quietness_improvement LIKE "%4 out of%" THEN 4
  WHEN cleanliness_and_quietness_improvement LIKE "%5 out of%" THEN 5
  WHEN cleanliness_and_quietness_improvement LIKE "%6 out of%" THEN 6
  WHEN cleanliness_and_quietness_improvement LIKE "%7 out of%" THEN 7
  WHEN cleanliness_and_quietness_improvement LIKE "%8 out of%" THEN 8
  WHEN cleanliness_and_quietness_improvement LIKE "%9 out of%" THEN 9
  WHEN cleanliness_and_quietness_improvement LIKE "%10 out of%" THEN 10
END AS cleanliness_and_quietness_improvement, 
CASE 
  WHEN cleanliness_and_quietness_dimension LIKE "%0 out of%" THEN 0 
  WHEN cleanliness_and_quietness_dimension LIKE "%1 out of%" THEN 1
  WHEN cleanliness_and_quietness_dimension LIKE "%2 out of%" THEN 2
  WHEN cleanliness_and_quietness_dimension LIKE "%3 out of%" THEN 3
  WHEN cleanliness_and_quietness_dimension LIKE "%4 out of%" THEN 4
  WHEN cleanliness_and_quietness_dimension LIKE "%5 out of%" THEN 5
  WHEN cleanliness_and_quietness_dimension LIKE "%6 out of%" THEN 6
  WHEN cleanliness_and_quietness_dimension LIKE "%7 out of%" THEN 7
  WHEN cleanliness_and_quietness_dimension LIKE "%8 out of%" THEN 8
  WHEN cleanliness_and_quietness_dimension LIKE "%9 out of%" THEN 9
  WHEN cleanliness_and_quietness_dimension LIKE "%10 out of%" THEN 10
END AS cleanliness_and_quietness_dimension, 
CASE 
  WHEN discharge_information_achievement LIKE "%0 out of%" THEN 0 
  WHEN discharge_information_achievement LIKE "%1 out of%" THEN 1
  WHEN discharge_information_achievement LIKE "%2 out of%" THEN 2
  WHEN discharge_information_achievement LIKE "%3 out of%" THEN 3
  WHEN discharge_information_achievement LIKE "%4 out of%" THEN 4
  WHEN discharge_information_achievement LIKE "%5 out of%" THEN 5
  WHEN discharge_information_achievement LIKE "%6 out of%" THEN 6
  WHEN discharge_information_achievement LIKE "%7 out of%" THEN 7
  WHEN discharge_information_achievement LIKE "%8 out of%" THEN 8
  WHEN discharge_information_achievement LIKE "%9 out of%" THEN 9
  WHEN discharge_information_achievement LIKE "%10 out of%" THEN 10
END AS discharge_information_achievement, 
CASE 
  WHEN discharge_information_improvement LIKE "%0 out of%" THEN 0 
  WHEN discharge_information_improvement LIKE "%1 out of%" THEN 1
  WHEN discharge_information_improvement LIKE "%2 out of%" THEN 2
  WHEN discharge_information_improvement LIKE "%3 out of%" THEN 3
  WHEN discharge_information_improvement LIKE "%4 out of%" THEN 4
  WHEN discharge_information_improvement LIKE "%5 out of%" THEN 5
  WHEN discharge_information_improvement LIKE "%6 out of%" THEN 6
  WHEN discharge_information_improvement LIKE "%7 out of%" THEN 7
  WHEN discharge_information_improvement LIKE "%8 out of%" THEN 8
  WHEN discharge_information_improvement LIKE "%9 out of%" THEN 9
  WHEN discharge_information_improvement LIKE "%10 out of%" THEN 10
END AS discharge_information_improvement, 
CASE 
  WHEN discharge_information_dimension LIKE "%0 out of%" THEN 0 
  WHEN discharge_information_dimension LIKE "%1 out of%" THEN 1
  WHEN discharge_information_dimension LIKE "%2 out of%" THEN 2
  WHEN discharge_information_dimension LIKE "%3 out of%" THEN 3
  WHEN discharge_information_dimension LIKE "%4 out of%" THEN 4
  WHEN discharge_information_dimension LIKE "%5 out of%" THEN 5
  WHEN discharge_information_dimension LIKE "%6 out of%" THEN 6
  WHEN discharge_information_dimension LIKE "%7 out of%" THEN 7
  WHEN discharge_information_dimension LIKE "%8 out of%" THEN 8
  WHEN discharge_information_dimension LIKE "%9 out of%" THEN 9
  WHEN discharge_information_dimension LIKE "%10 out of%" THEN 10
END AS discharge_information_dimension, 
CASE 
  WHEN overall_achievement LIKE "%0 out of%" THEN 0 
  WHEN overall_achievement LIKE "%1 out of%" THEN 1
  WHEN overall_achievement LIKE "%2 out of%" THEN 2
  WHEN overall_achievement LIKE "%3 out of%" THEN 3
  WHEN overall_achievement LIKE "%4 out of%" THEN 4
  WHEN overall_achievement LIKE "%5 out of%" THEN 5
  WHEN overall_achievement LIKE "%6 out of%" THEN 6
  WHEN overall_achievement LIKE "%7 out of%" THEN 7
  WHEN overall_achievement LIKE "%8 out of%" THEN 8
  WHEN overall_achievement LIKE "%9 out of%" THEN 9
  WHEN overall_achievement LIKE "%10 out of%" THEN 10
END AS overall_achievement, 
CASE 
  WHEN overall_improvement LIKE "%0 out of%" THEN 0 
  WHEN overall_improvement LIKE "%1 out of%" THEN 1
  WHEN overall_improvement LIKE "%2 out of%" THEN 2
  WHEN overall_improvement LIKE "%3 out of%" THEN 3
  WHEN overall_improvement LIKE "%4 out of%" THEN 4
  WHEN overall_improvement LIKE "%5 out of%" THEN 5
  WHEN overall_improvement LIKE "%6 out of%" THEN 6
  WHEN overall_improvement LIKE "%7 out of%" THEN 7
  WHEN overall_improvement LIKE "%8 out of%" THEN 8
  WHEN overall_improvement LIKE "%9 out of%" THEN 9
  WHEN overall_improvement LIKE "%10 out of%" THEN 10
END AS overall_improvement, 
CASE 
  WHEN overall_dimension LIKE "%0 out of%" THEN 0 
  WHEN overall_dimension LIKE "%1 out of%" THEN 1
  WHEN overall_dimension LIKE "%2 out of%" THEN 2
  WHEN overall_dimension LIKE "%3 out of%" THEN 3
  WHEN overall_dimension LIKE "%4 out of%" THEN 4
  WHEN overall_dimension LIKE "%5 out of%" THEN 5
  WHEN overall_dimension LIKE "%6 out of%" THEN 6
  WHEN overall_dimension LIKE "%7 out of%" THEN 7
  WHEN overall_dimension LIKE "%8 out of%" THEN 8
  WHEN overall_dimension LIKE "%9 out of%" THEN 9
  WHEN overall_dimension LIKE "%10 out of%" THEN 10
END AS overall_dimension, 
CAST(hcahps_base as INT) as hcahps_base, 
CAST(hcahps_consistency as INT) as hcahps_consistency
FROM survey_responses;
