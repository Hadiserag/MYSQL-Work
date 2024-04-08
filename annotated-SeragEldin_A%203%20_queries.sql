/* Answer 1 */
CREATE TABLE courses_copy LIKE courses;
INSERT INTO courses_copy SELECT * FROM courses;
CREATE TABLE people_copy LIKE people;
INSERT INTO people_copy SELECT * FROM people;
INSERT INTO courses_copy (course_id, course_code, course_number,
course_description, course_syllabus, course_prereq,
credits)
VALUES (83, "INST", 987, 'Artificial Intelligence', NULL, 'C- INST327', 3);
INSERT INTO people_copy (person_id, lname, fname, email, college, department,
title, start_date)
VALUES (119089642, 'Ken', 'Just', 'jken@umd.edu', 'College of Information Studies',
'ISCHOOL', NULL,
'2023-09-20 00:00:00');
SELECT *
FROM courses_copy;
SELECT *
FROM people_copy;
/* Answer 2 */
CREATE TABLE course_sections_copy LIKE course_sections;
INSERT INTO course_sections_copy SELECT * FROM course_sections;
SET SQL_SAFE_UPDATES=0;
UPDATE course_sections_copy
SET year = '2023'
WHERE year = '2021';
UPDATE course_sections_copy
SET delivery_id = 2, location_id = 29
WHERE delivery_id = 3;
SELECT course_id AS 'Course ID', section_number AS 'Section No.', CONCAT(semester,
' ', year) as 'Term',
CONCAT (building_name, " ", "Room #", room_number) As 'Location'
FROM course_sections_copy cs
JOIN locations l USING(location_id)
WHERE semester = 'Fall';
/* Answer 3 */
DELETE FROM course_sections_copy
WHERE course_id = 14;
SELECT CONCAT(semester, ' ', year) AS 'Term', section_id AS 'Section ID',
CONCAT(course_code, course_number) AS 'Course Name',
credits AS 'Credits'
FROM course_sections_copy cs
JOIN courses c
ON cs.course_id = c.course_id
WHERE semester = "Fall";
