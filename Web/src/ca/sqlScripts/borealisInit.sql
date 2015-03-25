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
	description varchar(200),
	isFullYr boolean
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
	termStart varchar(50) NOT NULL,
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
--	sectID varchar(5) NOT NULL, 
--	cID varchar(10) NOT NULL,
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
	term varchar(50) NOT NULL,
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
INSERT INTO Users VALUES (7651245, 'bob', '4350', 'bob@school.ca', 'Bob', 'Carslon','B.Sc. Computer Science (Major)', 'student');
INSERT INTO Users VALUES (7651785, 'alice', '4350', 'alice@umanitoba.ca', 'Alice', 'Queen','B.Sc. Computer Science (Co-op)', 'student');
INSERT INTO Users VALUES (6812459, 'frank', '4350', 'frank@umanitoba.ca', 'Frank', 'Frank','B.Sc. Computer Science (Honor)', 'student');
INSERT INTO Users VALUES (3, 'jason', '123456', 'jason@myumanitoba.ca','Jason', 'King', 'B.Sc. Computer Science (Major)', 'student');
INSERT INTO Users VALUES (4, 'Francis','654321', 'frank@myumanitoba.ca','Francis','King','B.Sc. Computer Science (Major)','student');
INSERT INTO Users VALUES (5, 'Kevin','123','Kevin@uwaterloo.ca','Kevin','Queen','B.Sc. Computer Science (Major)','student');

-- INSERT INTO UserPrivs VALUES (1, 'admin');
-- INSERT INTO UserPrivs VALUES (2, 'student');



-- ***************START TO INSERT TO Courses TABLE****************************************************************************************
-- Computer Science Courses:
-- First Year Computer Science Courses:
INSERT INTO Courses VALUES ('COMP1010', 'Intro to Computer Science', 3, 'Science', 'Computer Science', 'Introduces you to computer science.', FALSE);
INSERT INTO Courses VALUES ('COMP1020', 'Intro to Computer Science 2', 3, 'Science', 'Computer Science', 'Introduces you to more computer science!', FALSE);
INSERT INTO Courses VALUES ('COMP1260', 'Introductory Computer Usage 1', 3, 'Science', 'Computer Science', 'an introduction to modern computer services', FALSE);
INSERT INTO Courses VALUES ('COMP1270', 'Introductory Computer Usage 2', 3, 'Science', 'Computer Science', 'Using advanced tools to design web pages', FALSE);
INSERT INTO Courses VALUES ('COMP1012', 'Computer Programming for Scientists and Engineers', 3, 'Science', 'Computer Science', 'An introduction to computer programming suitable for solving problems in science and engineering', FALSE);

-- Second Year Cmoputer Science Courses:
INSERT INTO Courses VALUES ('COMP2140', 'Data Structures and Algorithms', 3, 'Science', 'Computer Science', ' Introduction to the representation and manipulation of data structures', FALSE);
INSERT INTO Courses VALUES ('COMP2150', 'Object Orientation', 3, 'Science', 'Computer Science', ' Design and development of object-oriented software', FALSE);
INSERT INTO Courses VALUES ('COMP2160', 'Programming Practices', 3, 'Science', 'Computer Science', 'Introduction to issues involved in real-world computing', FALSE);
INSERT INTO Courses VALUES ('COMP2280', 'Introduction to Computer Systems', 3, 'Science', 'Computer Science', 'assembly language programming', FALSE);
INSERT INTO Courses VALUES ('COMP2130', 'Discrete Mathematics for Computer Science', 3, 'Science', 'Computer Science', 'An introduction to the set theory, logic, integers, combinatorics and functions', FALSE);
INSERT INTO Courses VALUES ('COMP2080', 'Analysis of Algorithms', 3, 'Science', 'Computer Science', 'Methods of analyzing the time and space requirements of algorithms', FALSE);

-- Third Year Computer Science Courses:
INSERT INTO Courses VALUES ('COMP3010', 'Distributed Computing', 3, 'Science', 'Computer Science', 'An introduction to the development of client server and peer-to-peer systems through web applications, distributed programming models, and distributed algorithms. ', FALSE);
INSERT INTO Courses VALUES ('COMP3170', 'Analysis of Algorithms and Data Structures', 3, 'Science', 'Computer Science', 'Fundamental algorithms for sorting, searching, storage management, graphs, databases and computational geometry. ', FALSE);
INSERT INTO Courses VALUES ('COMP3350', 'Software Engineering 1', 3, 'Science', 'Computer Science', 'Introduction to software engineering', FALSE);
INSERT INTO Courses VALUES ('COMP3430', 'Operating Systems', 3, 'Science', 'Computer Science', 'Operating systems, their design, implementation, and usage.', FALSE);
INSERT INTO Courses VALUES ('COMP3020', 'Human-Computer Interaction 1', 3, 'Science', 'Computer Science', 'Human-computer interaction: human factors and usability, user-centered design, prototyping, usability evaluation.', FALSE);
INSERT INTO Courses VALUES ('COMP3030', 'Automata Theory and Formal Languages', 3, 'Science', 'Computer Science', 'An introduction to automata theory, grammars, formal languages and their applications.', FALSE);
INSERT INTO Courses VALUES ('COMP3040', 'Technical Communication in Computer Science', 3, 'Science', 'Computer Science', 'This course is designed to help students become more effective and confident writers in the context of the computing profession.', FALSE);
INSERT INTO Courses VALUES ('COMP3190', 'Introduction to Artificial Intelligence', 3, 'Science', 'Computer Science', 'Principles of artificial intelligence: problem solving, knowledge representation and manipulation', FALSE);
INSERT INTO Courses VALUES ('COMP3370', 'Computer Organization', 3, 'Science', 'Computer Science', 'Principles of computer systems architecture, organization and design.', FALSE);
INSERT INTO Courses VALUES ('COMP3380', 'Databases Concepts and Usage', 3, 'Science', 'Computer Science', 'An introduction to database systems including the relational, hierarchical, network and entity-relationship models with emphasis on the relational model and SQL.', FALSE);
INSERT INTO Courses VALUES ('COMP3490', 'Computer Graphics 1', 3, 'Science', 'Computer Science', 'An introductory course in computer graphics', FALSE);
INSERT INTO Courses VALUES ('COMP3720', 'Computer Networks 1', 3, 'Science', 'Computer Science', ' This courses examines the principles of computer networks, including network architectures, algorithms, and performance.', FALSE);


-- Fourth Year Computer Science Courses:
INSERT INTO Courses VALUES ('COMP4140', 'Introduction to Cryptography and Cryptosystems', 3, 'Science', 'Computer Science', 'Description and analysis of cryptographic methods used in the authentication and protection of data.', FALSE);
INSERT INTO Courses VALUES ('COMP4510', 'Introduction to Parallel Computation', 3, 'Science', 'Computer Science', 'An overview of the architectures of current parallel processors and the techniques used to program them.', FALSE);
INSERT INTO Courses VALUES ('COMP4710', 'Introduction to Data Mining', 3, 'Science', 'Computer Science', 'Introduction to data mining concepts and their applications. ', FALSE);
INSERT INTO Courses VALUES ('COMP4720', 'Computer Networks 2', 3, 'Science', 'Computer Science', 'This course examines advanced topics in computer networks, including network security, network management, performance, and multimedia networking.', FALSE);
INSERT INTO Courses VALUES ('COMP4020', 'Human-Computer Interaction 2', 3, 'Science', 'Computer Science', 'This course examines advanced topics in computer networks, including network security, network management, performance, and multimedia networking.', FALSE);
INSERT INTO Courses VALUES ('COMP4180', 'Intelligent Mobile Robotics', 3, 'Science', 'Computer Science', 'Topics include artificial intelligence, computer vision, human-robot interaction, and multi-robot systems. ', FALSE);
INSERT INTO Courses VALUES ('COMP4190', 'Artificial Intelligence', 3, 'Science', 'Computer Science', 'Reasoning with temporal knowledge; causal reasoning; plausible reasoning; nonmonotonic reasoning; abductive reasoning.', FALSE);
INSERT INTO Courses VALUES ('COMP4350', 'Software Engineering 2', 3, 'Science', 'Computer Science', 'Advanced treatment of software development methods.', FALSE);
INSERT INTO Courses VALUES ('COMP4360', 'Machine Learning', 3, 'Science', 'Computer Science', ' Learning strategies; evaluation of learning; learning in symbolic systems; neural networks, genetic algorithms.', FALSE);
INSERT INTO Courses VALUES ('COMP4380', 'Database Implementation', 3, 'Science', 'Computer Science', ' Implementation of modern database systems including query modification/optimization, recovery, concurrency, integrity, and distribution. ', FALSE);
INSERT INTO Courses VALUES ('COMP4430', 'Operating Systems 2', 3, 'Science', 'Computer Science', '  Design and implementation of modern operating systems. Detailed analysis of an open source modern operating system and hands-on experience with its kernel and major components.', FALSE);




-- Other Courses
INSERT INTO Courses VALUES ('BIO1030', 'Intro to Biological Science 2', 3, 'Science', 'Biology', 'Introduces you to bio science!', FALSE);
INSERT INTO Courses VALUES ('BIO1040', 'Intro to Biological Science 2', 3, 'Science', 'Biology', 'Introduces you to bio science!', FALSE);
INSERT INTO Courses VALUES ('ENV1010', 'Intro to Environmental Science 2', 3, 'Science', 'Environment', 'Introduces you to our world!', TRUE);




-- **********END OF INSERTING TO Courses Table*********************************************************************************************



INSERT INTO Prereqs VALUES ('COMP1010', 'COMP1020', 2.0);



-- Computer Science Sections info
INSERT INTO Sections VALUES ('10000','A01', 'COMP1010', 'Fall2014', 100, 'MWF', '13:30:00', '14:20:00', 'E2-105');
INSERT INTO Sections VALUES ('10001','A02', 'COMP1010', 'Fall2014', 105, 'MWF', '9:30:00', '10:20:00', 'E2-105');
INSERT INTO Sections VALUES ('10002','A03', 'COMP1010', 'Fall2014', 80, 'TR', '10:00:00', '11:15:00', 'E2-330');
INSERT INTO Sections VALUES ('10003','A04', 'COMP1010', 'Fall2014', 175, 'TR', '12:30:00', '13:30:00', 'E3-270');
INSERT INTO Sections VALUES ('10004','A01', 'COMP1010', 'Winter2015', 100, 'MWF', '12:30:00', '13:20:00', 'E2-105');
INSERT INTO Sections VALUES ('10005','A02', 'COMP1010', 'Winter2015', 100, 'MWF', '14:30:00', '15:45:00', 'E2-105');

INSERT INTO Sections VALUES ('10010','A01', 'COMP1020', 'Fall2014', 175, 'MWF', '11:30:00', '12:20:00', 'E2-105');
INSERT INTO Sections VALUES ('10011','A02', 'COMP1020', 'Fall2014', 175, 'MWF', '11:30:00', '12:20:00', 'E3-270');
INSERT INTO Sections VALUES ('10012','A01', 'COMP1020', 'Winter2015', 85, 'MWF', '10:30:00', '11:20:00', 'E2-105');
INSERT INTO Sections VALUES ('10013','A02', 'COMP1020', 'Winter2015', 70, 'TR', '10:00:00', '11:15:00', 'Buller207');



INSERT INTO Sections VALUES ('10020','A01', 'COMP1260', 'Fall2014', 125, 'MWF', '11:30:00', '12:20:00', 'E2-110');
INSERT INTO Sections VALUES ('10021','A01', 'COMP1260', 'Winter2015', 175, 'MWF', '11:30:00', '12:20:00', 'E2-105');

INSERT INTO Sections VALUES ('10030','A01', 'COMP1270', 'Fall2014', 75, 'MWF', '11:30:00', '12:20:00', 'E2-105');
INSERT INTO Sections VALUES ('10031','A01', 'COMP1270', 'Winter2015', 105, 'MWF', '11:30:00', '12:20:00', 'E2-105');
INSERT INTO Sections VALUES ('10032','A02', 'COMP1270', 'Winter2015', 105, 'MWF', '10:30:00', '11:20:00', 'Buller207');

INSERT INTO Sections VALUES ('10040','A01', 'COMP2130', 'Fall2014', 100, 'MWF', '15:30:00', '16:20:00', 'E2-105');
INSERT INTO Sections VALUES ('10041','A01', 'COMP2130', 'Winter2015', 65, 'MWF', '15:30:00', '16:20:00', 'E2-155');

INSERT INTO Sections VALUES ('10050','A01', 'COMP2140', 'Fall2014', 90, 'TR', '14:30:00', '15:45:00', 'E2-110');
INSERT INTO Sections VALUES ('10051','A02', 'COMP2140', 'Fall2014', 90, 'MWF', '13:30:00', '14:20:00', 'E2-105');
INSERT INTO Sections VALUES ('10052','A01', 'COMP2140', 'Fall2015', 55, 'MWF', '9:30:00', '10:20:00', 'E2-330');

INSERT INTO Sections VALUES ('10060','A01', 'COMP2160', 'Fall2014', 90, 'TR', '11:30:00', '12:45:00', 'E2-105');
INSERT INTO Sections VALUES ('10061','A02', 'COMP2160', 'Fall2014', 90, 'TR', '8:30:00', '9:45:00', 'E2-105');
INSERT INTO Sections VALUES ('10062','A01', 'COMP2160', 'Winter2015', 60, 'MWF', '13:30:00', '14:20:00', 'E2-130');

INSERT INTO Sections VALUES ('10070','A01', 'COMP2080', 'Winter2015', 100, 'MWF', '11:30:00', '12:45:00', 'E2-105');

INSERT INTO Sections VALUES ('10080','A01', 'COMP2280', 'Winter2015', 100, 'MWF', '10:00:00', '11:15:00', 'E2-105');

INSERT INTO Sections VALUES ('10090','A01', 'COMP2150', 'Winter2015', 100, 'MWF', '10:00:00', '11:15:00', 'E3-270');
INSERT INTO Sections VALUES ('10091','A02', 'COMP2150', 'Winter2015', 100, 'MWF', '14:30:00', '15:20', 'E2-105');

INSERT INTO Sections VALUES ('10100','A01', 'COMP3010', 'Winter2015', 67, 'MWF', '11:30:00', '12:20:00', 'E2-105');

INSERT INTO Sections VALUES ('10110','A01', 'COMP3040', 'Winter2015', 30, 'TR', '11:30:00', '12:45:00', 'E2-330');

INSERT INTO Sections VALUES ('10120','A01', 'COMP3170', 'Winter2015', 60, 'MWF', '10:30:00', '11:20:00', 'E2-160');

INSERT INTO Sections VALUES ('10130','A01', 'COMP3350', 'Winter2015', 60, 'MWF', '9:30:00', '10:20:00', 'E2-165');

INSERT INTO Sections VALUES ('10140','A01', 'COMP3430', 'Winter2015', 90, 'MWF', '13:30:00', '14:20:00', 'E2-105');

INSERT INTO Sections VALUES ('10160','A01', 'COMP3020', 'Fall2014', 50, 'MWF', '11:30:00', '12:20:00', 'E2-160');

INSERT INTO Sections VALUES ('10170','A01', 'COMP3030', 'Fall2014', 68, 'MWF', '14:30:00', '15:30:00', 'E2-105');

INSERT INTO Sections VALUES ('10180','A01', 'COMP3040', 'Fall2014', 25, 'TR', '10:00:00', '11:15:00', 'E2-105');

INSERT INTO Sections VALUES ('10190','A01', 'COMP3190', 'Fall2014', 70, 'MWF', '10:30:00', '11:20:00', 'E2-105');

INSERT INTO Sections VALUES ('10200','A01', 'COMP3370', 'Fall2014', 68, 'TR', '14:30:00', '15:45:00', 'E2-105');

INSERT INTO Sections VALUES ('10210','A01', 'COMP3380', 'Fall2014', 90, 'MWF', '16:00:00', '17:15:00', 'E2-105');

INSERT INTO Sections VALUES ('10220','A01', 'COMP3490', 'Fall2014', 45, 'TR', '8:30:00', '9:45:00', 'E2-105');

INSERT INTO Sections VALUES ('10230','A01', 'COMP3720', 'Fall2014', 38, 'MWF', '15:30:00', '16:20:00', 'arms-115');

INSERT INTO Sections VALUES ('10240','A01', 'COMP4140', 'Fall2014', 56, 'MWF', '9:30:00', '10:20:00', 'E2-160');

INSERT INTO Sections VALUES ('10250','A01', 'COMP4510', 'Fall2014', 68, 'MWF', '10:30:00', '11:20:00', 'E2-304');

INSERT INTO Sections VALUES ('10260','A01', 'COMP4710', 'Fall2014', 68, 'TR', '14:30:00', '15:45:00', 'E2-320');

INSERT INTO Sections VALUES ('10270','A01', 'COMP4720', 'Fall2014', 30, 'MWF', '13:30:00', '14:20:00', 'buller-315');

INSERT INTO Sections VALUES ('10280','A01', 'COMP4020', 'Winter2015', 36, 'MWF', '13:30:00', '14:20:00', 'E2-351');

INSERT INTO Sections VALUES ('10290','A01', 'COMP4180', 'Winter2015', 20, 'TR', '16:00:00', '17:15:00', 'E2-304');

INSERT INTO Sections VALUES ('10300','A01', 'COMP4190', 'Winter2015', 40, 'MWF', '11:30:00', '12:20:00', 'E2-304');

INSERT INTO Sections VALUES ('10310','A01', 'COMP4350', 'Winter2015', 36, 'TR', '11:30:00', '12:45:00', 'E2-320');

INSERT INTO Sections VALUES ('10320','A01', 'COMP4360', 'Winter2015', 30, 'MWF', '15:30:00', '16:20:00', 'E2-105');

INSERT INTO Sections VALUES ('10330','A01', 'COMP4380', 'Winter2015', 50, 'TR', '14:30:00', '15:45:00', 'E2-350');

INSERT INTO Sections VALUES ('10340','A01', 'COMP4430', 'Winter2015', 36, 'MW', '16:30:00', '17:45:00', 'E2-350');

INSERT INTO Sections VALUES ('10350','A01', 'ENV1010', 'Winter2015', 36, 'MWF', '11:30:00', '12:20:00', 'Wallace-221');
INSERT INTO Sections VALUES ('10351','A02', 'ENV1010', 'Winter2015', 36, 'TR', '11:30:00', '12:45:00', 'Wallace-221');



INSERT INTO Enrolled VALUES (7651245, '10000', 3.5);
INSERT INTO Enrolled VALUES (7651245, '10010', NULL);


INSERT INTO Degrees VALUES ('Winter2015', 'Computer Science', 'Major', 'B.Sc. Computer Science (Major)', 120);
INSERT INTO Degrees VALUES ('Winter2015', 'Biology', 'Major', 'B.Sc. Biology (Major)', 120);
INSERT INTO Degrees VALUES ('Winter2015', 'Environment', 'Major', 'B.Sc. Environmental Science (Major)', 120);
INSERT INTO Degrees VALUES ('Fall2014', 'Mathematics', 'Major', 'B.Sc. Mathematics (Major)', 120);
INSERT INTO Degrees VALUES ('Fall2014', 'Architecture', 'Major', 'B.Sc. Architecture (Major)', 120);
INSERT INTO Degrees VALUES ('Fall2014', 'Astronomy', 'Major', 'B.Sc. Astronomy (Major)', 120);
