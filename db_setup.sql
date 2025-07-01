DROP DATABASE IF EXISTS coursework;

CREATE DATABASE coursework;

USE coursework;

-- This is the Course table
 
DROP TABLE IF EXISTS Course;

CREATE TABLE Course (
Crs_Code 	INT UNSIGNED NOT NULL,
Crs_Title 	VARCHAR(255) NOT NULL,
Crs_Enrollment INT UNSIGNED,
PRIMARY KEY (Crs_code));


INSERT INTO Course VALUES 
(100,'BSc Computer Science', 150),
(101,'BSc Computer Information Technology', 20),
(200, 'MSc Data Science', 100),
(201, 'MSc Security', 30),
(210, 'MSc Electrical Engineering', 70),
(211, 'BSc Physics', 100);


-- This is the student table definition


DROP TABLE IF EXISTS Student;

CREATE TABLE Student (
URN INT UNSIGNED NOT NULL,
Stu_FName 	VARCHAR(255) NOT NULL,
Stu_LName 	VARCHAR(255) NOT NULL,
Stu_DOB 	DATE,
Stu_Phone 	VARCHAR(12),
Stu_Course	INT UNSIGNED NOT NULL,
Stu_Type 	ENUM('UG', 'PG'),
PRIMARY KEY (URN),
FOREIGN KEY (Stu_Course) REFERENCES Course (Crs_Code)
ON DELETE RESTRICT);


INSERT INTO Student VALUES
(612345, 'Damon', 'Salvatore', '2002-06-20', '01483112233', 100, 'UG'),
(612346, 'Matt', 'Donovan', '2002-03-12', '01483223344', 100, 'UG'),
(612347, 'Caroline', 'Forbes', '2001-05-03', '01483334455', 100, 'UG'),
(612348, 'Tyler', 'Lockwood', '2002-04-21', '01483445566', 100, 'UG'),
(612349, 'Elena', 'Gilbert', '2001-12-29', '01483778899', 100, 'UG'),
(612350, 'Stefan', 'Salvatore', '2002-06-07', '01483123456', 100, 'UG'),
(612351, 'Bonnie', 'Bennett', '2002-07-02', '01483234567', 100, 'UG'),
(612352, 'Alaric', 'Saltzman', '2001-10-24',  '01483456789', 101, 'UG'),
(612353, 'Niklaus', 'Mikealson', '2002-08-23', '01483998877', 101, 'UG'),
(612354, 'Jeremy', 'Gilbert', '2002-05-16', '01483776655', 101, 'UG');

DROP TABLE IF EXISTS Undergraduate;

CREATE TABLE Undergraduate (
UG_URN 	INT UNSIGNED NOT NULL,
UG_Credits   INT NOT NULL,
CHECK (60 <= UG_Credits <= 150),
PRIMARY KEY (UG_URN),
FOREIGN KEY (UG_URN) REFERENCES Student(URN)
ON DELETE CASCADE);

INSERT INTO Undergraduate VALUES
(612345, 120),
(612346, 90),
(612347, 150),
(612348, 120),
(612349, 120),
(612350, 60),
(612351, 60),
(612352, 90),
(612353, 120),
(612354, 90);

DROP TABLE IF EXISTS Postgraduate;

CREATE TABLE Postgraduate (
PG_URN 	INT UNSIGNED NOT NULL,
Thesis  VARCHAR(512) NOT NULL,
PRIMARY KEY (PG_URN),
FOREIGN KEY (PG_URN) REFERENCES Student(URN)
ON DELETE CASCADE);


-- Table definitions below this line.......
CREATE TABLE Societies (
Society_ID INT UNSIGNED NOT NULL,
S_Name 	VARCHAR(255) NOT NULL,
PRIMARY KEY (Society_ID),
UNIQUE (S_Name)
);

INSERT INTO Societies VALUES
(1, 'Ballroom and Latin American Dance'),
(2, 'Electronics and Amateur Radio Society');

CREATE TABLE S_Email(
Society_ID INT UNSIGNED NOT NULL,
S_Email    VARCHAR(255) NOT NULL,
Details    VARCHAR(255),
UNIQUE(S_Email),
PRIMARY KEY (Society_ID, S_Email),
FOREIGN KEY(Society_ID) REFERENCES Societies(Society_ID)
ON DELETE CASCADE
);

INSERT INTO S_Email VALUES
(1, 'ussu.ballroom@surrey.ac.uk','All enquiries'),
(2, 'join@surreyears.co.uk', 'Joining enquiry.'),
(2, 'hello@surreyears.co.uk', 'General enquiry.'),
(2, 'radio@surreyears.co.uk', 'Radio-based queries.'),
(2, 'events@surreyears.co.uk', 'Event or collaboration queries.'),
(2, 'space@surreyears.co.uk', 'Events or collaboration.');

CREATE TABLE Hobby(
Hobby_ID INT UNSIGNED NOT NULL,
H_Name VARCHAR(255) NOT NULL,
PRIMARY KEY (Hobby_ID),
UNIQUE (H_Name)
);

INSERT INTO Hobby VALUES
(1, 'Reading'),
(2, 'Hiking'),
(3, 'Chess'),
(4, 'Taichi'),
(5, 'Ballroom'),
(6, 'Dancing'),
(7, 'Football'),
(8, 'Tennis'),
(9, 'Rugby'),
(10, 'Climbing'),
(11, 'Rowing');

CREATE TABLE Activity(
URN INT UNSIGNED NOT NULL,
Hobby_ID INT UNSIGNED NOT NULL,
Frequency ENUM('Rarely', 'Occasionally','Frequently', 'Very Frequently'),
PRIMARY KEY (URN, Hobby_ID),
FOREIGN KEY (URN) REFERENCES Student(URN),
FOREIGN KEY (Hobby_ID) REFERENCES Hobby(Hobby_ID)
ON DELETE CASCADE);

INSERT INTO Activity VALUES
(612345, 1, 'Frequently'),
(612346, 2, 'Rarely'),
(612347, 6, 'Frequently'),
(612347, 7, 'Occasionally'),
(612345, 8, 'Rarely'),
(612348, 10, 'Frequently'),
(612349, 3, 'Occasionally'),
(612350, 4, 'Rarely'),
(612350, 5, 'Occasionally'),
(612353, 2, 'Frequently'),
(612354, 8, 'Frequently'),
(612354, 7, 'Occasionally'),
(612346, 9, 'Occasionally');


CREATE TABLE BLDC (
Society_ID  INT UNSIGNED NOT NULL,
URN         INT UNSIGNED NOT NULL,
Mem_Type 	ENUM('COMMITTEE', 'NON-COMMITTEE'),
Mem_Start   DATE,
F_Dance     VARCHAR(255),
PRIMARY KEY (URN, Society_ID),
FOREIGN KEY (URN) REFERENCES Student (URN),
FOREIGN KEY (Society_ID) REFERENCES Societies(Society_ID)
ON DELETE CASCADE,
CHECK (YEAR(Mem_Start) <= 2024)
);

INSERT INTO BLDC VALUES
(1, 612345, 'COMMITTEE', '2021-09-18', 'Viennese waltz and Paso Doble'),
(1, 612346, 'COMMITTEE', '2022-09-18', 'Viennese, Tango and Rumba'),
(1, 612353, 'NON-COMMITTEE', '2020-09-18', 'Waltz or Cha'),
(1, 612354, 'NON-COMMITTEE', '2022-09-18', 'Quickstep/ tango and Samba'),
(1, 612351, 'NON-COMMITTEE', '2023-09-24', 'Tango');

CREATE TABLE BLDC_COMMITTEE (
Society_ID 	INT UNSIGNED NOT NULL,
URN         INT UNSIGNED NOT NULL,
Role        ENUM('President', 'Vice-President', 'Treasurer', 'Vice Team Captain', 'Wardrobe Officer'),
Term_Start DATE,
Term_End   DATE,
PRIMARY KEY (URN, Society_ID),
FOREIGN KEY (URN) REFERENCES Student(URN),
FOREIGN KEY (Society_ID) REFERENCES Societies(Society_ID)
ON DELETE CASCADE);

INSERT INTO BLDC_COMMITTEE VALUES
(1, 612345, 'President', '2023-09-28', '2024-09-18'),
(1, 612346, 'Vice-President', '2023-09-28', '2024-09-18');

CREATE TABLE BLDC_NONCOMMITTEE(
Society_ID 	INT UNSIGNED NOT NULL,
URN         INT UNSIGNED NOT NULL,
M_Status    ENUM('Active','Inactive'),
FOREIGN KEY (URN) REFERENCES Student(URN),
FOREIGN KEY (Society_ID) REFERENCES Societies(Society_ID)
ON DELETE CASCADE);

INSERT INTO BLDC_NONCOMMITTEE VALUES
(1, 612353, 'Inactive'),
(1, 612354, 'Active'),
(1, 612351, 'Active');

CREATE TABLE EARS (
Society_ID  INT UNSIGNED NOT NULL,
URN         INT UNSIGNED NOT NULL,
Mem_Type 	ENUM('COMMITTEE', 'NON-COMMITTEE'),
Mem_Start   DATE,
PRIMARY KEY (URN, Society_ID),
FOREIGN KEY (URN) REFERENCES Student (URN),
FOREIGN KEY (Society_ID) REFERENCES Societies(Society_ID)
ON DELETE CASCADE,
CHECK (YEAR(Mem_Start) <= 2024)
);

INSERT INTO EARS VALUES
(2, 612350, 'COMMITTEE', '2020-11-12'),
(2, 612352, 'COMMITTEE', '2019-10-30'),
(2, 612347, 'NON-COMMITTEE', '2021-08-21'),
(2, 612349, 'NON-COMMITTEE', '2022-09-24');

CREATE TABLE EARS_COMMITTEE (
Society_ID  INT UNSIGNED NOT NULL,
URN         INT UNSIGNED NOT NULL,
Role        ENUM('President', 'Vice-President', 'Treasurer', 'Electronics Officer', 'Publicity Officer'),
Term_Start  DATE,
Term_End    DATE,
PRIMARY KEY (URN, Society_ID),
FOREIGN KEY (URN) REFERENCES Student(URN),
FOREIGN KEY (Society_ID) REFERENCES Societies(Society_ID)
ON DELETE CASCADE);

INSERT INTO EARS_COMMITTEE VALUES
(2, 612350, 'President', '2023-09-30', '2024-09-18'),
(2, 612352, 'Vice-President', '2023-09-30', '2024-09-18');

CREATE TABLE EARS_NONCOMMITTEE(
Society_ID  INT UNSIGNED NOT NULL,
URN         INT UNSIGNED NOT NULL,
M_Status    ENUM('Active','Inactive'),
FOREIGN KEY (URN) REFERENCES Student(URN),
FOREIGN KEY (Society_ID) REFERENCES Societies(Society_ID)
ON DELETE CASCADE);

INSERT INTO EARS_NONCOMMITTEE VALUES
(2, 612347, 'Active'),
(2, 612349, 'Active');
