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
	crn varchar(6) PRIMARY KEY NOT NULL,
	sectID varchar(5) NOT NULL, 
	cID varchar(10) NOT NULL,
	termStart DATE NOT NULL,
	maxSize smallint,
	days varchar(7),
	startTime TIME, 
	endTime TIME, 
	location varchar(30), 
	FOREIGN KEY(cID) REFERENCES Courses(cID) ON DELETE CASCADE
);
CREATE TABLE Enrolled
(
	userID int NOT NULL,
	crn varchar(6) NOT NULL,
	sectID varchar(5) NOT NULL, 
	cID varchar(10) NOT NULL,
	termStart DATE NOT NULL,
	grade FLOAT, 
	PRIMARY KEY(userID, crn),
	FOREIGN KEY(userID) REFERENCES Users(userID),
	FOREIGN KEY(crn) REFERENCES Sections(crn)
);
CREATE TABLE Teaches
(
	userID int NOT NULL,
	crn varchar(6) NOT NULL,
	sectID varchar(5) NOT NULL, 
	cID varchar(10) NOT NULL,
	termStart DATE NOT NULL,
	PRIMARY KEY(userID, crn), 
	FOREIGN KEY(userID) REFERENCES Users(userID), 
	FOREIGN KEY(crn) REFERENCES Sections(crn)
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



--***************START TO INSERT TO Courses TABLE****************************************************************************************
-- Computer Science Courses:
-- First Year Computer Science Courses:
INSERT INTO Courses VALUES ('COMP1010', 'Intro to Computer Science', 3, 'Science', 'Computer Science', 'Introduces you to computer science.');
INSERT INTO Courses VALUES ('COMP1020', 'Intro to Computer Science 2', 3, 'Science', 'Computer Science', 'Introduces you to more computer science!');
INSERT INTO Courses VALUES ('COMP1260', 'Introductory Computer Usage 1', 3, 'Science', 'Computer Science', 'an introduction to modern computer services');
INSERT INTO Courses VALUES ('COMP1270', 'Introductory Computer Usage 2', 3, 'Science', 'Computer Science', 'Using advanced tools to design web pages');
INSERT INTO Courses VALUES ('COMP1012', 'Computer Programming for Scientists and Engineers', 3, 'Science', 'Computer Science', 'An introduction to computer programming suitable for solving problems in science and engineering');

-- Second Year Cmoputer Science Courses:
INSERT INTO Courses VALUES ('COMP2140', 'Data Structures and Algorithms', 3, 'Science', 'Computer Science', ' Introduction to the representation and manipulation of data structures');
INSERT INTO Courses VALUES ('COMP2150', 'Object Orientation', 3, 'Science', 'Computer Science', ' Design and development of object-oriented software');
INSERT INTO Courses VALUES ('COMP2160', 'Programming Practices', 3, 'Science', 'Computer Science', 'Introduction to issues involved in real-world computing');
INSERT INTO Courses VALUES ('COMP2280', 'Introduction to Computer Systems', 3, 'Science', 'Computer Science', 'assembly language programming');
INSERT INTO Courses VALUES ('COMP2130', 'Discrete Mathematics for Computer Science', 3, 'Science', 'Computer Science', 'An introduction to the set theory, logic, integers, combinatorics and functions');
INSERT INTO Courses VALUES ('COMP2080', 'Analysis of Algorithms', 3, 'Science', 'Computer Science', 'Methods of analyzing the time and space requirements of algorithms');

--Third Year Computer Science Courses:
INSERT INTO Courses VALUES ('COMP3010', 'Distributed Computing', 3, 'Science', 'Computer Science', 'An introduction to the development of client server and peer-to-peer systems through web applications, distributed programming models, and distributed algorithms. ');
INSERT INTO Courses VALUES ('COMP3170', 'Analysis of Algorithms and Data Structures', 3, 'Science', 'Computer Science', 'Fundamental algorithms for sorting, searching, storage management, graphs, databases and computational geometry. ');
INSERT INTO Courses VALUES ('COMP3350', 'Software Engineering 1', 3, 'Science', 'Computer Science', 'Introduction to software engineering');
INSERT INTO Courses VALUES ('COMP3430', 'Operating Systems', 3, 'Science', 'Computer Science', 'Operating systems, their design, implementation, and usage.');
INSERT INTO Courses VALUES ('COMP3020', 'Human-Computer Interaction 1', 3, 'Science', 'Computer Science', 'Human-computer interaction: human factors and usability, user-centered design, prototyping, usability evaluation.');
INSERT INTO Courses VALUES ('COMP3030', 'Automata Theory and Formal Languages', 3, 'Science', 'Computer Science', 'An introduction to automata theory, grammars, formal languages and their applications.');
INSERT INTO Courses VALUES ('COMP3040', 'Technical Communication in Computer Science', 3, 'Science', 'Computer Science', 'This course is designed to help students become more effective and confident writers in the context of the computing profession.');
INSERT INTO Courses VALUES ('COMP3190', 'Introduction to Artificial Intelligence', 3, 'Science', 'Computer Science', 'Principles of artificial intelligence: problem solving, knowledge representation and manipulation');
INSERT INTO Courses VALUES ('COMP3370', 'Computer Organization', 3, 'Science', 'Computer Science', 'Principles of computer systems architecture, organization and design.');
INSERT INTO Courses VALUES ('COMP3380', 'Databases Concepts and Usage', 3, 'Science', 'Computer Science', 'An introduction to database systems including the relational, hierarchical, network and entity-relationship models with emphasis on the relational model and SQL.');
INSERT INTO Courses VALUES ('COMP3490', 'Computer Graphics 1', 3, 'Science', 'Computer Science', 'An introductory course in computer graphics');
INSERT INTO Courses VALUES ('COMP3720', 'Computer Networks 1', 3, 'Science', 'Computer Science', ' This courses examines the principles of computer networks, including network architectures, algorithms, and performance.');


--Fourth Year Computer Science Courses:
INSERT INTO Courses VALUES ('COMP4140', 'Introduction to Cryptography and Cryptosystems', 3, 'Science', 'Computer Science', 'Description and analysis of cryptographic methods used in the authentication and protection of data.');
INSERT INTO Courses VALUES ('COMP4510', 'Introduction to Parallel Computation', 3, 'Science', 'Computer Science', 'An overview of the architectures of current parallel processors and the techniques used to program them.');
INSERT INTO Courses VALUES ('COMP4710', 'Introduction to Data Mining', 3, 'Science', 'Computer Science', 'Introduction to data mining concepts and their applications. ');
INSERT INTO Courses VALUES ('COMP4720', 'Computer Networks 2', 3, 'Science', 'Computer Science', 'This course examines advanced topics in computer networks, including network security, network management, performance, and multimedia networking.');
INSERT INTO Courses VALUES ('COMP4020', 'Human-Computer Interaction 2', 3, 'Science', 'Computer Science', 'This course examines advanced topics in computer networks, including network security, network management, performance, and multimedia networking.');
INSERT INTO Courses VALUES ('COMP4180', 'Intelligent Mobile Robotics', 3, 'Science', 'Computer Science', 'Topics include artificial intelligence, computer vision, human-robot interaction, and multi-robot systems. ');
INSERT INTO Courses VALUES ('COMP4190', 'Artificial Intelligence', 3, 'Science', 'Computer Science', 'Reasoning with temporal knowledge; causal reasoning; plausible reasoning; nonmonotonic reasoning; abductive reasoning.');
INSERT INTO Courses VALUES ('COMP4350', 'Software Engineering 2', 3, 'Science', 'Computer Science', 'Advanced treatment of software development methods.');
INSERT INTO Courses VALUES ('COMP4360', 'Machine Learning', 3, 'Science', 'Computer Science', ' Learning strategies; evaluation of learning; learning in symbolic systems; neural networks, genetic algorithms.');
INSERT INTO Courses VALUES ('COMP4380', 'Database Implementation', 3, 'Science', 'Computer Science', ' Implementation of modern database systems including query modification/optimization, recovery, concurrency, integrity, and distribution. ');
INSERT INTO Courses VALUES ('COMP4430', 'Operating Systems 2', 3, 'Science', 'Computer Science', '  Design and implementation of modern operating systems. Detailed analysis of an open source modern operating system and hands-on experience with its kernel and major components.');




-- Other Courses
INSERT INTO Courses VALUES ('BIO1030', 'Intro to Biological Science 2', 3, 'Science', 'Biology', 'Introduces you to bio science!');
INSERT INTO Courses VALUES ('BIO1040', 'Intro to Biological Science 2', 3, 'Science', 'Biology', 'Introduces you to bio science!');
INSERT INTO Courses VALUES ('ENV1010', 'Intro to Environmental Science 2', 3, 'Science', 'Environment', 'Introduces you to our world!');



--**********END OF INSERTING TO Courses Table*********************************************************************************************



INSERT INTO Prereqs VALUES ('COMP1010', 'COMP1020', 2.0);

INSERT INTO Sections VALUES ('10000','A01', 'COMP1010', '2014-09-01', 100, 'MWF', '13:30:00', '14:20:00', 'E2-105');
INSERT INTO Sections VALUES ('10001','A01', 'COMP1020', '2015-01-01', 100, 'MWF', '13:30:00', '14:20:00', 'E2-110');

INSERT INTO Enrolled VALUES (2, '10000','A01', 'COMP1010', '2014-09-01', 3.5);
INSERT INTO Enrolled VALUES (2, '10001','A01', 'COMP1020', '2015-01-01', NULL);

INSERT INTO Degrees VALUES ('Winter2015', 'Computer Science', 'Major', 'B.Sc. Computer Science (Major)', 120);
INSERT INTO Degrees VALUES ('Winter2015', 'Biology', 'Major', 'B.Sc. Biology (Major)', 120);
INSERT INTO Degrees VALUES ('Winter2015', 'Environment', 'Major', 'B.Sc. Environmental Science (Major)', 120);
INSERT INTO Degrees VALUES ('Fall2014', 'Mathematics', 'Major', 'B.Sc. Mathematics (Major)', 120);
INSERT INTO Degrees VALUES ('Fall2014', 'Architecture', 'Major', 'B.Sc. Architecture (Major)', 120);
INSERT INTO Degrees VALUES ('Fall2014', 'Astronomy', 'Major', 'B.Sc. Astronomy (Major)', 120);

