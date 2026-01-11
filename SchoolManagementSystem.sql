CREATE TABLE Students (
    StudentID INT IDENTITY(1,1) PRIMARY KEY,
    FullName CHAR(150) NOT NULL,
    DateOfBirth DATE,
    Address CHAR(250),
    Gender CHAR(10)
);


CREATE TABLE Family_Info (
    FamilyID INT IDENTITY(1,1) PRIMARY KEY,
    StudentID INT,
    FatherName CHAR(150),
    FatherPhone CHAR(20),
    FatherEmail CHAR(150),
    CONSTRAINT FK_Family_Student
        FOREIGN KEY (StudentID) REFERENCES Students(StudentID)
);


CREATE TABLE Courses (
    CourseID INT IDENTITY(1,1) PRIMARY KEY,
    CourseName CHAR(150) NOT NULL,
    Description CHAR(300),
    Resource CHAR(200)
);


CREATE TABLE Classes (
    ClassID INT IDENTITY(1,1) PRIMARY KEY,
    ClassCode CHAR(50) NOT NULL,
    RoomNumber CHAR(20),
    Schedule CHAR(100)
);


CREATE TABLE Assignments (
    AssignmentID INT IDENTITY(1,1) PRIMARY KEY,
    StudentID INT,
    CourseID INT,
    AssignmentName CHAR(150),
    Description CHAR(300),
    DueDate DATE,
    Status CHAR(10) CHECK (Status IN ('Pass', 'Failed')),
    CONSTRAINT FK_Assignment_Student
        FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    CONSTRAINT FK_Assignment_Course
        FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);


INSERT INTO Students (FullName, DateOfBirth, Address, Gender)
VALUES
('Raghad Als', '2002-05-12', 'Amman', 'Female'),
('Sara Al', '2001-11-20', 'Irbid', 'Female');



INSERT INTO Family_Info (StudentID, FatherName, FatherPhone, FatherEmail)
VALUES
(1, 'Rag Al', '0791234567', 'rag@gmail.com'),
(2, 'Sara A', '0781234567', 'sara@gmail.com');



INSERT INTO Courses (CourseName, Description, Resource)
VALUES
('Database Systems', 'Introduction to SQL and databases', 'SQL Server Book'),
('Web Development', 'HTML, CSS, JavaScript', 'Online Tutorials');


INSERT INTO Classes (ClassCode, RoomNumber, Schedule)
VALUES
('DB101', 'Room A1', 'Sun-Tue 10:00-12:00'),
('WEB202', 'Room B2', 'Mon-Wed 12:00-14:00');


INSERT INTO Assignments (StudentID, CourseID, AssignmentName, Description, DueDate, Status)
VALUES
(1, 1, 'SQL Basics', 'Basic SQL queries', '2026-02-01', 'Pass'),
(2, 1, 'Joins Practice', 'Inner and Outer Joins', '2026-02-05', 'Failed');


SELECT * FROM Students;


SELECT 
    S.FullName,
    F.FatherName,
    F.FatherPhone
FROM Students S
INNER JOIN Family_Info F
ON S.StudentID = F.StudentID;


SELECT 
    S.FullName,
    C.CourseName,
    A.AssignmentName,
    A.Status
FROM Assignments A
INNER JOIN Students S ON A.StudentID = S.StudentID
INNER JOIN Courses C ON A.CourseID = C.CourseID;


SELECT 
    S.FullName,
    A.AssignmentName
FROM Assignments A
JOIN Students S ON A.StudentID = S.StudentID
WHERE A.Status = 'Failed';


ALTER TABLE Students
ADD Email CHAR(150);





