-- We must create restrictions in our logic code to not allow some users to be in tables (like students can't be in Teaches table)
-- Note the syntax must be specific otherwise there are errors
CREATE TABLE Users(userID int PRIMARY KEY, username varchar(20) UNIQUE NOT NULL, password varchar(50), email varchar(50) UNIQUE NOT NULL, fName varchar(20), lName varchar(20) );
CREATE TABLE UserPrivs(userID int NOT NULL, userType varchar(20) NOT NULL, PRIMARY KEY(userID, userType), FOREIGN KEY(userID) REFERENCES Users(userID));
CREATE TABLE Courses(cID varchar(10) PRIMARY KEY, cName varchar(50), creditHrs smallint, description varchar(200));
CREATE TABLE Sections(sectID varchar(5) NOT NULL, cID varchar(10) NOT NULL, maxSize smallint, startTime TIME, endTime TIME, location varchar(30), PRIMARY KEY(sectID, cID), FOREIGN KEY(cID) REFERENCES Courses(cID) ON DELETE CASCADE);
CREATE TABLE Enrolled(userID int NOT NULL, sectID varchar(5) NOT NULL, cID varchar(10) NOT NULL, grade FLOAT, PRIMARY KEY(userID, sectID, cID), FOREIGN KEY(userID) REFERENCES Users(userID), FOREIGN KEY(sectID, cID) REFERENCES Sections(sectID, cID));


INSERT INTO Users VALUES (1, 'admin1', 'password', 'admin1@school.ca', 'john', 'johnson');
INSERT INTO Users VALUES (2, 'student1', 'password', 'student1@school.ca', 'carl', 'carlson');

INSERT INTO UserPrivs VALUES (1, 'admin');
INSERT INTO UserPrivs VALUES (2, 'student');

INSERT INTO Courses VALUES ('COMP1010', 'Intro to Computer Science', 3, 'Introduces you to computer science.');

INSERT INTO Sections VALUES ('A01', 'COMP1010', 100, '13:30:00', '14:20:00', 'E2-105');

INSERT INTO Enrolled VALUES (2, 'A01', 'COMP1010', NULL);
