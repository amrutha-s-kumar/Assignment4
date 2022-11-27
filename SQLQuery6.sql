CREATE DATABASE STUDENTS;
USE STUDENTS;

CREATE TABLE course(CourseId INT PRIMARY KEY NOT NULL IDENTITY(1,1),Coursename VARCHAR(50) NOT NULL,Courseshortname VARCHAR(50) NOT NULL,Coursetype VARCHAR(50) NOT NULL);

INSERT INTO course(Coursename,Courseshortname,Coursetype) VALUES (('COMPUTER SCIENCE'),('CS'),('DIPLOMA')),(('MASTER IN COMPUTER APPLICATION'),('MCA'),('POST GRADUATE')),(('BACHELOR IN COMPUTER APPLICATION'),('BCA'),('DEGREE')),(('COMMERCE'),('C1'),('DIPLOMA')),(('BACHELOR IN COMPUTER SCIENCE'),('POST GRADUATE'),('DEGREE'));
INSERT INTO course(Coursename,Courseshortname,Coursetype) VALUES (('BAA'),('BAA'),('DIPLOMA'));
SELECT * FROM COURSE


CREATE TABLE batch(BatchId INT PRIMARY KEY NOT NULL IDENTITY(1,1),Batchname VARCHAR(50));


INSERT INTO  batch(Batchname)VALUES('B2019'),('B2022'),('B2020'),('B2017'),('B2022'),('B2021'),('B2015');

INSERT INTO  batch(Batchname)VALUES('B2017-B2020'),('B2022-B2023'),('B2021-B2022'),('B2015-B2017');


SELECT * FROM batch;




select * from course;

select * from batch;

CREATE TABLE students(Studentid INT PRIMARY KEY IDENTITY(1,1) NOT NULL,Student_Name VARCHAR(50) NOT NULL,Student_Gender VARCHAR(10) NOT NULL CHECK (Student_Gender in ('Female','Male','Others')),Student_DOB DATE NOT NULL, Student_Email VARCHAR(50) NOT NULL,CourseId INT FOREIGN KEY REFERENCES course(CourseId),BatchId INT FOREIGN KEY REFERENCES batch(BatchId), Student_Mark INT NOT NULL);  
INSERT INTO students(Student_Name,Student_Gender,Student_DOB,Student_Email,CourseId,BatchId,Student_Mark)VALUES('AMRITHA','Female','2000-02-22','amruthaskumar@outlook.com',2,4,'98'),('ANU','Female','2000-06-21','anu123@gmail.com',3,5,'79'),('ABHI','Male','1999-09-11','abhi2k@gmail.com',1,3,'96'),('SREE','Female','1999-02-02','sree456@gmail.com',1,5,'89'),('ANANDHU','Male','2000-12-22','anandhu12@gmail.com',2,5,'68');

INSERT INTO students(Student_Name,Student_Gender,Student_DOB,Student_Email,CourseId,BatchId,Student_Mark)VALUES('AMRUTHA','Female','2000-02-22','amruthaskumar@outlook.com',2,4,'98');
INSERT INTO students(Student_Name,Student_Gender,Student_DOB,Student_Email,CourseId,BatchId,Student_Mark)VALUES('ANU','Female','2000-06-21','anu123@gmail.com',3,5,'79');
INSERT INTO students(Student_Name,Student_Gender,Student_DOB,Student_Email,CourseId,BatchId,Student_Mark)VALUES('ABHI','Male','1999-09-01','abhi2k@gmail.com',1,3,'96');
INSERT INTO students(Student_Name,Student_Gender,Student_DOB,Student_Email,CourseId,BatchId,Student_Mark)VALUES('ANU','Female','2000-06-21','anu123@gmail.com',3,5,'79');

INSERT INTO students(Student_Name,Student_Gender,Student_DOB,Student_Email,CourseId,BatchId,Student_Mark)VALUES('GIREESH','Male','1999-02-22','goutham@outlook.com',6,8,'98'),('ANUSREE','Female','1999-06-21','anu123@gmail.com',6,8,'79');
INSERT INTO students(Student_Name,Student_Gender,Student_DOB,Student_Email,CourseId,BatchId,Student_Mark)VALUES('GIRi','Male','1999-02-22','giri@outlook.com',2,8,'98'),('mahi','Female','1999-06-21','mahi123@gmail.com',2,8,'79');


SELECT * FROM students;






SELECT * FROM course;


SELECT Coursename FROM course WHERE Coursetype='DEGREE';


SELECT Coursename,Courseshortname FROM course WHERE Coursetype='POST GRADUATE';

SELECT * FROM batch;

SELECT * FROM students;

INSERT INTO students(Student_Name,Student_Gender,Student_DOB,Student_Email,CourseId,BatchId,Student_Mark)VALUES('ANANYA','Female','1998-09-01','ananya2k@gmail.com',2,3,'66'),('RAM','Male','1998-09-21','ram45@gmail.com',3,3,'87'),('ATHI','Female','1998-10-01','athirababu@gmail.com',2,3,'76');

INSERT INTO student(Student_Name,Student_Gender,Student_DOB,Student_Email,CourseId,BatchId,Student_Mark)VALUES('ANANYA','Female','1998-09-01','ananya2k@gmail.com',2,10,'66'),('RAM','Male','1998-09-21','ram45@gmail.com',3,9,'87'),('ATHI','Female','1998-10-01','athirababu@gmail.com',2,8,'76');


SELECT * FROM students;


SELECT SUM(CASE WHEN Student_Gender = 'Male' THEN 1 ELSE 0 END) as Total_Male,
       SUM(CASE WHEN Student_Gender = 'Female' THEN 1 ELSE 0 END) as Total_Female
FROM students;


select * from students;
select * from batch;

SELECT * FROM students WHERE Student_Gender='Female';
select * from course;


SELECT Studentid,Student_Name,Student_Gender,Student_DOB,Student_Email,Student_Mark FROM students s INNER JOIN course c ON s.CourseId = c.CourseId WHERE Student_Gender='Male'AND Courseshortname='MCA';


SELECT Studentid,Student_Name,Student_Gender,Student_DOB,Student_Email,Student_Mark FROM students s INNER JOIN course c ON s.CourseId = c.CourseId WHERE Coursename='BAA';

select * from students where CourseId=(select CourseId from
course where Courseshortname='BAA') and BatchId=(select BatchId 
from batch where Batchname='B2017-B2020');


SELECT MAX(Courseshortname) AS Course_name, COUNT(Studentid) AS Count_students
    FROM course
    LEFT JOIN students ON students.CourseId = course.CourseId
    GROUP BY course.CourseId;



	SELECT Studentid,Student_Name,Student_Gender,Student_DOB,Student_Email,Student_Mark FROM students s INNER JOIN course c ON s.CourseId = c.CourseId WHERE Coursetype='DEGREE';


	SELECT Studentid,Student_Name,Student_Gender,Student_DOB,Student_Email,Student_Mark FROM students s INNER JOIN course c ON s.CourseId = c.CourseId WHERE Coursetype='POST GRADUATE';


	select * from students where CourseId =(select CourseId from
course where Courseshortname='MCA') AND BatchId=(select BatchId 
from batch where Batchname='B2017-B2020');


	  SELECT Studentid,Student_DOB,Student_Email FROM students s INNER JOIN course c ON s.CourseId = c.CourseId  WHERE Courseshortname='BCA' ;  

SELECT     Studentid,Student_Name,Student_Gender,Student_DOB,Student_Email,Student_Mark,Coursename,Batchname FROM students s 
	   INNER JOIN course c ON s.CourseId = c.CourseId
	   INNER JOIN batch b ON s.BatchId = b.BatchId;

SELECT MAX(Batchname) AS Batch_name, COUNT(Studentid) AS Count_students
    FROM batch
    LEFT JOIN students ON students.BatchId = batch.BatchId
    GROUP BY batch.BatchId;


	 SELECT Studentid,Student_Name,Student_Email ,Coursename FROM students s INNER JOIN course c ON s.CourseId = c.CourseId  ;  

SELECT Studentid,Student_Name,Student_Gender,Student_DOB,Student_Email,Student_Mark,
Batchname FROM students s INNER JOIN batch b ON s.BatchId = b.BatchId ;


SELECT b.Batchname,COUNT(case when Student_Gender='Male' then 1 end)
AS Total_Male,
COUNT(case when Student_Gender='Female' then 1 end)As Total_Female from
students s JOIN batch b ON b.BatchId=s.BatchId GROUP BY
b.Batchname;


SELECT Student_Name FROM students WHERE Student_Mark=(select
MAX(Student_Mark)from students where CourseId=(select CourseId 
from course where Courseshortname='BCA'));


SELECT Student_Name FROM students WHERE Student_Mark=(select
MIN(Student_Mark)from students where CourseId=(select CourseId 
from course where Courseshortname='MCA') and Student_Gender='Male');

select * from course;


SELECT * FROM students WHERE Student_Mark >(select
AVG(Student_Mark)from students where CourseId IN (select
CourseId from course where Coursetype='DEGREE'))AND CourseId IN
(select CourseId from course where Coursetype='DEGREE');SELECT * FROM students WHERE Student_Mark=(select
MAX(Student_Mark)from students where CourseId=(select CourseId 
from course where Courseshortname='BCA'));SELECT Student_Name,Student_Email from students where
Student_Mark= (select MAX(Student_Mark) FROM students WHERE
Student_Mark < (SELECT MAX(Student_Mark) FROM students));Select Student_Name,Student_DOB,datediff(YY,Student_DOB,getdate())
as Age from students;Select Student_Name,DATENAME(MONTH,DATEADD(MONTH,MONTH(Student_DOB),-1 )
)AS Birth_Month,YEAR(Student_DOB) AS Year_Of_Birth FROM students;  SELECT Studentid,Student_Name,Student_DOB,Student_Email,Courseshortname FROM students s INNER JOIN course c ON s.CourseId = c.CourseId WHERE Courseshortname='MCA'AND Student_Gender='Female';

SELECT c.Courseshortname AS Course, MAX(s.Student_Mark) AS Max_Mark 
FROM course c JOIN students s
ON s.CourseId = c.CourseId GROUP BY c.Courseshortname; 

Select * from students where YEAR(Student_DOB)<1995;Select * from students where CourseId=(select CourseId from
course where Courseshortname='BCA') AND YEAR(Student_DOB)BETWEEN 1992 AND 1996;SELECT Studentid,Student_Name,Student_Gender,Student_DOB,Student_Email,Student_Mark FROM students s INNER JOIN course c ON s.CourseId = c.CourseId WHERE Coursetype='POST GRADUATE'AND Student_Gender='Male';
 SELECT * FROM students WHERE Student_Mark >(select AVG(Student_Mark)from
students where CourseId IN (select CourseId from course where
Courseshortname='BCA')) AND CourseId IN (select CourseId from
course where Courseshortname='BCA');SELECT * FROM students WHERE CourseId=(select CourseId from
course where Courseshortname='BAA')AND BatchId=(SELECT BatchId 
FROM batch WHERE Batchname='B2017-B2020');

SELECT Student_Name from students ORDER BY
datediff(YY,Student_DOB,getdate()) DESC OFFSET 0 ROWS FETCH FIRST 1 
ROWS ONLY;


SELECT Student_Name,Student_Email from students WHERE
CourseId=(select CourseId from course where
Courseshortname='BCA')
ORDER BY datediff(YY,Student_DOB,getdate()) ASC OFFSET 0 ROWS FETCH
FIRST 1 ROWS ONLY;SELECT Studentid,Student_Name,Student_Gender,Student_DOB,Student_Email,Student_Mark FROM students ORDER BY Student_DOB DESC;
SELECT * FROM students WHERE Student_Mark BETWEEN 65 and 91;SELECT Studentid,Student_Name,Student_Gender,Student_DOB,Student_Email,Student_Mark,Courseshortname FROM students s INNER JOIN course c ON s.CourseId = c.CourseId  WHERE Courseshortname='BCA' ORDER BY Student_Mark;  

SELECT batch.Batchname, course.Courseshortname,COUNT(students.Studentid) AS total
FROM     batch INNER JOIN
                  students ON batch.BatchId = students.BatchId INNER JOIN
                  course ON course.CourseId = students.CourseId
 GROUP BY batch.Batchname, course.Courseshortname;
 SELECT students.Student_Name,Coursename,students.Student_Mark as Maximum_Mark
FROM     batch INNER JOIN
                  students ON batch.BatchId = students.BatchId INNER JOIN
                  course ON students.CourseId = course.CourseId where
students.Student_Mark IN (select MAX(students.Student_Mark)from batch INNER JOIN
                  students ON batch.BatchId = students.BatchId INNER JOIN
                  course ON students.CourseId = course.CourseId group by  course.Coursename ) ; 


SELECT Studentid,Student_Name,Student_Gender,Student_DOB,Student_Email,Student_Mark, CourseId FROM student s,course c INNER JOIN batch b ON s.BatchId = b.BatchId WHERE Coursename='BAA';






SELECT Studentid,Student_Name,Student_Gender,Student_DOB,Student_Email,Student_Mark FROM student s INNER JOIN course c ON s.CourseId = c.CourseId WHERE Coursetype='DEGREE';

select * from course;
select * from student;


SELECT Studentid,Student_Name,Student_Gender,Student_DOB,Student_Email,Student_Mark FROM student s INNER JOIN course c ON s.CourseId = c.CourseId WHERE Coursetype='POST GRADUATE';


SELECT Studentid,Student_Name,Student_Gender,Student_DOB,Student_Email,Student_Mark,Batchname FROM student s INNER JOIN batch b ON s.BatchId = b.BatchId ;
select * from batch;







SELECT Studentid,Student_Name,Student_Gender,Student_DOB,Student_Email,Student_Mark FROM student s INNER JOIN course c ON s.CourseId = c.CourseId WHERE Coursetype='POST GRADUATE'AND Student_Gender='Male';











SELECT Studentid,Student_Name FROM student Where 





SELECT * FROM student WHERE Student_Mark BETWEEN 65 and 91;
select * from student;


SELECT MAX(Courseshortname) AS Course_name, COUNT(Studentid) AS Count_students
    FROM course
    LEFT JOIN student ON student.CourseId = course.CourseId
    GROUP BY course.CourseId;


	select * from course;

SELECT MAX(Batchname) AS Batch_name, COUNT(Studentid) AS Count_students
    FROM batch
    LEFT JOIN student ON student.BatchId = batch.BatchId
    GROUP BY batch.BatchId;


	
	select * from student;
	select * from course;


	


	SELECT MAX(Batchname) as batch, COUNT(CASE WHEN Student_Gender = 'Male' THEN 1 ELSE 0 END) as Total_Male,
       COUNT(CASE WHEN Student_Gender = 'Female' THEN 1 ELSE 0 END) as Total_Female FROM batch
	  INNER JOIN student ON student.BatchId = batch.BatchId
    GROUP BY student.BatchId;
    

      

SELECT  COUNT(Studentid) AS Count_students
    FROM batch


	  SELECT Studentid,Student_DOB,Student_Email FROM student s INNER JOIN course c ON s.CourseId = c.CourseId  WHERE Courseshortname='BCA' ;  


	 SELECT Studentid,Student_Name,Student_Email ,Coursename FROM student s INNER JOIN course c ON s.CourseId = c.CourseId  ;  

	  

	  SELECT Studentid,Student_Name,Student_Gender,Student_DOB,Student_Email,Student_Mark,Coursename FROM student s INNER JOIN course c ON s.CourseId = c.CourseId  WHERE Courseshortname='BCA' ORDER BY Student_Mark;  


	   SELECT Studentid,Student_Name,Student_Gender,Student_DOB,Student_Email,Student_Mark,Coursename,Batchname FROM student s 
	   INNER JOIN course c ON s.CourseId = c.CourseId
	   INNER JOIN batch b ON s.BatchId = b.BatchId;





	SELECT Studentid,Student_Name,Student_Gender,Student_DOB,Student_Email,Student_Mark FROM student ORDER BY Student_DOB DESC;


  SELECT Studentid,Student_Name,Student_Gender,Student_DOB,Student_Email,Student_Mark,Courseshortname FROM student s INNER JOIN course c ON s.CourseId = c.CourseId  WHERE Courseshortname='BCA' ORDER BY Student_Mark;  

  select * from course;
  select * from student;
  SELECT Studentid,Student_DOB,Student_Email,Courseshortname FROM student s INNER JOIN course c ON s.CourseId = c.CourseId WHERE Coursetype='POST GRADUATE'AND Student_Gender='Male';

  SELECT Studentid,Student_Name,Student_DOB,Student_Email,Courseshortname FROM student s INNER JOIN course c ON s.CourseId = c.CourseId WHERE Courseshortname='MCA'AND Student_Gender='Female';


  select * from course;


  select * from batch;

  SELECT * FROM student;

  
SELECT Coursename FROM course WHERE Coursetype='DEGREE';


SELECT Coursename,Courseshortname FROM course WHERE Coursetype='POST GRADUATE';


SELECT SUM(CASE WHEN Student_Gender = 'Male' THEN 1 ELSE 0 END) as Total_Male,
       SUM(CASE WHEN Student_Gender = 'Female' THEN 1 ELSE 0 END) as Total_Female
FROM student;


SELECT * FROM student WHERE Student_Gender='Female';

SELECT Studentid,Student_Name,Student_Gender,Student_DOB,Student_Email,Student_Mark FROM student s INNER JOIN course c ON s.CourseId = c.CourseId WHERE Student_Gender='Male'AND Courseshortname='MCA';

SELECT Studentid,Student_Name,Student_Gender,Student_DOB,Student_Email,Student_Mark FROM student s INNER JOIN course c ON s.CourseId = c.CourseId WHERE Coursename='BAA';

SELECT MAX(Courseshortname) AS Course_name, COUNT(Studentid) AS Count_students
    FROM course
    LEFT JOIN student ON student.CourseId = course.CourseId
    GROUP BY course.CourseId;


	SELECT Studentid,Student_Name,Student_Gender,Student_DOB,Student_Email,Student_Mark FROM student s INNER JOIN course c ON s.CourseId = c.CourseId WHERE Coursetype='DEGREE';



	SELECT Studentid,Student_Name,Student_Gender,Student_DOB,Student_Email,Student_Mark FROM student s INNER JOIN course c ON s.CourseId = c.CourseId WHERE Coursetype='POST GRADUATE';

		  SELECT Studentid,Student_DOB,Student_Email FROM student s INNER JOIN course c ON s.CourseId = c.CourseId  WHERE Courseshortname='BCA' ;  


SELECT     Studentid,Student_Name,Student_Gender,Student_DOB,Student_Email,Student_Mark,Coursename,Batchname FROM student s 
	   INNER JOIN course c ON s.CourseId = c.CourseId
	   INNER JOIN batch b ON s.BatchId = b.BatchId;


SELECT MAX(Batchname) AS Batch_name, COUNT(Studentid) AS Count_students
    FROM batch
    LEFT JOIN student ON student.BatchId = batch.BatchId
    GROUP BY batch.BatchId;

SELECT Studentid,Student_Name,Student_Email ,Coursename FROM student s INNER JOIN course c ON s.CourseId = c.CourseId  ;  

SELECT Studentid,Student_Name,Student_Gender,Student_DOB,Student_Email,Student_Mark,
Batchname FROM student s INNER JOIN batch b ON s.BatchId = b.BatchId ;




  SELECT Studentid,Student_Name,Student_DOB,Student_Email,Courseshortname FROM student s INNER JOIN course c ON s.CourseId = c.CourseId WHERE Courseshortname='MCA'AND Student_Gender='Female';


  SELECT Studentid,Student_Name,Student_Gender,Student_DOB,Student_Email,Student_Mark FROM student s INNER JOIN course c ON s.CourseId = c.CourseId WHERE Coursetype='POST GRADUATE'AND Student_Gender='Male';


  SELECT Studentid,Student_Name,Student_Gender,Student_DOB,Student_Email,Student_Mark FROM student ORDER BY Student_DOB DESC;

  SELECT * FROM student WHERE Student_Mark BETWEEN 65 and 91;

  SELECT Studentid,Student_Name,Student_Gender,Student_DOB,Student_Email,Student_Mark,Courseshortname FROM student s INNER JOIN course c ON s.CourseId = c.CourseId  WHERE Courseshortname='BCA' ORDER BY Student_Mark;  


  SELECT Batchname,BatchId, SUM(CASE WHEN Student_Gender = 'Male' THEN 1 ELSE 0 END) as Total_Male,
       SUM(CASE WHEN Student_Gender = 'Female' THEN 1 ELSE 0 END) as Total_Female FROM student,batch
 GROUP BY Batchname,BatchId;












