
CREATE DATABASE College;  
GO 

create table Students
(ID int identity(1,1) Primary Key Clustered,
 FName varchar(10),
 LName varchar(10),
 SSN int,
 Address text,
 City ntext,
 State ntext,
 Zip int,
 Phone bigint
 );

 alter table Students
 alter column SSN bigint;
 
Insert into Students(Fname, LName,SSN, Address,City,State,Zip,Phone )
VALUES ('Caroline', 'Avis', 5678432345, '123 High street','Cleveland','OH', 45632,3456783210),
       ('Jimmy', 'Will', 897650342, '32 Main Street', 'Wadsworth', 'OH', 43321, 3098765432),
	   ('Tan', 'Eric', 345897654, '12 E 30th Street', 'Brunswick','OH', 43654, 3098765478),
	   ('Laura', 'Noa', 567908765, '765 Orange Ave', 'Parma', 'OH', 45632, 3098704572)

select * from Students

create table Classes
(ID int identity(1,1) Primary Key Clustered,
Title varchar(10),
Number int,
Department varchar(10),
Students_ID int Not Null References Students(ID)
);

insert into Classes(Title, Number, Department, Students_ID)
values('Algebra', 101, 'Math', 3),
('Java', 230, 'IT',3),
('Economics', 330, 'Social',4),
('Chemistry', 301, 'Science', 5);

select * from Classes

delete from Classes
where id = 14

select Title,Department,Students_ID
from Classes where Students_ID = 4

create table Scores
(ID int identity(1,1) Primary Key Clustered,
Type varchar(10),
Description text,
DateAssigned datetime,
DateDue datetime,
DateSubmitted datetime,
PointsEarned int,
PointsPossible int,
Class_ID int Not Null References Classes(ID)
);

insert into Scores(Type, Description, DateAssigned, DateDue, DateSubmitted, PointsEarned, PointsPossible, Class_ID)
values('HW',' HomeWork', '08/23/2018','08/25/2018','08/26/2018',8,10, 3),
('Quiz',' Quiz', '08/25/2018','08/25/2018','08/25/2018',10,10, 2),
('Exam',' Exam', '08/27/2018','08/27/2018','08/27/2018',7,10, 1),
('HW',' HomeWork', '08/23/2018','08/28/2018','08/25/2018',10,10, 5);

select * from Classes


Delete from dbo.Classes where ID = 6

select * from Scores where Type='HW'

select * from Scores where Class_ID = 3