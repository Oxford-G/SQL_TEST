Skip to content
Search or jump to…

Pull requests
Issues
Marketplace
Explore
 
@Oxford-G 
Tenacious-Qi
/
sql-zoo
1
00
Code
Issues
Pull requests
Actions
Projects
Wiki
Security
Insights
sql-zoo/tutorial_exercises/8_using_null.sql
@Tenacious-Qi
Tenacious-Qi complete using_null exercises
Latest commit a194fe5 14 days ago
 History
 1 contributor
68 lines (49 sloc)  2.08 KB
 
-- List the teachers who have NULL for their department. 

SELECT name
FROM teacher
WHERE dept IS NULL;

-- Note the INNER JOIN misses the teachers with no department and the departments with no teacher. 

SELECT teacher.name, dept.name
FROM teacher JOIN dept
               ON (teacher.dept = dept.id)

-- Use a different JOIN so that all teachers are listed. 

SELECT teacher.name, dept.name
FROM teacher LEFT OUTER JOIN dept
               ON (teacher.dept = dept.id)

-- Use a different JOIN so that all departments are listed. 

SELECT teacher.name, dept.name
FROM teacher RIGHT OUTER JOIN dept
               ON (teacher.dept = dept.id)

-- Use COALESCE to print the mobile number. 
-- Use the number '07986 444 2266' if there is no number given. 
-- Show teacher name and mobile number or '07986 444 2266'

SELECT name, mobile, COALESCE(mobile, '07986 444 2266') AS mobile
FROM teacher;

-- Use the COALESCE function and a LEFT JOIN to print the teacher name and department name. 
-- Use the string 'None' where there is no department.

SELECT teacher.name, COALESCE(dept.name, 'None')
FROM teacher LEFT OUTER JOIN dept ON teacher.dept = dept.id;

-- Use COUNT to show the number of teachers and the number of mobile phones. 

SELECT COUNT(name), COUNT(mobile)
FROM teacher;

-- Use COUNT and GROUP BY dept.name to show each department 
-- and the number of staff. 
-- Use a RIGHT JOIN to ensure that the Engineering department is listed. 

SELECT dept.name, COUNT(teacher.name) AS teachers
FROM teacher RIGHT OUTER JOIN dept ON teacher.dept = dept.id
GROUP BY dept.name;

-- Use CASE to show the name of each teacher followed by
-- 'Sci' if the teacher is in dept 1 or 2 and 'Art' otherwise.

SELECT name, 
CASE WHEN dept = 1 OR dept = 2 THEN 'Sci' ELSE 'Art' END AS dept
FROM teacher;

-- Use CASE to show the name of each teacher followed by 'Sci' 
-- if the teacher is in dept 1 or 2, 
-- show 'Art' if the teacher's dept is 3 
-- and 'None' otherwise.

SELECT name,
CASE WHEN dept = 1 OR dept = 2 THEN 'Sci'
     WHEN dept = 3             THEN 'Art'
     ELSE                           'None'
     END
FROM teacher;
© 2021 GitHub, Inc.
Terms
Privacy
Security
Status
Help
Contact GitHub
Pricing
API
Training
Blog
About
