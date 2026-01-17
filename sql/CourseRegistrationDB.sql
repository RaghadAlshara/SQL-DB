CREATE TABLE Departments (
    Department_ID INT PRIMARY KEY,
    Department_Name VARCHAR(100) NOT NULL
);


CREATE TABLE Instructors (
    Instructor_ID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Department_ID INT,
    Email VARCHAR(100),
    FOREIGN KEY (Department_ID) REFERENCES Departments(Department_ID)
);


CREATE TABLE Courses (
    Course_ID INT PRIMARY KEY,
    Course_Name VARCHAR(100),
    Instructor_ID INT,
    Credits INT,
    Department_ID INT,
    FOREIGN KEY (Instructor_ID) REFERENCES Instructors(Instructor_ID),
    FOREIGN KEY (Department_ID) REFERENCES Departments(Department_ID)
);


CREATE TABLE Students (
    Student_ID INT PRIMARY KEY,
    First_Name VARCHAR(50),
    Last_Name VARCHAR(50),
    Email VARCHAR(100),
    Phone_Number VARCHAR(20),
    Enrollment_Date DATE
);


CREATE TABLE Enrollments (
    Enrollment_ID INT PRIMARY KEY,
    Student_ID INT,
    Course_ID INT,
    Enrollment_Date DATE,
    Status VARCHAR(20),
    FOREIGN KEY (Student_ID) REFERENCES Students(Student_ID),
    FOREIGN KEY (Course_ID) REFERENCES Courses(Course_ID)
);


CREATE TABLE Course_Requirements (
    Course_ID INT,
    Prerequisite_Course_ID INT,
    FOREIGN KEY (Course_ID) REFERENCES Courses(Course_ID),
    FOREIGN KEY (Prerequisite_Course_ID) REFERENCES Courses(Course_ID)
);


INSERT INTO Departments VALUES
(1, 'Computer Engineering'),
(2, 'Electrical Power Engineering'),
(3, 'Biomedical Engineering'),
(4, 'Telecommunication Engineering'),
(5, 'Electronics Engineering');


SELECT s.*
FROM Students s
JOIN Enrollments e ON s.Student_ID = e.Student_ID
WHERE e.Course_ID = 101;


INSERT INTO Students VALUES
(1, 'Ali', 'Ahmad', 'ali@email.com', '0790000000', '2025-09-01'),
(2, 'Sara', 'Omar', 'sara@email.com', '0781111111', '2025-09-01'),
(3, 'Yousef', 'Khaled', 'yousef@email.com', '0772222222', '2025-09-01'),
(4, 'Lina', 'Hassan', 'lina@email.com', '0793333333', '2025-09-01'),
(5, 'Omar', 'Salem', 'omar@email.com', '0784444444', '2025-09-01'),
(6, 'Raghad', 'Alshare', 'raghad@email.com', '0791234567','2025-09-01');


INSERT INTO Instructors (Instructor_ID, Name, Department_ID, Email) VALUES
(1, 'Dr. Ahmad Ahmed', 1, 'ahmad.ahmed@univ.edu'),
(2, 'Dr. Sara Sarah', 1, 'sara.sarah@univ.edu'),
(3, 'Dr. Yousef Joseph', 2, 'yousef.joseph@univ.edu'),
(4, 'Dr. Lina Leena', 3, 'lina.leena@univ.edu'),
(5, 'Dr. Omar Omer', 1, 'omar.omer@univ.edu');


INSERT INTO Courses VALUES
(101, 'Databases', 1, 3, 1),
(102, 'Web Development', 2, 3, 1),
(103, 'Bioinformatics', 3, 4, 1),
(104, 'Statistics', 4, 3, 1),
(105, 'Security', 5, 3, 1);



UPDATE Enrollments
SET Status = 'Completed'
WHERE Student_ID = 1 AND Course_ID = 101;



SELECT Course_Name
FROM Courses
WHERE Instructor_ID = 3;


SELECT s.First_Name, s.Last_Name
FROM Students s
JOIN Enrollments e ON s.Student_ID = e.Student_ID
WHERE e.Course_ID = 101 AND e.Status = 'Completed';


SELECT Course_Name
FROM Courses
WHERE Department_ID = 1;


INSERT INTO Enrollments
VALUES (10, 2, 103, '2026-01-15', 'Enrolled');


SELECT s.Student_ID, s.First_Name
FROM Students s
WHERE s.Student_ID NOT IN (
    SELECT e.Student_ID
    FROM Enrollments e
    JOIN Course_Requirements cr ON e.Course_ID = cr.Prerequisite_Course_ID
    WHERE e.Status = 'Completed'
);


SELECT Student_ID FROM Students;
SELECT Course_ID FROM Courses;



