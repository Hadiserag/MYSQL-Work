# */Question 1/*
USE ischool_v2;
SELECT building_name, COUNT(DISTINCT cs.section_id) as number_of_sections
FROM locations l
JOIN section_location sl ON l.location_id = sl.location_id
JOIN course_sections cs ON sl.section_id = cs.section_id
WHERE cs.year = 2021
GROUP BY building_name
HAVING COUNT(DISTINCT cs.section_id) > 1
ORDER BY number_of_sections DESC, building_name ASC;
/* Question 2 */
SELECT CONCAT(lname, ", ", fname) AS Student, COUNT(section_id) AS
Number_of_Enrollments,
SUM(credits) AS Number_of_Credits, TIME_FORMAT(STR_TO_DATE(MAX(start_time), '%H:%i:
%s'), '%l:%i %p') AS Latest_Class
FROM people p
JOIN enrollments USING(person_id)
JOIN course_sections cs USING(section_id)
JOIN courses c USING(course_id)
GROUP BY Student
HAVING Number_of_Credits >= 12
ORDER BY Student;
