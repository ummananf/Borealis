-- We must create restrictions in our logic code to not allow some users to be in tables (like students can't be in Teaches table)
-- Note the syntax must be specific otherwise there are errors
/*
DROP TABLE DegreeChoice;
DROP TABLE DegreeCourses; 
DROP TABLE Degrees;
DROP TABLE Teaches; 
DROP TABLE Enrolled; 
DROP TABLE Sections;
DROP TABLE Prereqs; 
DROP TABLE Courses; 
DROP TABLE UserPrivs; 
DROP TABLE Users;
*/


CREATE TABLE Users
(
	userID int PRIMARY KEY, 
	username varchar(20) UNIQUE NOT NULL, 
	password varchar(50), 
	email varchar(50) UNIQUE NOT NULL, 
	fName varchar(20), 
	lName varchar(20),
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
	degProgram varchar(50) NOT NULL,
	degOption varchar(50) NOT NULL,
	degName varchar(50) UNIQUE,
	totalCreditHrs int,
	PRIMARY KEY(degProgram, degOption)
);
CREATE TABLE DegreeCourses
(
	degProgram varchar(50) NOT NULL,
	degOption varchar(50) NOT NULL,
	cID varchar(10) NOT NULL,
	PRIMARY KEY(degProgram, degOption, cID),
	FOREIGN KEY(degProgram, degOption) REFERENCES Degrees(degProgram, degOption) ON DELETE CASCADE,
	FOREIGN KEY(cID) REFERENCES Courses(cID)
);
CREATE TABLE DegreeChoice
(
	userID int NOT NULL,
	degProgram varchar(50) NOT NULL,
	degOption varchar(50) NOT NULL,
	PRIMARY KEY(userID, degProgram, degOption),
	FOREIGN KEY(userID) REFERENCES Users(userID),
	FOREIGN KEY(degProgram, degOption) REFERENCES Degrees(degProgram, degOption)
);



INSERT INTO Users VALUES (1, 'admin1', 'password', 'admin1@school.ca', 'john', 'johnson', 'admin');
INSERT INTO Users VALUES (2, 'student1', 'password', 'student1@school.ca', 'carl', 'carlson', 'student');

-- INSERT INTO UserPrivs VALUES (1, 'admin');
-- INSERT INTO UserPrivs VALUES (2, 'student');

INSERT INTO Courses VALUES ('COMP1010', 'Intro to Computer Science', 3, 'Science', 'Computer Science', 'Introduces you to computer science.');
INSERT INTO Courses VALUES ('COMP1020', 'Intro to Computer Science 2', 3, 'Science', 'Computer Science', 'Introduces you to more computer science!');

INSERT INTO Prereqs VALUES ('COMP1010', 'COMP1020', 2.0);

INSERT INTO Sections VALUES ('A01', 'COMP1010', '2014-09-01', 100, 'MWF', '13:30:00', '14:20:00', 'E2-105');
INSERT INTO Sections VALUES ('A01', 'COMP1020', '2015-01-01', 100, 'MWF', '13:30:00', '14:20:00', 'E2-110');

INSERT INTO Enrolled VALUES (2, 'A01', 'COMP1010', '2014-09-01', 3.5);
INSERT INTO Enrolled VALUES (2, 'A01', 'COMP1020', '2015-01-01', NULL);

INSERT INTO Degrees VALUES ('Computer Science', 'Major', 'B.Sc. Computer Science (Major)', 120);
