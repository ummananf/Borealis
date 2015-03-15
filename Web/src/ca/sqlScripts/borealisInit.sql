-- We must create restrictions in our logic code to not allow some users to be in tables (like students can't be in Teaches table)
-- Note the syntax must be specific otherwise there are errors

DROP TABLE IF EXISTS DegreeChoice;
DROP TABLE IF EXISTS DegreeCourses; 
DROP TABLE IF EXISTS Degrees;
DROP TABLE IF EXISTS Teaches; 
DROP TABLE IF EXISTS Enrolled; 
DROP TABLE IF EXISTS Sections;
DROP TABLE IF EXISTS Prereqs; 
DROP TABLE IF EXISTS Courses; 
DROP TABLE IF EXISTS UserPrivs; 
DROP TABLE IF EXISTS Users;



CREATE TABLE Users
(
	userID int PRIMARY KEY, 
	username varchar(20) UNIQUE NOT NULL, 
	password varchar(50) NOT NULL, 
	email varchar(50) UNIQUE NOT NULL, 
	fName varchar(20), 
	lName varchar(20),
	degName varchar(50),
    userType varchar(20)
);
-- CREATE TABLE UserPrivs( userID int NOT NULL, userType varchar(20) NOT NULL, PRIMARY KEY(userID, userType), FOREIGN KEY(userID) REFERENCES Users(userID) );

CREATE TABLE Courses
(
	cID varchar(10) PRIMARY KEY, 
	cName varchar(50), 
	creditHrs smallint,
	faculty varchar(50),
	department varchar(50),
	description varchar(200)
);
CREATE TABLE Prereqs
(
	prereqCID varchar(10) NOT NULL,
	cID varchar(10) NOT NULL,
	minGrade FLOAT,
	PRIMARY KEY(prereqCID, cID),
	FOREIGN KEY(cID) REFERENCES Courses(cID),
	FOREIGN KEY(prereqCID) REFERENCES Courses(cID)
);
CREATE TABLE Sections
(
	sectID varchar(5) NOT NULL, 
	cID varchar(10) NOT NULL,
	termStart DATE NOT NULL,
	maxSize smallint,
	days varchar(7),
	startTime TIME, 
	endTime TIME, 
	location varchar(30), 
	PRIMARY KEY(sectID, cID, termStart), 
	FOREIGN KEY(cID) REFERENCES Courses(cID) ON DELETE CASCADE
);
CREATE TABLE Enrolled
(
	userID int NOT NULL, 
	sectID varchar(5) NOT NULL, 
	cID varchar(10) NOT NULL,
	termStart DATE NOT NULL,
	grade FLOAT, 
	PRIMARY KEY(userID, sectID, cID, termStart), 
	FOREIGN KEY(userID) REFERENCES Users(userID), 
	FOREIGN KEY(sectID, cID, termStart) REFERENCES Sections(sectID, cID, termStart)
);
CREATE TABLE Teaches
(
	userID int NOT NULL, 
	sectID varchar(5) NOT NULL, 
	cID varchar(10) NOT NULL,
	termStart DATE NOT NULL,
	PRIMARY KEY(userID, sectID, cID, termStart), 
	FOREIGN KEY(userID) REFERENCES Users(userID), 
	FOREIGN KEY(sectID, cID, termStart) REFERENCES Sections(sectID, cID, termStart)
);
CREATE TABLE Degrees
(
	term varchar(50) NOT NULL,
	degProgram varchar(50) NOT NULL,
	degOption varchar(50) NOT NULL,
	degName varchar(50) PRIMARY KEY,
	totalCreditHrs int
);
CREATE TABLE DegreeCourses
(
	degName varchar(50) NOT NULL,
	cID varchar(10) NOT NULL,
	PRIMARY KEY(degName, cID),
	FOREIGN KEY(degName) REFERENCES Degrees(degName) ON DELETE CASCADE,
	FOREIGN KEY(cID) REFERENCES Courses(cID)
);
CREATE TABLE DegreeChoice
(
	userID int NOT NULL,
	degName varchar(50) NOT NULL,
	PRIMARY KEY(userID, degName),
	FOREIGN KEY(userID) REFERENCES Users(userID),
	FOREIGN KEY(degName) REFERENCES Degrees(degName)
);



INSERT INTO Users VALUES (1, 'admin1', 'password', 'admin1@school.ca', 'john', 'johnson','B.Sc. Computer Science (Major)', 'admin');
INSERT INTO Users VALUES (2, 'student1', 'password', 'student1@school.ca', 'carl', 'carlson','B.Sc. Mathematics (Major)', 'student');

-- INSERT INTO UserPrivs VALUES (1, 'admin');
-- INSERT INTO UserPrivs VALUES (2, 'student');

-- Computer Science Courses:
-- First Year Courses
INSERT INTO Courses VALUES ('COMP1010', 'Intro to Computer Science', 3, 'Science', 'Computer Science', 'Introduces you to computer science.');
INSERT INTO Courses VALUES ('COMP1020', 'Intro to Computer Science 2', 3, 'Science', 'Computer Science', 'Introduces you to more computer science!');
INSERT INTO Courses VALUES ('COMP1260', 'Introductory Computer Usage 1', 3, 'Science', 'Computer Science', 'an introduction to modern computer services');
INSERT INTO Courses VALUES ('COMP1270', 'Introductory Computer Usage 2', 3, 'Science', 'Computer Science', 'Using advanced tools to design web pages');
INSERT INTO Courses VALUES ('COMP1012', 'Computer Programming for Scientists and Engineers', 3, 'Science', 'Computer Science', 'An introduction to computer programming suitable for solving problems in science and engineering');





INSERT INTO Courses VALUES ('BIO1030', 'Intro to Biological Science 2', 3, 'Science', 'Biology', 'Introduces you to bio science!');
INSERT INTO Courses VALUES ('BIO1040', 'Intro to Biological Science 2', 3, 'Science', 'Biology', 'Introduces you to bio science!');
INSERT INTO Courses VALUES ('ENV1010', 'Intro to Environmental Science 2', 3, 'Science', 'Environment', 'Introduces you to our world!');

INSERT INTO Prereqs VALUES ('COMP1010', 'COMP1020', 2.0);

INSERT INTO Sections VALUES ('A01', 'COMP1010', '2014-09-01', 100, 'MWF', '13:30:00', '14:20:00', 'E2-105');
INSERT INTO Sections VALUES ('A01', 'COMP1020', '2015-01-01', 100, 'MWF', '13:30:00', '14:20:00', 'E2-110');

INSERT INTO Enrolled VALUES (2, 'A01', 'COMP1010', '2014-09-01', 3.5);
INSERT INTO Enrolled VALUES (2, 'A01', 'COMP1020', '2015-01-01', NULL);

INSERT INTO Degrees VALUES ('Winter2015', 'Computer Science', 'Major', 'B.Sc. Computer Science (Major)', 120);
INSERT INTO Degrees VALUES ('Winter2015', 'Biology', 'Major', 'B.Sc. Biology (Major)', 120);
INSERT INTO Degrees VALUES ('Winter2015', 'Environment', 'Major', 'B.Sc. Environmental Science (Major)', 120);
INSERT INTO Degrees VALUES ('Fall2014', 'Mathematics', 'Major', 'B.Sc. Mathematics (Major)', 120);
INSERT INTO Degrees VALUES ('Fall2014', 'Architecture', 'Major', 'B.Sc. Architecture (Major)', 120);
INSERT INTO Degrees VALUES ('Fall2014', 'Astronomy', 'Major', 'B.Sc. Astronomy (Major)', 120);

