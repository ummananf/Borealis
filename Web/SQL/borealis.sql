CREATE TABLE User (
  userID        INTEGER PRIMARY KEY NOT NULL,
  userName      VARCHAR(10) UNIQUE NOT NULL,
  password      VARCHAR(10) NOT NULL,
  email         VARCHAR(80),
  fName         VARCHAR(20),
  lName         VARCHAR(20)
  );
  
CREATE TABLE UserPrivs (
  userID       INTEGER NOT NULL,
  userType     VARCHAR(10) NOT NULL,
  PRIMARY KEY (userID, userType),
  FOREIGN KEY (userID) REFERENCES User (userID)
  );
  
CREATE TABLE Courses (
  courseID     VARCHAR(8) PRIMARY KEY NOT NULL,
  cName        VARCHAR(50) NOT NULL,
  creditHrs    INTEGER NOT NULL,
  description  TEXT,
  faculty      VARCHAR(50) NOT NULL,
  dept         VARCHAR(50) NOT NULL,
  );
  
  // other tables in google doc.