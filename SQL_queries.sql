USE coursework;


-- Query 1 Displays the member types currently in EARS society and the number of each
SELECT Mem_Type As 'Member Types in BLDC', COUNT(Mem_Type) AS 'Number'
FROM BLDC
GROUP BY Mem_Type;

-- Query 2 Displays the name of the president of the BLDC society
SELECT CONCAT(Stu_FName, ' ', Stu_LName) As 'President of BLDC'
FROM Student WHERE URN =
(SELECT URN FROM BLDC_COMMITTEE
WHERE ROLE = 'President');


-- Query 3 Displays the names of students in CIT (Computer Information Technology)
SELECT CONCAT(Stu_FName,' ',Stu_LName) As 'Students in CIT'
FROM Student
INNER JOIN Course
ON Student.Stu_Course = Course.Crs_Code
AND Course.Crs_Title like '%Computer Information Technology%';

--Query 4 Returns the names of students with tennis as a hobby and how often they do it

SELECT CONCAT(Stu_FName,' ', Stu_LName) As 'Students that enjoy tennis', Frequency As Frequency
FROM Student
INNER JOIN Activity
ON Student.URN = Activity.URN
INNER JOIN Hobby
on (Activity.Hobby_ID = Hobby.Hobby_ID)
AND Hobby.H_Name like '%Tennis%';
-- If you want to do some more queries as the extra challenge task you can include them here