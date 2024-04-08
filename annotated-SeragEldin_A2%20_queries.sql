/*Answer 1*/
USE ischool;
SELECT CONCAT(fname ,' ', lname) AS Name, d.department AS department, d.title AS
title,
d.college AS college, a.main_phone AS main_phone
FROM people d
      LEFT JOIN person_addresses pa
ON d.person_id = pa.person_id
      LEFT JOIN addresses a
ON pa.address_id = a.address_id
WHERE title IS NOT NULL AND college IS NOT NULL AND department IS NOT NULL AND
main_phone IS NOT NULL
UNION
SELECT CONCAT(fname ,' ', lname) AS Name, d.department AS department, d.title AS
title,
d.college AS college, "Missing Phone Number" AS main_phone
FROM people d
      LEFT JOIN person_addresses pa
ON d.person_id = pa.person_id
      LEFT JOIN addresses a
ON pa.address_id = a.address_id
WHERE title IS NOT NULL AND college IS NOT NULL AND department IS NOT NULL AND
main_phone IS NULL
ORDER BY title, department, Name;
/*Answer 2*/
USE ischool;
SELECT CONCAT(course_code, course_number) AS "Course", CONCAT(fname, ' ' , lname)
AS Name, year AS "School Year", CONCAT(college, ' ' , department) AS "College
Department", email AS "Contact"
FROM courses LEFT JOIN course_sections USING (course_id) LEFT JOIN enrollments
USING (section_id) LEFT JOIN people USING (person_id)
WHERE course_number > 100 AND course_number < 110
AND fname IS NOT NULL
ORDER BY Name;
