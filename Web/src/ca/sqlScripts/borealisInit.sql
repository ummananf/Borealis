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
DROP TABLE IF EXISTS Terms;
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
	maxCreditsPerTerm int,
    userType varchar(20)
);

CREATE TABLE Terms
(
	termID varchar(20) PRIMARY KEY,
	startDate date NOT NULL
);
CREATE TABLE Courses
(
	cID varchar(10) PRIMARY KEY, 
	cName varchar(70), 
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
	degName varchar(60) PRIMARY KEY,
	totalCreditHrs int
);
CREATE TABLE DegreeCourses
(
	degName varchar(60) NOT NULL,
	cID varchar(10) NOT NULL,
	PRIMARY KEY(degName, cID),
	FOREIGN KEY(degName) REFERENCES Degrees(degName) ON DELETE CASCADE,
	FOREIGN KEY(cID) REFERENCES Courses(cID)
);
CREATE TABLE DegreeChoice
(
	userID int NOT NULL,
	degName varchar(60) NOT NULL,
	PRIMARY KEY(userID, degName),
	FOREIGN KEY(userID) REFERENCES Users(userID),
	FOREIGN KEY(degName) REFERENCES Degrees(degName)
);

-- Create Users
INSERT INTO Users VALUES (1, 'admin1', 'password', 'admin1@school.ca', 'John', 'Johnson', NULL, 0, 'admin');
INSERT INTO Users VALUES (7651245, 'bob', '4350', 'bob@school.ca', 'Bob', 'Carslon','B.Sc. Computer Science (Major)', 15, 'student');
INSERT INTO Users VALUES (7651785, 'alice', '4350', 'alice@umanitoba.ca', 'Alice', 'Queen','B.Sc. Computer Science (Honours)', 15, 'student');
INSERT INTO Users VALUES (6812459, 'frank', '4350', 'frank@umanitoba.ca', 'Frank', 'Frank','B.Sc. Computer Science (Honours)', 15, 'student');
INSERT INTO Users VALUES (3, 'jason', '123456', 'jason@myumanitoba.ca','Jason', 'King', 'B.Sc. Astronomy (Major)', 15, 'student');
INSERT INTO Users VALUES (4, 'francis','654321', 'frank@myumanitoba.ca','Francis','King','B.Sc. Chemistry (Major)', 15,'student');
INSERT INTO Users VALUES (5, 'kevin','123','Kevin@uwaterloo.ca','Kevin','Queen','B.Sc. Computer Science (Major)', 18, 'student');
INSERT INTO Users VALUES (6, 'emily', 'pass', 'emily@myumanitoba.ca','Emily', 'Smith', 'B.Sc. Environment (Co-op)', 15, 'student');
INSERT INTO Users VALUES (7, 'andrea','123456789', 'andrea@myumanitoba.ca','Andrea','Stephenson','B.Sc. Physics (Honours)', 15,'student');
INSERT INTO Users VALUES (8, 'craig', '987654321', 'craig@myumanitoba.ca','Craig', 'Stephenson', 'B.Sc. Mathematics (Major)', 15, 'student');
INSERT INTO Users VALUES (9, 'thomas','0000', 'thomas@myumanitoba.ca','Thomas','Klassen','B.Sc. Biology (Major)', 15,'student');


-- Must do this before sections and enrolled
INSERT INTO Terms VALUES ('Fall2014', '2014-09-01');
INSERT INTO Terms VALUES ('Winter2015', '2015-01-01');
INSERT INTO Terms VALUES ('Spring2015', '2015-05-01');
INSERT INTO Terms VALUES ('Fall2015', '2015-09-01');

-- ***************START TO INSERT TO Courses TABLE****************************************************************************************
-- Computer Science Courses:
-- First Year Computer Science Courses:
INSERT INTO Courses VALUES ('COMP1010', 'Intro to Computer Science', 3, 'Science', 'Computer Science', 'Introduces you to computer science.', FALSE);
INSERT INTO Courses VALUES ('COMP1020', 'Intro to Computer Science 2', 3, 'Science', 'Computer Science', 'Introduces you to more computer science!', FALSE);
INSERT INTO Courses VALUES ('COMP1260', 'Introductory Computer Usage 1', 3, 'Science', 'Computer Science', 'an introduction to modern computer services', FALSE);
INSERT INTO Courses VALUES ('COMP1270', 'Introductory Computer Usage 2', 3, 'Science', 'Computer Science', 'Using advanced tools to design web pages', FALSE);

-- Second Year Cmoputer Science Courses:
INSERT INTO Courses VALUES ('COMP2140', 'Data Structures and Algorithms', 3, 'Science', 'Computer Science', ' Introduction to the representation and manipulation of data structures', FALSE);
INSERT INTO Courses VALUES ('COMP2150', 'Object Orientation', 3, 'Science', 'Computer Science', 'Design and development of object-oriented software', FALSE);
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
INSERT INTO Courses VALUES ('COMP3720', 'Computer Networks 1', 3, 'Science', 'Computer Science', 'This courses examines the principles of computer networks, including network architectures, algorithms, and performance.', FALSE);

-- Fourth Year Computer Science Courses:
INSERT INTO Courses VALUES ('COMP4140', 'Introduction to Cryptography and Cryptosystems', 3, 'Science', 'Computer Science', 'Description and analysis of cryptographic methods used in the authentication and protection of data.', FALSE);
INSERT INTO Courses VALUES ('COMP4510', 'Introduction to Parallel Computation', 3, 'Science', 'Computer Science', 'An overview of the architectures of current parallel processors and the techniques used to program them.', FALSE);
INSERT INTO Courses VALUES ('COMP4710', 'Introduction to Data Mining', 3, 'Science', 'Computer Science', 'Introduction to data mining concepts and their applications. ', FALSE);
INSERT INTO Courses VALUES ('COMP4720', 'Computer Networks 2', 3, 'Science', 'Computer Science', 'This course examines advanced topics in computer networks, including network security, network management, performance, and multimedia networking.', FALSE);
INSERT INTO Courses VALUES ('COMP4020', 'Human-Computer Interaction 2', 3, 'Science', 'Computer Science', 'This course examines advanced topics in computer networks, including network security, network management, performance, and multimedia networking.', FALSE);
INSERT INTO Courses VALUES ('COMP4180', 'Intelligent Mobile Robotics', 3, 'Science', 'Computer Science', 'Topics include artificial intelligence, computer vision, human-robot interaction, and multi-robot systems. ', FALSE);
INSERT INTO Courses VALUES ('COMP4190', 'Artificial Intelligence', 3, 'Science', 'Computer Science', 'Reasoning with temporal knowledge; causal reasoning; plausible reasoning; nonmonotonic reasoning; abductive reasoning.', FALSE);
INSERT INTO Courses VALUES ('COMP4350', 'Software Engineering 2', 3, 'Science', 'Computer Science', 'Advanced treatment of software development methods.', FALSE);
INSERT INTO Courses VALUES ('COMP4360', 'Machine Learning', 3, 'Science', 'Computer Science', 'Learning strategies; evaluation of learning; learning in symbolic systems; neural networks, genetic algorithms.', FALSE);
INSERT INTO Courses VALUES ('COMP4380', 'Database Implementation', 3, 'Science', 'Computer Science', 'Implementation of modern database systems including query modification/optimization, recovery, concurrency, integrity, and distribution. ', FALSE);
INSERT INTO Courses VALUES ('COMP4430', 'Operating Systems 2', 3, 'Science', 'Computer Science', ' Design and implementation of modern operating systems. Detailed analysis of an open source modern operating system and hands-on experience with its kernel and major components.', FALSE);

-- Biology Courses:
INSERT INTO Courses VALUES ('BIOL1020', 'Biology I - Principles and Themes', 3, 'Science', 'Biology', 'A laboratory based course in unifying principles of biology including cell biology, bioenergetics, cell diviosn, genetics and evolution.', FALSE);
INSERT INTO Courses VALUES ('BIOL1030', 'Biology II - Biological Diversity, Function and Interactions', 3, 'Science', 'Biology', 'A laboratory based course introducting biological diversity including prokaryotes, protists, fungi, plants and animals.', FALSE);
INSERT INTO Courses VALUES ('BIOL2300', 'Principles of Ecology', 3, 'Science', 'Biology', 'Principles of ecology at the individual, population, community and ecosystem levels.', FALSE);
INSERT INTO Courses VALUES ('BIOL2500', 'Genetics I', 3, 'Science', 'Biology', 'Principles of heredity, gametogenesis and the cytological basis of inheritance in plants and animals.', FALSE);
INSERT INTO Courses VALUES ('BIOL2210', 'The Chordates', 3, 'Science', 'Biology', 'A study of the original, evolutionary history and structure of the major groups of chordates.', FALSE);
INSERT INTO Courses VALUES ('BIOL2240', 'Human Physiology I', 3, 'Science', 'Biology', 'The mechanisms of action of the body nervous, endocrine, muscular and reproductive systems.', FALSE);
INSERT INTO Courses VALUES ('BIOL3360', 'Animal Behaviour', 3, 'Science', 'Biology', 'An introduction to the study of animal behaviour including key concepts from the parent disciplines of ethology, comparastive psychology, behavioural ecology.', FALSE);
INSERT INTO Courses VALUES ('BIOL3500', 'Genetics II', 3, 'Science', 'Biology', 'Deals with various aspects of linkage and crossing over, gene funciton, mutation and repair and the use of bacteria and viruses as genetic tools.', FALSE);
INSERT INTO Courses VALUES ('BIOL4362', 'Behavioural Ecology and Cognitive Ethology', 3, 'Science', 'Biology', 'Examines questions relating to mating, parental behaviour, communication, social parasitism and animal intellect.', FALSE);
INSERT INTO Courses VALUES ('BIOL4470', 'Sensory-Motor Physiology', 3, 'Science', 'Biology', 'Information flow in the nervious system and the control of behaviour. Roles that ion channels and synaptic circuitry play are emphasized.', FALSE);
INSERT INTO Courses VALUES ('BIOL4420', 'Marine Biodiversity', 3, 'Science', 'Biology', 'Examines key ecological principles governing the maintenance of marine biodiversity, particularly in northern ecosystems.', FALSE);

-- Environmental Science Courses:
INSERT INTO Courses VALUES ('ENVR4110', 'Critical Thinking and the Environment', 3, 'Environment, Earth, and Resources', 'Environment', 'Topical issues and responses regarding the environment including conservation, management and policy making.', FALSE);
INSERT INTO Courses VALUES ('ENVR3160', 'Environmental Responsibilities and the Law', 3, 'Environment, Earth, and Resources', 'Environment', 'Environmental responsiblities and their legal framework in terms of policies, legislation, standards and guidelines.', FALSE);
INSERT INTO Courses VALUES ('ENVR2270', 'Environmental Problem Solving and Scientific Thinking', 3, 'Environment, Earth, and Resources', 'Environment', 'A course to help students develop skeptical and scientific thinking around environmental issues and problems.', FALSE);
INSERT INTO Courses VALUES ('ENVR2000', 'Environmental Science 2 - Issues', 3, 'Environment, Earth, and Resources', 'Environment', 'Briefly review the major features of structure and function of natural systems. Identify issues that underlie environmental degradation.', FALSE);
INSERT INTO Courses VALUES ('ENVR1000', 'Environmental Science 1 - Concepts', 3, 'Environment, Earth, and Resources', 'Environment', 'Introduce students to the conceptual framework of the environment by examining its physical, biological and social components.', FALSE);

-- Math Courses:
INSERT INTO Courses VALUES ('MATH4250', 'Mathematical Logic', 6, 'Mathematics', 'Mathematics', 'The mathematical study of propositional and predicate logic; proof theory. Introduction to model theory.', TRUE);
INSERT INTO Courses VALUES ('MATH4430', 'Introduction to Elliptic Curves', 3, 'Mathematics', 'Mathematics', 'Homogeneous co-ordinates, non-singular cubic curves, cubic curves of finite fields.', FALSE);
INSERT INTO Courses VALUES ('MATH4810', 'Partial Differential Equations 2', 3, 'Mathematics', 'Mathematics', 'Partial differential equations and their classification. Special functions and generalized Eigen function expansions.', FALSE);
INSERT INTO Courses VALUES ('MATH3350', 'Advanced Algebra', 6, 'Mathematics', 'Mathematics', 'An introduction to abstract algebra with topics taken from among the theories of groups, rings, modules, fields and lattices.', TRUE);
INSERT INTO Courses VALUES ('MATH3810', 'Partial Differential Equations 1', 3, 'Mathematics', 'Mathematics', 'Fourier series and introductory Sturm-Liouville theory. Derivation of wave, diffusion and Laplace equations.', FALSE);
INSERT INTO Courses VALUES ('MATH2500', 'Introduction to Number Theory', 3, 'Mathematics', 'Mathematics', 'Divisibility, unique factorization, linear and quadratic congruences, Fermats theorem.', FALSE);
INSERT INTO Courses VALUES ('MATH2352', 'Advanced Linear Algebra', 6, 'Mathematics', 'Mathematics', 'Vector spaces, linear transformations, inner product spaces, eigenvalues and eigenvectors, orthogonal and Hermitian matrices, and applications.', TRUE);
INSERT INTO Courses VALUES ('MATH2750', 'Intermediate Calculus', 6, 'Mathematics', 'Mathematics', 'Sequences, series and power series. Differentiation and integration of real-valued functions of several real variables.', FALSE);
INSERT INTO Courses VALUES ('MATH3800', 'Ordinary Differential Equations with Applications 2', 3, 'Mathematics', 'Mathematics', 'Laplace transforms, series solutions of ODEs, systems of linear Odes, applications, introduction to dynamical systems.', FALSE);
INSERT INTO Courses VALUES ('MATH2800', 'Ordinary Differential Equations with Applications 1', 3, 'Mathematics', 'Mathematics', 'An introduction to the theory of ordinary differential equations and practical techniques of solution.', FALSE);
INSERT INTO Courses VALUES ('MATH1300', 'Vector Geometry and Linear Algebra', 3, 'Mathematics', 'Mathematics', 'An introduction to vectora, matrices, systems of linear equations and three-dimensional geometry.', FALSE);
INSERT INTO Courses VALUES ('MATH1700', 'Calculus 2', 3, 'Mathematics', 'Mathematics', 'Theory and techniques of integration, curve sketching, volume, arc length, surface area and partial derivatives.', FALSE);
INSERT INTO Courses VALUES ('MATH1500', 'Introduction to Calculus', 3, 'Mathematics', 'Mathematics', 'Differentiation and integration of elementary functions, with applications to maxima and minima, rates of change, area and volume.', FALSE);

-- Physics & Astronomy Courses:
INSERT INTO Courses VALUES ('PHYS4230', 'The Phenomenology of Galaxies', 3, 'Science', 'Physics and Astronomy', 'This course describes the phenomenology of galaxies as determined by recent observational data.', FALSE);
INSERT INTO Courses VALUES ('PHYS4300', 'General Relativity', 3, 'Science', 'Physics and Astronomy', 'n/a', FALSE);
INSERT INTO Courses VALUES ('PHYS4390', 'Quantum Physics 3', 3, 'Science', 'Physics and Astronomy', 'Hilbert space formalism, symmetry and conservation laws, angular momentum, stationary state peturbation theory, variational methods.', FALSE);
INSERT INTO Courses VALUES ('PHYS4510', 'Intro to Nuclear Physics', 3, 'Science', 'Physics and Astronomy', 'Nuclear properties, the nuclear two-body problem, the deuteron and nucleon-nucleon scaterring, nuclear models, nuclear disintigration.', FALSE);
INSERT INTO Courses VALUES ('PHYS3180', 'Stars', 3, 'Science', 'Physics and Astronomy', 'Application of physics to the structure of stars, their formation and evolution, theoretical models and observations.', FALSE);
INSERT INTO Courses VALUES ('PHYS3380', 'Quantum Physics 2', 3, 'Science', 'Physics and Astronomy', 'Focuses on solutions of the three-dimensional Schrodinger equation with special emphasis on one-electron atoms.', FALSE);
INSERT INTO Courses VALUES ('PHYS3670', 'Classical Thermodynamics', 3, 'Science', 'Physics and Astronomy', 'An introduction to the laws of classical equilibrium thermodynamics and their applications.', FALSE);
INSERT INTO Courses VALUES ('PHYS2490', 'Theoretical Physics 2', 3, 'Science', 'Physics and Astronomy', 'This course provides a continuation of the introduction to the mathematics required for both the Honours and Major programs in Physics and Astronomy.', FALSE);
INSERT INTO Courses VALUES ('PHYS2380', 'Quantum Physics 1', 3, 'Science', 'Physics and Astronomy', 'Introduces the basic principles of quantum theory including cavity radiation and Plancks postulate, wave-particle duality, the Bohr model, and the Schrodinger theory.', FALSE);
INSERT INTO Courses VALUES ('PHYS2390', 'Theoretical Physics 1', 3, 'Science', 'Physics and Astronomy', 'This course provides an introduction to the mathematics required for both the Honours and Major programs in Physics and Astronomy.', FALSE);
INSERT INTO Courses VALUES ('PHYS1070', 'Physics 2 - Waves and Modern Physics', 3, 'Science', 'Physics and Astronomy', 'Learn about the mysterious quantum world, the basis of the latest nanotechnology, where particles are waves and waves are particles.', FALSE);
INSERT INTO Courses VALUES ('PHYS1050', 'Physics 1 - Mechanics', 3, 'Science', 'Physics and Astronomy', 'The science of describing and explaining motion.', FALSE);

-- Chemistry Courses:
INSERT INTO Courses VALUES ('CHEM4630', 'Biochemistry of Proteins', 3, 'Science', 'Chemistry', 'The structure and function of proteins, their physical and chemical properties and methods for studying them.', FALSE);
INSERT INTO Courses VALUES ('CHEM4590', 'Bioanalytical Methods', 3, 'Science', 'Chemistry', 'This course introduces different methods used currently for the analysis of biological materials.', FALSE);
INSERT INTO Courses VALUES ('CHEM4550', 'Aquatic Chemistry', 3, 'Science', 'Chemistry', 'An examination of biogeochemical processes affecting the distribution, speciation and bioavailability of chemical substances in the aquatic environment.', FALSE);
INSERT INTO Courses VALUES ('CHEM4600', 'Advanced Chemical Techniques', 6, 'Science', 'Chemistry', 'A workshop course consisting of lectures, problem solving and advanced instrumental techniques.', TRUE);
INSERT INTO Courses VALUES ('CHEM3590', 'Instrumental Analysis', 3, 'Science', 'Chemistry', 'A course dealing with theory and use of standard instruments used for chemical and biochemical analyses.', FALSE);
INSERT INTO Courses VALUES ('CHEM3400', 'Inorganic Chemistry: Reactivity and Properties', 3, 'Science', 'Chemistry', 'Advanced chemistry of the elements with emphasis on chemical reactivity, electronic structure and physical properties of inorganic compounds.', FALSE);
INSERT INTO Courses VALUES ('CHEM2370', '"Biochemistry 2 - Catabolism, Synthesis and Information Pathways"', 3, 'Science', 'Chemistry', 'An introductory course dealing with the basic metabolic processes that occur in living cells.', FALSE);
INSERT INTO Courses VALUES ('CHEM2470', 'Introductory Analytical Chemistry', 3, 'Science', 'Chemistry', 'Equips the students with the theoretical principles on which analytical methods are based with the ability to plan and perform experimental work.', FALSE);
INSERT INTO Courses VALUES ('CHEM2400', 'Inorganic Chemistry: Structure and Applications', 3, 'Science', 'Chemistry', 'Overview of chemical bonding, structure and reactivity across the periodic table.', FALSE);
INSERT INTO Courses VALUES ('CHEM2360', 'Biochemistry 1 - Biomolecules and an Introduction to Metabolic Energy', 3, 'Science', 'Chemistry', 'An introductory course dealing with molecules encountered in biochemistry and the concept of metabolic energy as a product of catabolism.', FALSE);
INSERT INTO Courses VALUES ('CHEM2210', 'Introductory Organic Chemistry: Structure and Function', 3, 'Science', 'Chemistry', 'An introduction to the concepts of organic reactivity and bonding in organic molecules.', FALSE);
INSERT INTO Courses VALUES ('CHEM1310', 'Introduction to Physical Chemistry', 3, 'Science', 'Chemistry', 'Thermochemistry, chemical thermodynamics and chemical kinetics.', FALSE);
INSERT INTO Courses VALUES ('CHEM1300', 'Structure and Modelling in Chemistry', 3, 'Science', 'Chemistry', 'Atomic and molecular models and their applications to chemistry, including a discussion of solid, liquid and gaseous states.', FALSE);
-- **********END OF INSERTING TO Courses Table*********************************************************************************************

-- ******** INSERT TO Prerequisites ********
-- Computer Science Prereqs:
INSERT INTO Prereqs VALUES ('COMP2130', 'COMP4140', 2.0);
INSERT INTO Prereqs VALUES ('COMP3370', 'COMP4510', 2.0);
INSERT INTO Prereqs VALUES ('COMP3430', 'COMP4510', 2.0);
INSERT INTO Prereqs VALUES ('COMP3380', 'COMP4710', 2.0);
INSERT INTO Prereqs VALUES ('COMP3720', 'COMP4720', 2.0);
INSERT INTO Prereqs VALUES ('COMP3020', 'COMP4020', 2.0);
INSERT INTO Prereqs VALUES ('COMP3190', 'COMP4180', 2.0);
INSERT INTO Prereqs VALUES ('COMP3190', 'COMP4190', 2.0);
INSERT INTO Prereqs VALUES ('COMP3350', 'COMP4350', 2.0);
INSERT INTO Prereqs VALUES ('COMP3190', 'COMP4360', 2.0);
INSERT INTO Prereqs VALUES ('COMP3380', 'COMP4380', 2.0);
INSERT INTO Prereqs VALUES ('COMP2160', 'COMP4430', 2.0);
INSERT INTO Prereqs VALUES ('COMP3430', 'COMP4430', 2.0);
INSERT INTO Prereqs VALUES ('COMP2140', 'COMP3720', 2.0);
INSERT INTO Prereqs VALUES ('COMP2280', 'COMP3720', 2.0);
INSERT INTO Prereqs VALUES ('COMP2140', 'COMP3490', 2.0);
INSERT INTO Prereqs VALUES ('COMP2140', 'COMP3380', 2.0);
INSERT INTO Prereqs VALUES ('COMP2280', 'COMP3370', 2.0);
INSERT INTO Prereqs VALUES ('COMP2140', 'COMP3190', 2.0);
INSERT INTO Prereqs VALUES ('COMP2080', 'COMP3040', 2.0);
INSERT INTO Prereqs VALUES ('COMP2140', 'COMP3030', 2.0);
INSERT INTO Prereqs VALUES ('COMP2140', 'COMP3020', 2.0);
INSERT INTO Prereqs VALUES ('COMP2140', 'COMP3430', 2.0);
INSERT INTO Prereqs VALUES ('COMP2280', 'COMP3430', 2.0);
INSERT INTO Prereqs VALUES ('COMP2150', 'COMP3350', 2.0);
INSERT INTO Prereqs VALUES ('COMP2080', 'COMP3170', 2.0);
INSERT INTO Prereqs VALUES ('COMP2140', 'COMP3170', 2.0);
INSERT INTO Prereqs VALUES ('COMP2140', 'COMP3010', 2.0);
INSERT INTO Prereqs VALUES ('COMP2150', 'COMP3010', 2.0);
INSERT INTO Prereqs VALUES ('COMP1020', 'COMP2140', 2.0);
INSERT INTO Prereqs VALUES ('COMP2140', 'COMP2150', 2.0);
INSERT INTO Prereqs VALUES ('COMP2160', 'COMP2150', 2.0);
INSERT INTO Prereqs VALUES ('COMP1020', 'COMP2160', 2.0);
INSERT INTO Prereqs VALUES ('COMP2130', 'COMP2280', 2.0);
INSERT INTO Prereqs VALUES ('COMP2140', 'COMP2280', 2.0);
INSERT INTO Prereqs VALUES ('COMP2160', 'COMP2280', 2.0);
INSERT INTO Prereqs VALUES ('COMP1020', 'COMP2130', 2.0);
INSERT INTO Prereqs VALUES ('MATH1300', 'COMP2130', 2.0);
INSERT INTO Prereqs VALUES ('MATH1500', 'COMP2130', 2.0);
INSERT INTO Prereqs VALUES ('COMP2130', 'COMP2080', 2.0);
INSERT INTO Prereqs VALUES ('COMP2140', 'COMP2080', 2.0);
INSERT INTO Prereqs VALUES ('COMP1010', 'COMP1020', 2.0);

-- Biology Prereqs:
INSERT INTO Prereqs VALUES ('BIOL1020', 'BIOL1030', 2.0);
INSERT INTO Prereqs VALUES ('BIOL1030', 'BIOL2300', 2.0);
INSERT INTO Prereqs VALUES ('BIOL1030', 'BIOL2500', 2.0);
INSERT INTO Prereqs VALUES ('BIOL1030', 'BIOL2210', 2.0);
INSERT INTO Prereqs VALUES ('BIOL1030', 'BIOL2240', 2.0);
INSERT INTO Prereqs VALUES ('BIOL2300', 'BIOL3360', 2.0);
INSERT INTO Prereqs VALUES ('BIOL2210', 'BIOL3360', 2.0);
INSERT INTO Prereqs VALUES ('BIOL2500', 'BIOL3500', 2.0);
INSERT INTO Prereqs VALUES ('BIOL3360', 'BIOL4362', 2.0);

-- Environmental Science Prereqs:
INSERT INTO Prereqs VALUES ('ENVR2000', 'ENVR4110', 2.0);
INSERT INTO Prereqs VALUES ('ENVR2000', 'ENVR3160', 2.0);
INSERT INTO Prereqs VALUES ('BIOL1030', 'ENVR2270', 2.0);
INSERT INTO Prereqs VALUES ('CHEM1310', 'ENVR2270', 2.0);
INSERT INTO Prereqs VALUES ('ENVR1000', 'ENVR1000', 2.0);

-- Math Prereqs:
INSERT INTO Prereqs VALUES ('MATH3350', 'MATH4250', 2.0);
INSERT INTO Prereqs VALUES ('MATH2500', 'MATH4430', 2.0);
INSERT INTO Prereqs VALUES ('MATH2352', 'MATH4430', 3.0);
INSERT INTO Prereqs VALUES ('MATH3350', 'MATH4430', 2.0);
INSERT INTO Prereqs VALUES ('MATH3810', 'MATH4810', 2.0);
INSERT INTO Prereqs VALUES ('MATH2352', 'MATH3350', 3.0);
INSERT INTO Prereqs VALUES ('MATH2750', 'MATH3810', 3.0);
INSERT INTO Prereqs VALUES ('MATH3800', 'MATH3810', 2.0);
INSERT INTO Prereqs VALUES ('MATH1300', 'MATH2352', 2.0);
INSERT INTO Prereqs VALUES ('MATH1700', 'MATH2352', 2.0);
INSERT INTO Prereqs VALUES ('MATH1300', 'MATH2750', 2.0);
INSERT INTO Prereqs VALUES ('MATH1700', 'MATH2750', 2.0);
INSERT INTO Prereqs VALUES ('MATH2800', 'MATH3800', 2.0);
INSERT INTO Prereqs VALUES ('MATH2750', 'MATH3800', 3.0);
INSERT INTO Prereqs VALUES ('MATH1300', 'MATH2800', 2.0);
INSERT INTO Prereqs VALUES ('MATH1500', 'MATH1700', 2.0);

-- Physics & Astronomy Prereqs:
INSERT INTO Prereqs VALUES ('PHYS3180', 'PHYS4230', 2.0);
INSERT INTO Prereqs VALUES ('PHYS3380', 'PHYS4300', 2.0);
INSERT INTO Prereqs VALUES ('PHYS2490', 'PHYS4390', 2.0);
INSERT INTO Prereqs VALUES ('PHYS3380', 'PHYS4390', 2.0);
INSERT INTO Prereqs VALUES ('PHYS3380', 'PHYS4510', 2.0);
INSERT INTO Prereqs VALUES ('PHYS1070', 'PHYS3180', 2.0);
INSERT INTO Prereqs VALUES ('PHYS2380', 'PHYS3380', 2.0);
INSERT INTO Prereqs VALUES ('PHYS2490', 'PHYS3670', 2.0);
INSERT INTO Prereqs VALUES ('PHYS2390', 'PHYS2490', 2.0);
INSERT INTO Prereqs VALUES ('PHYS1070', 'PHYS2380', 2.0);
INSERT INTO Prereqs VALUES ('MATH1700', 'PHYS2380', 2.0);
INSERT INTO Prereqs VALUES ('PHYS1070', 'PHYS2390', 2.0);
INSERT INTO Prereqs VALUES ('MATH1700', 'PHYS2390', 2.0);
INSERT INTO Prereqs VALUES ('PHYS1050', 'PHYS1070', 2.0);

-- Chemistry Prereqs:
INSERT INTO Prereqs VALUES ('CHEM2370', 'CHEM4630', 2.0);
INSERT INTO Prereqs VALUES ('CHEM3590', 'CHEM4590', 2.0);
INSERT INTO Prereqs VALUES ('CHEM3590', 'CHEM4550', 2.0);
INSERT INTO Prereqs VALUES ('CHEM3400', 'CHEM4600', 2.0);
INSERT INTO Prereqs VALUES ('CHEM2470', 'CHEM3590', 2.0);
INSERT INTO Prereqs VALUES ('CHEM2400', 'CHEM3400', 2.0);
INSERT INTO Prereqs VALUES ('CHEM2360', 'CHEM2370', 2.0);
INSERT INTO Prereqs VALUES ('CHEM2210', 'CHEM2370', 2.0);
INSERT INTO Prereqs VALUES ('CHEM1310', 'CHEM2470', 2.0);
INSERT INTO Prereqs VALUES ('CHEM1310', 'CHEM2400', 2.0);
INSERT INTO Prereqs VALUES ('CHEM1310', 'CHEM2360', 2.0);
INSERT INTO Prereqs VALUES ('BIOL1030', 'CHEM2360', 2.0);
INSERT INTO Prereqs VALUES ('CHEM1310', 'CHEM2210', 2.0);
INSERT INTO Prereqs VALUES ('CHEM1300', 'CHEM1310', 2.0);
-- ******** END OF INSERT TO Prerequisites ********

-- ******** INSERT TO Sections ********
-- Computer Science Sections
INSERT INTO Sections VALUES ('10000','A01', 'COMP1010', 'Fall2014', 100, 'MWF', '13:30:00', '14:20:00', 'E2-105 EITC');
INSERT INTO Sections VALUES ('10001','A02', 'COMP1010', 'Fall2014', 105, 'MWF', '9:30:00', '10:20:00', 'E2-105 EITC');
INSERT INTO Sections VALUES ('10002','A03', 'COMP1010', 'Fall2014', 80, 'TR', '10:00:00', '11:15:00', 'E2-330 EITC');
INSERT INTO Sections VALUES ('10003','A04', 'COMP1010', 'Fall2014', 175, 'TR', '12:30:00', '13:30:00', 'E3-270 EITC');
INSERT INTO Sections VALUES ('10004','A01', 'COMP1010', 'Winter2015', 100, 'MWF', '12:30:00', '13:20:00', 'E2-105 EITC');
INSERT INTO Sections VALUES ('10005','A02', 'COMP1010', 'Winter2015', 100, 'MWF', '14:30:00', '15:45:00', 'E2-105 EITC');

INSERT INTO Sections VALUES ('10010','A01', 'COMP1020', 'Fall2014', 175, 'MWF', '11:30:00', '12:20:00', 'E2-105 EITC');
INSERT INTO Sections VALUES ('10011','A02', 'COMP1020', 'Fall2014', 175, 'MWF', '11:30:00', '12:20:00', 'E3-270 EITC');
INSERT INTO Sections VALUES ('10012','A01', 'COMP1020', 'Winter2015', 85, 'MWF', '10:30:00', '11:20:00', 'E2-105 EITC');
INSERT INTO Sections VALUES ('10013','A02', 'COMP1020', 'Winter2015', 70, 'TR', '10:00:00', '11:15:00', '207 Buller');

INSERT INTO Sections VALUES ('10020','A01', 'COMP1260', 'Fall2014', 125, 'MWF', '11:30:00', '12:20:00', 'E2-110 EITC');
INSERT INTO Sections VALUES ('10021','A01', 'COMP1260', 'Winter2015', 175, 'MWF', '11:30:00', '12:20:00', 'E2-105 EITC');

INSERT INTO Sections VALUES ('10030','A01', 'COMP1270', 'Fall2014', 75, 'MWF', '11:30:00', '12:20:00', 'E2-105 EITC');
INSERT INTO Sections VALUES ('10031','A01', 'COMP1270', 'Winter2015', 105, 'MWF', '11:30:00', '12:20:00', 'E2-105 EITC');
INSERT INTO Sections VALUES ('10032','A02', 'COMP1270', 'Winter2015', 105, 'MWF', '10:30:00', '11:20:00', '207 Buller');

INSERT INTO Sections VALUES ('10040','A01', 'COMP2130', 'Fall2014', 100, 'MWF', '15:30:00', '16:20:00', 'E2-105 EITC');
INSERT INTO Sections VALUES ('10041','A01', 'COMP2130', 'Winter2015', 65, 'MWF', '15:30:00', '16:20:00', 'E2-155 EITC');

INSERT INTO Sections VALUES ('10050','A01', 'COMP2140', 'Fall2014', 90, 'TR', '14:30:00', '15:45:00', 'E2-110 EITC');
INSERT INTO Sections VALUES ('10051','A02', 'COMP2140', 'Fall2014', 90, 'MWF', '13:30:00', '14:20:00', 'E2-105 EITC');
INSERT INTO Sections VALUES ('10052','A01', 'COMP2140', 'Fall2015', 55, 'MWF', '9:30:00', '10:20:00', 'E2-330 EITC');

INSERT INTO Sections VALUES ('10060','A01', 'COMP2160', 'Fall2014', 90, 'TR', '11:30:00', '12:45:00', 'E2-105 EITC');
INSERT INTO Sections VALUES ('10061','A02', 'COMP2160', 'Fall2014', 90, 'TR', '8:30:00', '9:45:00', 'E2-105 EITC');
INSERT INTO Sections VALUES ('10062','A01', 'COMP2160', 'Winter2015', 60, 'MWF', '13:30:00', '14:20:00', 'E2-130 EITC');

INSERT INTO Sections VALUES ('10070','A01', 'COMP2080', 'Winter2015', 100, 'MWF', '11:30:00', '12:45:00', 'E2-105 EITC');

INSERT INTO Sections VALUES ('10080','A01', 'COMP2280', 'Winter2015', 100, 'MWF', '10:00:00', '11:15:00', 'E2-105 EITC');

INSERT INTO Sections VALUES ('10090','A01', 'COMP2150', 'Winter2015', 100, 'MWF', '10:00:00', '11:15:00', 'E3-270 EITC');
INSERT INTO Sections VALUES ('10091','A02', 'COMP2150', 'Winter2015', 100, 'MWF', '14:30:00', '15:20', 'E2-105 EITC');

INSERT INTO Sections VALUES ('10100','A01', 'COMP3010', 'Winter2015', 67, 'MWF', '11:30:00', '12:20:00', 'E2-105 EITC');

INSERT INTO Sections VALUES ('10110','A01', 'COMP3040', 'Winter2015', 30, 'TR', '11:30:00', '12:45:00', 'E2-330 EITC');

INSERT INTO Sections VALUES ('10120','A01', 'COMP3170', 'Winter2015', 60, 'MWF', '10:30:00', '11:20:00', 'E2-160 EITC');

INSERT INTO Sections VALUES ('10130','A01', 'COMP3350', 'Winter2015', 60, 'MWF', '9:30:00', '10:20:00', 'E2-165 EITC');

INSERT INTO Sections VALUES ('10140','A01', 'COMP3430', 'Winter2015', 90, 'MWF', '13:30:00', '14:20:00', 'E2-105 EITC');

INSERT INTO Sections VALUES ('10160','A01', 'COMP3020', 'Fall2014', 50, 'MWF', '11:30:00', '12:20:00', 'E2-160 EITC');

INSERT INTO Sections VALUES ('10170','A01', 'COMP3030', 'Fall2014', 68, 'MWF', '14:30:00', '15:30:00', 'E2-105 EITC');

INSERT INTO Sections VALUES ('10180','A01', 'COMP3040', 'Fall2014', 25, 'TR', '10:00:00', '11:15:00', 'E2-105 EITC');

INSERT INTO Sections VALUES ('10190','A01', 'COMP3190', 'Fall2014', 70, 'MWF', '10:30:00', '11:20:00', 'E2-105 EITC');

INSERT INTO Sections VALUES ('10200','A01', 'COMP3370', 'Fall2014', 68, 'TR', '14:30:00', '15:45:00', 'E2-105 EITC');

INSERT INTO Sections VALUES ('10210','A01', 'COMP3380', 'Fall2014', 90, 'MWF', '16:00:00', '17:15:00', 'E2-105 EITC');

INSERT INTO Sections VALUES ('10220','A01', 'COMP3490', 'Fall2014', 45, 'TR', '8:30:00', '9:45:00', 'E2-105 EITC');

INSERT INTO Sections VALUES ('10230','A01', 'COMP3720', 'Fall2014', 38, 'MWF', '15:30:00', '16:20:00', '115 Armes');

INSERT INTO Sections VALUES ('10240','A01', 'COMP4140', 'Fall2014', 56, 'MWF', '9:30:00', '10:20:00', 'E2-160 EITC');

INSERT INTO Sections VALUES ('10250','A01', 'COMP4510', 'Fall2014', 68, 'MWF', '10:30:00', '11:20:00', 'E2-304 EITC');

INSERT INTO Sections VALUES ('10260','A01', 'COMP4710', 'Fall2014', 68, 'TR', '14:30:00', '15:45:00', 'E2-320 EITC');

INSERT INTO Sections VALUES ('10270','A01', 'COMP4720', 'Fall2014', 30, 'MWF', '13:30:00', '14:20:00', '315 Buller');

INSERT INTO Sections VALUES ('10280','A01', 'COMP4020', 'Winter2015', 36, 'MWF', '13:30:00', '14:20:00', 'E2-351 EITC');

INSERT INTO Sections VALUES ('10290','A01', 'COMP4180', 'Winter2015', 20, 'TR', '16:00:00', '17:15:00', 'E2-304 EITC');

INSERT INTO Sections VALUES ('10300','A01', 'COMP4190', 'Winter2015', 40, 'MWF', '11:30:00', '12:20:00', 'E2-304 EITC');

INSERT INTO Sections VALUES ('10310','A01', 'COMP4350', 'Winter2015', 36, 'TR', '11:30:00', '12:45:00', 'E2-320 EITC');

INSERT INTO Sections VALUES ('10320','A01', 'COMP4360', 'Winter2015', 30, 'MWF', '15:30:00', '16:20:00', 'E2-105 EITC');

INSERT INTO Sections VALUES ('10330','A01', 'COMP4380', 'Winter2015', 50, 'TR', '14:30:00', '15:45:00', 'E2-350 EITC');

INSERT INTO Sections VALUES ('10340','A01', 'COMP4430', 'Winter2015', 36, 'MW', '16:30:00', '17:45:00', 'E2-350 EITC');

-- Biology Sections:
INSERT INTO Sections VALUES ('10248','A01', 'BIOL1020', 'Fall2014', 150, 'MWF', '8:30:00', '9:20:00', '205 Armes');
INSERT INTO Sections VALUES ('10249','A02', 'BIOL1020', 'Fall2014', 150, 'MWF', '9:30:00', '10:20:00', '204 Armes');
INSERT INTO Sections VALUES ('10253','A03', 'BIOL1020', 'Fall2014', 150, 'MWF', '10:30:00', '11:20:00', '200 Armes');

INSERT INTO Sections VALUES ('20245','A01', 'BIOL1030', 'Winter2015', 150, 'MWF', '8:30:00', '9:20:00', '100 Fletcher Argue');
INSERT INTO Sections VALUES ('20247','A02', 'BIOL1030', 'Winter2015', 150, 'MWF', '9:30:00', '10:20:00', '315 Biological Science');

INSERT INTO Sections VALUES ('21780','A01', 'BIOL2210', 'Winter2015', 150, 'MWF', '12:30:00', '13:20:00', '201 Armes');

INSERT INTO Sections VALUES ('21741','A01', 'BIOL2300', 'Winter2015', 125, 'MWF', '9:30:00', '10:20:00', '200 Biological Science');

INSERT INTO Sections VALUES ('21744','A01', 'BIOL2500', 'Winter2015', 120, 'MWF', '12:30:00', '13:20:00', '204 Biological Science');
INSERT INTO Sections VALUES ('11647','A01', 'BIOL2500', 'Fall2014', 150, 'TR', '13:00:00', '14:15:00', '202 Biological Science');

INSERT INTO Sections VALUES ('11706','A01', 'BIOL3360', 'Fall2014', 80, 'MWF', '10:30:00', '11:20:00', '305 Biological Science');

INSERT INTO Sections VALUES ('21797','A01', 'BIOL3500', 'Winter2015', 75, 'MWF', '12:30:00', '13:20:00', '215 Buller');
INSERT INTO Sections VALUES ('12271','A01', 'BIOL3500', 'Fall2014', 75, 'MWF', '9:30:00', '10:20:00', '308 Biological Science');

INSERT INTO Sections VALUES ('23107','A01', 'BIOL4362', 'Winter2015', 50, 'TR', '13:00:00', '14:15:00', '318 Biological Science');

INSERT INTO Sections VALUES ('22503','A01', 'BIOL4470', 'Winter2015', 45, 'TR', '10:00:00', '11:15:00', '318 Biological Science');

-- Environmental Science Sections:
INSERT INTO Sections VALUES ('14000', 'A01', 'ENVR4110', 'Fall2014', 35, 'MWF', '10:30:00', '11:20:00', '215 Wallace');

INSERT INTO Sections VALUES ('14001', 'A01', 'ENVR3160', 'Winter2015', 35, 'TR', '11:30:00', '12:45:00', '215 Wallace');

INSERT INTO Sections VALUES ('14002', 'A01', 'ENVR2270', 'Fall2014', 45, 'TR', '14:30:00', '15:45:00', '218 Wallace');

INSERT INTO Sections VALUES ('14003', 'A01', 'ENVR2000', 'Winter2015', 150, 'MWF', '12:30:00', '13:20:00', '221 Wallace');

INSERT INTO Sections VALUES ('14004', 'A01', 'ENVR1000', 'Fall2014', 150, 'MWF', '10:30:00', '11:20:00', '223 Wallace');
INSERT INTO Sections VALUES ('14005', 'A02', 'ENVR1000', 'Fall2014', 150, 'TR', '13:00:00', '14:15:00', '223 Wallace');

-- Math Sections:
INSERT INTO Sections VALUES ('14043', 'A01', 'MATH4250', 'Fall2014', 15, 'TR', '13:00:00', '14:15:00', '318 Machray Hall');

INSERT INTO Sections VALUES ('14044', 'A01', 'MATH4430', 'Winter2015', 25, 'TR', '13:00:00', '14:15:00', '124 Machray Hall');

INSERT INTO Sections VALUES ('14045', 'A01', 'MATH4810', 'Fall2014', 20, 'MWF', '14:30:00', '15:20:00', '316 Machray Hall');

INSERT INTO Sections VALUES ('14046', 'A01', 'MATH3350', 'Fall2014', 14, 'MWF', '11:30:00', '12:20:00', '415 Machray Hall');

INSERT INTO Sections VALUES ('14047', 'A01', 'MATH3810', 'Winter2015', 25, 'MWF', '9:30:00', '10:20:00', '415 Machray Hall');

INSERT INTO Sections VALUES ('14048', 'A01', 'MATH3800', 'Fall2014', 25, 'TR', '14:30:00', '15:45:00', '124 Machray Hall');
INSERT INTO Sections VALUES ('14049', 'A01', 'MATH3800', 'Winter2015', 25, 'TR', '14:30:00', '15:45:00', '124 Machray Hall');

INSERT INTO Sections VALUES ('14050', 'A01', 'MATH2500', 'Fall2014', 70, 'MWF', '12:30:00', '13:20:00', '315 Buller');
INSERT INTO Sections VALUES ('14051', 'A01', 'MATH2500', 'Winter2015', 70, 'MWF', '11:30:00', '12:20:00', '315 Buller');

INSERT INTO Sections VALUES ('14053', 'A01', 'MATH2352', 'Fall2014', 30, 'TR', '0:30:00', '9:45:00', '316 Machray Hall');
INSERT INTO Sections VALUES ('14054', 'A02', 'MATH2352', 'Fall2014', 30, 'MWF', '10:30:00', '11:20:00', '316 Machray Hall');

INSERT INTO Sections VALUES ('14055', 'A01', 'MATH2750', 'Fall2014', 25, 'MWF', '10:30:00', '11:20:00', '415 Machray Hall');

INSERT INTO Sections VALUES ('14056', 'A01', 'MATH2800', 'Winter2015', 65, 'MWF', '12:30:00', '13:20:00', '218 Wallace');

INSERT INTO Sections VALUES ('14057', 'A01', 'MATH1300', 'Fall2014', 140, 'MWF', '10:30:00', '11:20:00', '204 Armes');
INSERT INTO Sections VALUES ('14058', 'A02', 'MATH1300', 'Fall2014', 140, 'TR', '10:00:00', '11:15:00', '208 Armes');
INSERT INTO Sections VALUES ('14059', 'A01', 'MATH1300', 'Winter2015', 140, 'MWF', '13:30:00', '14:20:00', '204 Armes');

INSERT INTO Sections VALUES ('14060', 'A01', 'MATH1700', 'Winter2015', 200, 'MWF', '9:30:00', '10:20:00', '231 Isbister');
INSERT INTO Sections VALUES ('14061', 'A02', 'MATH1700', 'Winter2015', 200, 'TR', '13:00:00', '14:15:00', '100 Fletcher Argue');

INSERT INTO Sections VALUES ('14062', 'A01', 'MATH1500', 'Fall2014', 90, 'MWF', '10:30:00', '11:20:00', '118 St. Johns');
INSERT INTO Sections VALUES ('14063', 'A02', 'MATH1500', 'Fall2014', 120, 'MWF', '9:30:00', '10:20:00', '201 Armes');
INSERT INTO Sections VALUES ('14064', 'A01', 'MATH1500', 'Winter2015', 140, 'TR', '8:30:00', '9:45:00', '208 Armes');

-- Physics & AsTRonomy Sections:
INSERT INTO Sections VALUES ('14026', 'A01', 'PHYS4230', 'Fall2014', 8, 'MWF', '10:30:00', '11:20:00', '321 Allen');

INSERT INTO Sections VALUES ('14027', 'A01', 'PHYS4300', 'Winter2015', 15, 'TR', '11:30:00', '12:45:00', '500 Machray Hall');

INSERT INTO Sections VALUES ('14028', 'A01', 'PHYS4390', 'Fall2014', 16, 'MWF', '8:30:00', '9:20:00', '319 Allen');

INSERT INTO Sections VALUES ('14029', 'A01', 'PHYS4510', 'Winter2015', 15, 'TR', '13:00:00', '14:15:00', '319 Allen');

INSERT INTO Sections VALUES ('14030', 'A01', 'PHYS3180', 'Fall2014', 38, 'TR', '11:30:00', '12:45:00', '330 Allen');

INSERT INTO Sections VALUES ('14031', 'A01', 'PHYS3380', 'Winter2015', 25, 'MWF', '8:30:00', '9:20:00', '330 Allen');

INSERT INTO Sections VALUES ('14032', 'A01', 'PHYS3670', 'Fall2014', 25, 'MWF', '8:30:00', '9:20:00', '330 Allen');

INSERT INTO Sections VALUES ('14033', 'A01', 'PHYS2490', 'Winter2015', 35, 'TR', '8:30:00', '9:45:00', '319 Allen');

INSERT INTO Sections VALUES ('14034', 'A01', 'PHYS2380', 'Fall2014', 35, 'MWF', '13:30:00', '14:20:00', '319 Allen');
INSERT INTO Sections VALUES ('14035', 'A01', 'PHYS2380', 'Winter2015', 35, 'MWF', '13:30:00', '14:20:00', '319 Allen');

INSERT INTO Sections VALUES ('14036', 'A01', 'PHYS2390', 'Fall2014', 40, 'TR', '8:30:00', '9:45:00', '301 Biological Sciences');
INSERT INTO Sections VALUES ('14037', 'A02', 'PHYS2390', 'Fall2014', 30, 'TR', '10:00:00', '11:15:00', '330 Allen');

INSERT INTO Sections VALUES ('14038', 'A01', 'PHYS1070', 'Winter2015', 100, 'MWF', '9:30:00', '10:20:00', '306 Buller');
INSERT INTO Sections VALUES ('14039', 'A02', 'PHYS1070', 'Winter2015', 95, 'MWF', '13:30:00', '14:20:00', '306 Buller');

INSERT INTO Sections VALUES ('14040', 'A01', 'PHYS1050', 'Fall2014', 148, 'MWF', '9:30:00', '10:20:00', '100 St. Pauls');
INSERT INTO Sections VALUES ('14041', 'A02', 'PHYS1050', 'Fall2014', 139, 'MWF', '9:30:00', '10:20:00', '221 Wallace');
INSERT INTO Sections VALUES ('14042', 'A01', 'PHYS1050', 'Winter2015', 178, 'MWF', '13:30:00', '14:20:00', '205 Armes');

-- ChemisTRy Sections:
INSERT INTO Sections VALUES ('14006', 'A01', 'CHEM4630', 'Winter2015', 60, 'TR', '11:30:00', '12:45:00', '315 Machray Hall');

INSERT INTO Sections VALUES ('14007', 'A01', 'CHEM4590', 'Winter2015', 20, 'MWF', '11:30:00', '12:20:00', '115 Armes');

INSERT INTO Sections VALUES ('14008', 'A01', 'CHEM4550', 'Fall2014', 25, 'TR', '8:30:00', '9:45:00', '537 Parker');

INSERT INTO Sections VALUES ('14009', 'A01', 'CHEM4600', 'Fall2014', 18, 'W', '14:30:00', '17:15:00', '539 Parker');

INSERT INTO Sections VALUES ('14010', 'A01', 'CHEM3590', 'Winter2015', 32, 'MWF', '10:30:00', '11:20:00', '218 Wallace');

INSERT INTO Sections VALUES ('14011', 'A01', 'CHEM3400', 'Winter2015', 25, 'TR', '10:00:00', '11:15:00', '537 Parker');
INSERT INTO Sections VALUES ('14012', 'A01', 'CHEM3400', 'Fall2014', 25, 'TR', '10:00:00', '11:15:00', '539 Parker');

INSERT INTO Sections VALUES ('14013', 'A01', 'CHEM2370', 'Winter2015', 162, 'TR', '11:30:00', '12:45:00', '343 Drake');

INSERT INTO Sections VALUES ('14014', 'A01', 'CHEM2470', 'Winter2015', 115, 'MWF', '11:30:00', '12:20:00', '215 Buller');
INSERT INTO Sections VALUES ('14015', 'A01', 'CHEM2470', 'Fall2014', 118, 'TR', '10:00:00', '11:15:00', '224 Education');

INSERT INTO Sections VALUES ('14016', 'A01', 'CHEM2400', 'Winter2015', 115, 'MWF', '12:30:00', '13:20:00', '207 Buller');
INSERT INTO Sections VALUES ('14017', 'A01', 'CHEM2400', 'Fall2014', 120, 'MWF', '11:30:00', '12:20:00', '215 Buller');

INSERT INTO Sections VALUES ('14018', 'A01', 'CHEM2360', 'Fall2014', 160, 'TR', '8:30:00', '9:45:00', '208 Armes');

INSERT INTO Sections VALUES ('14019', 'A01', 'CHEM2210', 'Fall2014', 287, 'MWF', '11:30:00', '12:20:00', '200 Fletcher Argue');

INSERT INTO Sections VALUES ('14020', 'A01', 'CHEM1310', 'Fall2014', 220, 'MWF', '10:30:00', '11:20:00', '200 Armes');
INSERT INTO Sections VALUES ('14021', 'A01', 'CHEM1310', 'Winter2015', 160, 'TR', '8:30:00', '9:45:00', '200 Armes');
INSERT INTO Sections VALUES ('14022', 'A02', 'CHEM1310', 'Winter2015', 202, 'TR', '13:00:00', '14:15:00', '203 Armes');

INSERT INTO Sections VALUES ('14023', 'A01', 'CHEM1300', 'Fall2014', 202, 'TR', '13:00:00', '14:15:00', '204 Armes');
INSERT INTO Sections VALUES ('14024', 'A02', 'CHEM1300', 'Fall2014', 263, 'MWF', '12:30:00', '13:20:00', '290 Education');
INSERT INTO Sections VALUES ('14025', 'A03', 'CHEM1300', 'Fall2014', 202, 'TR', '14:30:00', '15:45:00', '204 Armes');
-- ******** END OF INSERT TO Sections ********

-- Insert completed and enrolled courses for Students
INSERT INTO Enrolled VALUES (7651245, '10000', 3.5);
INSERT INTO Enrolled VALUES (7651245, '10012', -1.0);

INSERT INTO Enrolled VALUES (7651785, '10001', 2.0);
INSERT INTO Enrolled VALUES (7651785, '10010', 2.5);
INSERT INTO Enrolled VALUES (7651785, '10050', 3.0);
INSERT INTO Enrolled VALUES (7651785, '10090', 2.0);
INSERT INTO Enrolled VALUES (7651785, '10060', 2.5);
INSERT INTO Enrolled VALUES (7651785, '10070', 1.0);
INSERT INTO Enrolled VALUES (7651785, '14000', 3.5);

INSERT INTO Enrolled VALUES (3, '14040', 3.5);
INSERT INTO Enrolled VALUES (3, '14038', 3.5);
INSERT INTO Enrolled VALUES (3, '14034', 3.5);
INSERT INTO Enrolled VALUES (3, '14036', 4.0);
INSERT INTO Enrolled VALUES (3, '14033', 3.0);

INSERT INTO Enrolled VALUES (6, '14004', 4.5);
INSERT INTO Enrolled VALUES (6, '14003', 4.5);
INSERT INTO Enrolled VALUES (6, '14057', 4.0);
INSERT INTO Enrolled VALUES (6, '14023', 3.5);
INSERT INTO Enrolled VALUES (6, '14020', 4.0);

INSERT INTO Enrolled VALUES (7, '14040', 4.0);
INSERT INTO Enrolled VALUES (7, '14039', 3.0);
INSERT INTO Enrolled VALUES (7, '14023', 3.0);

INSERT INTO Enrolled VALUES (8, '14057', 3.0);
INSERT INTO Enrolled VALUES (8, '14062', 3.5);
INSERT INTO Enrolled VALUES (8, '14060', 4.0);
INSERT INTO Enrolled VALUES (8, '10248', 3.5);
INSERT INTO Enrolled VALUES (8, '20245', 3.5);

INSERT INTO Enrolled VALUES (9, '10249', 1.0);
INSERT INTO Enrolled VALUES (9, '20245', -1.0);

-- Insert Degrees
INSERT INTO Degrees VALUES ('Fall2014', 'Computer Science', 'Major', 'B.Sc. Computer Science (Major)', 120);
-- INSERT INTO Degrees VALUES ('Fall2014', 'Computer Science', 'Honours', 'B.Sc. Computer Science (Honours)', 120);
INSERT INTO Degrees VALUES ('Fall2014', 'Computer Science', 'Co-op', 'B.Sc. Computer Science (Co-op)', 120);
-- INSERT INTO Degrees VALUES ('Fall2014', 'Environmental Science', 'Major', 'B.Sc. Environment (Major)', 90);
INSERT INTO Degrees VALUES ('Fall2014', 'Environmental Science', 'Co-op', 'B.Sc. Environment (Co-op)', 90);
-- INSERT INTO Degrees VALUES ('Fall2014', 'Biology', 'Major', 'B.Sc. Biology (Major)', 120);
INSERT INTO Degrees VALUES ('Fall2014', 'Biology', 'Honours', 'B.Sc. Biology (Honours)', 120);
-- INSERT INTO Degrees VALUES ('Fall2014', 'Chemistry', 'Major', 'B.Sc. Chemistry (Major)', 120);
INSERT INTO Degrees VALUES ('Fall2014', 'Chemistry', 'Honours', 'B.Sc. Chemistry (Honours)', 120);
INSERT INTO Degrees VALUES ('Fall2014', 'Mathematics', 'Major', 'B.Sc. Mathematics (Major)', 120);
-- INSERT INTO Degrees VALUES ('Fall2014', 'Mathematics', 'Honours', 'B.Sc. Mathematics (Honours)', 120);
INSERT INTO Degrees VALUES ('Fall2014', 'Physics and Astronomy', 'Major', 'B.Sc. Physics (Major)', 120);
-- INSERT INTO Degrees VALUES ('Fall2014', 'Physics and Astronomy', 'Honours', 'B.Sc. Physics (Honours)', 120);
INSERT INTO Degrees VALUES ('Fall2014', 'Physics and Astronomy', 'Major', 'B.Sc. Astronomy (Major)', 120);

-- INSERT INTO Degrees VALUES ('Winter2015', 'Computer Science', 'Major', 'B.Sc. Computer Science (Major)', 120);
INSERT INTO Degrees VALUES ('Winter2015', 'Computer Science', 'Honours', 'B.Sc. Computer Science (Honours)', 120);
-- INSERT INTO Degrees VALUES ('Winter2015', 'Computer Science', 'Co-op', 'B.Sc. Computer Science (Co-op)', 120);
INSERT INTO Degrees VALUES ('Winter2015', 'Environmental Science', 'Major', 'B.Sc. Environment (Major)', 90);
-- INSERT INTO Degrees VALUES ('Winter2015', 'Environmental Science', 'Co-op', 'B.Sc. Environment (Co-op)', 90);
INSERT INTO Degrees VALUES ('Winter2015', 'Biology', 'Major', 'B.Sc. Biology (Major)', 120);
-- INSERT INTO Degrees VALUES ('Winter2015', 'Biology', 'Honours', 'B.Sc. Biology (Honours)', 120);
INSERT INTO Degrees VALUES ('Winter2015', 'Chemistry', 'Major', 'B.Sc. Chemistry (Major)', 120);
-- INSERT INTO Degrees VALUES ('Winter2015', 'Chemistry', 'Honours', 'B.Sc. Chemistry (Honours)', 120);
-- INSERT INTO Degrees VALUES ('Winter2015', 'Mathematics', 'Major', 'B.Sc. Mathematics (Major)', 120);
INSERT INTO Degrees VALUES ('Winter2015', 'Mathematics', 'Honours', 'B.Sc. Mathematics (Honours)', 120);
-- INSERT INTO Degrees VALUES ('Winter2015', 'Physics and Astronomy', 'Major', 'B.Sc. Physics (Major)', 120);
INSERT INTO Degrees VALUES ('Winter2015', 'Physics and Astronomy', 'Honours', 'B.Sc. Physics (Honours)', 120);
-- INSERT INTO Degrees VALUES ('Winter2015', 'Physics and Astronomy', 'Major', 'B.Sc. Astronomy (Major)', 120);

-- Insert required courses into degrees.
INSERT INTO DegreeCourses VALUES('B.Sc. Computer Science (Major)', 'COMP1010');
INSERT INTO DegreeCourses VALUES('B.Sc. Computer Science (Major)', 'COMP1020');
INSERT INTO DegreeCourses VALUES('B.Sc. Computer Science (Major)', 'COMP2140');
INSERT INTO DegreeCourses VALUES('B.Sc. Computer Science (Major)', 'COMP2150');
INSERT INTO DegreeCourses VALUES('B.Sc. Computer Science (Major)', 'COMP2160');
INSERT INTO DegreeCourses VALUES('B.Sc. Computer Science (Major)', 'COMP2280');
INSERT INTO DegreeCourses VALUES('B.Sc. Computer Science (Major)', 'COMP2080');
INSERT INTO DegreeCourses VALUES('B.Sc. Computer Science (Major)', 'COMP3010');
INSERT INTO DegreeCourses VALUES('B.Sc. Computer Science (Major)', 'COMP3170');
INSERT INTO DegreeCourses VALUES('B.Sc. Computer Science (Major)', 'COMP3430');
INSERT INTO DegreeCourses VALUES('B.Sc. Computer Science (Major)', 'COMP3190');
INSERT INTO DegreeCourses VALUES('B.Sc. Computer Science (Major)', 'COMP3380');
INSERT INTO DegreeCourses VALUES('B.Sc. Computer Science (Major)', 'COMP4020');
INSERT INTO DegreeCourses VALUES('B.Sc. Computer Science (Major)', 'COMP4350');
INSERT INTO DegreeCourses VALUES('B.Sc. Computer Science (Major)', 'COMP4380');
INSERT INTO DegreeCourses VALUES('B.Sc. Computer Science (Major)', 'MATH1300');
INSERT INTO DegreeCourses VALUES('B.Sc. Computer Science (Major)', 'MATH1500');

INSERT INTO DegreeCourses VALUES('B.Sc. Computer Science (Honours)', 'COMP1010');
INSERT INTO DegreeCourses VALUES('B.Sc. Computer Science (Honours)', 'COMP1020');
INSERT INTO DegreeCourses VALUES('B.Sc. Computer Science (Honours)', 'COMP2140');
INSERT INTO DegreeCourses VALUES('B.Sc. Computer Science (Honours)', 'COMP2150');
INSERT INTO DegreeCourses VALUES('B.Sc. Computer Science (Honours)', 'COMP2160');
INSERT INTO DegreeCourses VALUES('B.Sc. Computer Science (Honours)', 'COMP2280');
INSERT INTO DegreeCourses VALUES('B.Sc. Computer Science (Honours)', 'COMP2080');
INSERT INTO DegreeCourses VALUES('B.Sc. Computer Science (Honours)', 'COMP3010');
INSERT INTO DegreeCourses VALUES('B.Sc. Computer Science (Honours)', 'COMP3040');
INSERT INTO DegreeCourses VALUES('B.Sc. Computer Science (Honours)', 'COMP3170');
INSERT INTO DegreeCourses VALUES('B.Sc. Computer Science (Honours)', 'COMP3350');
INSERT INTO DegreeCourses VALUES('B.Sc. Computer Science (Honours)', 'COMP3430');
INSERT INTO DegreeCourses VALUES('B.Sc. Computer Science (Honours)', 'COMP3190');
INSERT INTO DegreeCourses VALUES('B.Sc. Computer Science (Honours)', 'COMP3380');
INSERT INTO DegreeCourses VALUES('B.Sc. Computer Science (Honours)', 'COMP4020');
INSERT INTO DegreeCourses VALUES('B.Sc. Computer Science (Honours)', 'COMP4350');
INSERT INTO DegreeCourses VALUES('B.Sc. Computer Science (Honours)', 'COMP4380');
INSERT INTO DegreeCourses VALUES('B.Sc. Computer Science (Honours)', 'COMP4510');
INSERT INTO DegreeCourses VALUES('B.Sc. Computer Science (Honours)', 'MATH1300');
INSERT INTO DegreeCourses VALUES('B.Sc. Computer Science (Honours)', 'MATH1500');

INSERT INTO DegreeCourses VALUES('B.Sc. Computer Science (Co-op)', 'COMP1010');
INSERT INTO DegreeCourses VALUES('B.Sc. Computer Science (Co-op)', 'COMP1020');
INSERT INTO DegreeCourses VALUES('B.Sc. Computer Science (Co-op)', 'COMP2140');
INSERT INTO DegreeCourses VALUES('B.Sc. Computer Science (Co-op)', 'COMP2150');
INSERT INTO DegreeCourses VALUES('B.Sc. Computer Science (Co-op)', 'COMP2160');
INSERT INTO DegreeCourses VALUES('B.Sc. Computer Science (Co-op)', 'COMP2280');
INSERT INTO DegreeCourses VALUES('B.Sc. Computer Science (Co-op)', 'COMP2080');
INSERT INTO DegreeCourses VALUES('B.Sc. Computer Science (Co-op)', 'COMP3010');
INSERT INTO DegreeCourses VALUES('B.Sc. Computer Science (Co-op)', 'COMP3040');
INSERT INTO DegreeCourses VALUES('B.Sc. Computer Science (Co-op)', 'COMP3170');
INSERT INTO DegreeCourses VALUES('B.Sc. Computer Science (Co-op)', 'COMP3350');
INSERT INTO DegreeCourses VALUES('B.Sc. Computer Science (Co-op)', 'COMP3430');
INSERT INTO DegreeCourses VALUES('B.Sc. Computer Science (Co-op)', 'COMP3190');
INSERT INTO DegreeCourses VALUES('B.Sc. Computer Science (Co-op)', 'COMP3380');
INSERT INTO DegreeCourses VALUES('B.Sc. Computer Science (Co-op)', 'COMP4020');
INSERT INTO DegreeCourses VALUES('B.Sc. Computer Science (Co-op)', 'COMP4350');
INSERT INTO DegreeCourses VALUES('B.Sc. Computer Science (Co-op)', 'COMP4380');
INSERT INTO DegreeCourses VALUES('B.Sc. Computer Science (Co-op)', 'COMP4510');
INSERT INTO DegreeCourses VALUES('B.Sc. Computer Science (Co-op)', 'MATH1300');
INSERT INTO DegreeCourses VALUES('B.Sc. Computer Science (Co-op)', 'MATH1500');

INSERT INTO DegreeCourses VALUES('B.Sc. Environment (Major)', 'ENVR1000');
INSERT INTO DegreeCourses VALUES('B.Sc. Environment (Major)', 'ENVR2000');
INSERT INTO DegreeCourses VALUES('B.Sc. Environment (Major)', 'ENVR2270');
INSERT INTO DegreeCourses VALUES('B.Sc. Environment (Major)', 'ENVR3160');
INSERT INTO DegreeCourses VALUES('B.Sc. Environment (Major)', 'BIOL1020');
INSERT INTO DegreeCourses VALUES('B.Sc. Environment (Major)', 'BIOL1030');
INSERT INTO DegreeCourses VALUES('B.Sc. Environment (Major)', 'CHEM1300');
INSERT INTO DegreeCourses VALUES('B.Sc. Environment (Major)', 'CHEM1310');

INSERT INTO DegreeCourses VALUES('B.Sc. Environment (Co-op)', 'ENVR1000');
INSERT INTO DegreeCourses VALUES('B.Sc. Environment (Co-op)', 'ENVR2000');
INSERT INTO DegreeCourses VALUES('B.Sc. Environment (Co-op)', 'ENVR2270');
INSERT INTO DegreeCourses VALUES('B.Sc. Environment (Co-op)', 'ENVR3160');
INSERT INTO DegreeCourses VALUES('B.Sc. Environment (Co-op)', 'ENVR4110');
INSERT INTO DegreeCourses VALUES('B.Sc. Environment (Co-op)', 'BIOL1020');
INSERT INTO DegreeCourses VALUES('B.Sc. Environment (Co-op)', 'BIOL1030');
INSERT INTO DegreeCourses VALUES('B.Sc. Environment (Co-op)', 'CHEM1300');
INSERT INTO DegreeCourses VALUES('B.Sc. Environment (Co-op)', 'CHEM1310');

INSERT INTO DegreeCourses VALUES('B.Sc. Biology (Major)', 'BIOL1020');
INSERT INTO DegreeCourses VALUES('B.Sc. Biology (Major)', 'BIOL1030');
INSERT INTO DegreeCourses VALUES('B.Sc. Biology (Major)', 'BIOL2300');
INSERT INTO DegreeCourses VALUES('B.Sc. Biology (Major)', 'BIOL2500');
INSERT INTO DegreeCourses VALUES('B.Sc. Biology (Major)', 'BIOL2210');
INSERT INTO DegreeCourses VALUES('B.Sc. Biology (Major)', 'BIOL2240');
INSERT INTO DegreeCourses VALUES('B.Sc. Biology (Major)', 'BIOL3360');
INSERT INTO DegreeCourses VALUES('B.Sc. Biology (Major)', 'BIOL3500');
INSERT INTO DegreeCourses VALUES('B.Sc. Biology (Major)', 'BIOL4362');
INSERT INTO DegreeCourses VALUES('B.Sc. Biology (Major)', 'CHEM1300');
INSERT INTO DegreeCourses VALUES('B.Sc. Biology (Major)', 'CHEM1310');

INSERT INTO DegreeCourses VALUES('B.Sc. Biology (Honours)', 'BIOL1020');
INSERT INTO DegreeCourses VALUES('B.Sc. Biology (Honours)', 'BIOL1030');
INSERT INTO DegreeCourses VALUES('B.Sc. Biology (Honours)', 'BIOL2300');
INSERT INTO DegreeCourses VALUES('B.Sc. Biology (Honours)', 'BIOL2500');
INSERT INTO DegreeCourses VALUES('B.Sc. Biology (Honours)', 'BIOL2210');
INSERT INTO DegreeCourses VALUES('B.Sc. Biology (Honours)', 'BIOL2240');
INSERT INTO DegreeCourses VALUES('B.Sc. Biology (Honours)', 'BIOL3360');
INSERT INTO DegreeCourses VALUES('B.Sc. Biology (Honours)', 'BIOL3500');
INSERT INTO DegreeCourses VALUES('B.Sc. Biology (Honours)', 'BIOL4362');
INSERT INTO DegreeCourses VALUES('B.Sc. Biology (Honours)', 'BIOL4420');
INSERT INTO DegreeCourses VALUES('B.Sc. Biology (Honours)', 'CHEM1300');
INSERT INTO DegreeCourses VALUES('B.Sc. Biology (Honours)', 'CHEM1310');
INSERT INTO DegreeCourses VALUES('B.Sc. Biology (Honours)', 'CHEM2360');
INSERT INTO DegreeCourses VALUES('B.Sc. Biology (Honours)', 'CHEM2370');

INSERT INTO DegreeCourses VALUES('B.Sc. Chemistry (Major)', 'CHEM1300');
INSERT INTO DegreeCourses VALUES('B.Sc. Chemistry (Major)', 'CHEM1310');
INSERT INTO DegreeCourses VALUES('B.Sc. Chemistry (Major)', 'CHEM2210');
INSERT INTO DegreeCourses VALUES('B.Sc. Chemistry (Major)', 'CHEM2360');
INSERT INTO DegreeCourses VALUES('B.Sc. Chemistry (Major)', 'CHEM2400');
INSERT INTO DegreeCourses VALUES('B.Sc. Chemistry (Major)', 'CHEM2470');
INSERT INTO DegreeCourses VALUES('B.Sc. Chemistry (Major)', 'CHEM2370');
INSERT INTO DegreeCourses VALUES('B.Sc. Chemistry (Major)', 'CHEM3400');
INSERT INTO DegreeCourses VALUES('B.Sc. Chemistry (Major)', 'CHEM3590');
INSERT INTO DegreeCourses VALUES('B.Sc. Chemistry (Major)', 'CHEM4590');
INSERT INTO DegreeCourses VALUES('B.Sc. Chemistry (Major)', 'CHEM4600');
INSERT INTO DegreeCourses VALUES('B.Sc. Chemistry (Major)', 'CHEM4630');
INSERT INTO DegreeCourses VALUES('B.Sc. Chemistry (Major)', 'MATH1500');

INSERT INTO DegreeCourses VALUES('B.Sc. Chemistry (Honours)', 'CHEM1300');
INSERT INTO DegreeCourses VALUES('B.Sc. Chemistry (Honours)', 'CHEM1310');
INSERT INTO DegreeCourses VALUES('B.Sc. Chemistry (Honours)', 'CHEM2210');
INSERT INTO DegreeCourses VALUES('B.Sc. Chemistry (Honours)', 'CHEM2360');
INSERT INTO DegreeCourses VALUES('B.Sc. Chemistry (Honours)', 'CHEM2400');
INSERT INTO DegreeCourses VALUES('B.Sc. Chemistry (Honours)', 'CHEM2470');
INSERT INTO DegreeCourses VALUES('B.Sc. Chemistry (Honours)', 'CHEM2370');
INSERT INTO DegreeCourses VALUES('B.Sc. Chemistry (Honours)', 'CHEM3400');
INSERT INTO DegreeCourses VALUES('B.Sc. Chemistry (Honours)', 'CHEM3590');
INSERT INTO DegreeCourses VALUES('B.Sc. Chemistry (Honours)', 'CHEM4550');
INSERT INTO DegreeCourses VALUES('B.Sc. Chemistry (Honours)', 'CHEM4590');
INSERT INTO DegreeCourses VALUES('B.Sc. Chemistry (Honours)', 'CHEM4600');
INSERT INTO DegreeCourses VALUES('B.Sc. Chemistry (Honours)', 'CHEM4630');
INSERT INTO DegreeCourses VALUES('B.Sc. Chemistry (Honours)', 'MATH1500');

INSERT INTO DegreeCourses VALUES('B.Sc. Mathematics (Major)', 'MATH1300');
INSERT INTO DegreeCourses VALUES('B.Sc. Mathematics (Major)', 'MATH1500');
INSERT INTO DegreeCourses VALUES('B.Sc. Mathematics (Major)', 'MATH1700');
INSERT INTO DegreeCourses VALUES('B.Sc. Mathematics (Major)', 'MATH2352');
INSERT INTO DegreeCourses VALUES('B.Sc. Mathematics (Major)', 'MATH2500');
INSERT INTO DegreeCourses VALUES('B.Sc. Mathematics (Major)', 'MATH2750');
INSERT INTO DegreeCourses VALUES('B.Sc. Mathematics (Major)', 'MATH2800');
INSERT INTO DegreeCourses VALUES('B.Sc. Mathematics (Major)', 'MATH3350');
INSERT INTO DegreeCourses VALUES('B.Sc. Mathematics (Major)', 'MATH3800');
INSERT INTO DegreeCourses VALUES('B.Sc. Mathematics (Major)', 'MATH4250');

INSERT INTO DegreeCourses VALUES('B.Sc. Mathematics (Honours)', 'MATH1300');
INSERT INTO DegreeCourses VALUES('B.Sc. Mathematics (Honours)', 'MATH1500');
INSERT INTO DegreeCourses VALUES('B.Sc. Mathematics (Honours)', 'MATH1700');
INSERT INTO DegreeCourses VALUES('B.Sc. Mathematics (Honours)', 'MATH2352');
INSERT INTO DegreeCourses VALUES('B.Sc. Mathematics (Honours)', 'MATH2500');
INSERT INTO DegreeCourses VALUES('B.Sc. Mathematics (Honours)', 'MATH2750');
INSERT INTO DegreeCourses VALUES('B.Sc. Mathematics (Honours)', 'MATH2800');
INSERT INTO DegreeCourses VALUES('B.Sc. Mathematics (Honours)', 'MATH3350');
INSERT INTO DegreeCourses VALUES('B.Sc. Mathematics (Honours)', 'MATH3800');
INSERT INTO DegreeCourses VALUES('B.Sc. Mathematics (Honours)', 'MATH3810');
INSERT INTO DegreeCourses VALUES('B.Sc. Mathematics (Honours)', 'MATH4250');
INSERT INTO DegreeCourses VALUES('B.Sc. Mathematics (Honours)', 'MATH4430');
INSERT INTO DegreeCourses VALUES('B.Sc. Mathematics (Honours)', 'MATH4810');

INSERT INTO DegreeCourses VALUES('B.Sc. Physics (Major)', 'PHYS1050');
INSERT INTO DegreeCourses VALUES('B.Sc. Physics (Major)', 'PHYS1070');
INSERT INTO DegreeCourses VALUES('B.Sc. Physics (Major)', 'PHYS2380');
INSERT INTO DegreeCourses VALUES('B.Sc. Physics (Major)', 'PHYS2390');
INSERT INTO DegreeCourses VALUES('B.Sc. Physics (Major)', 'PHYS2490');
INSERT INTO DegreeCourses VALUES('B.Sc. Physics (Major)', 'PHYS3380');
INSERT INTO DegreeCourses VALUES('B.Sc. Physics (Major)', 'PHYS3670');
INSERT INTO DegreeCourses VALUES('B.Sc. Physics (Major)', 'PHYS4300');

INSERT INTO DegreeCourses VALUES('B.Sc. Physics (Honours)', 'PHYS1050');
INSERT INTO DegreeCourses VALUES('B.Sc. Physics (Honours)', 'PHYS1070');
INSERT INTO DegreeCourses VALUES('B.Sc. Physics (Honours)', 'PHYS2380');
INSERT INTO DegreeCourses VALUES('B.Sc. Physics (Honours)', 'PHYS2390');
INSERT INTO DegreeCourses VALUES('B.Sc. Physics (Honours)', 'PHYS2490');
INSERT INTO DegreeCourses VALUES('B.Sc. Physics (Honours)', 'PHYS3380');
INSERT INTO DegreeCourses VALUES('B.Sc. Physics (Honours)', 'PHYS3670');
INSERT INTO DegreeCourses VALUES('B.Sc. Physics (Honours)', 'PHYS4300');
INSERT INTO DegreeCourses VALUES('B.Sc. Physics (Honours)', 'PHYS4390');
INSERT INTO DegreeCourses VALUES('B.Sc. Physics (Honours)', 'PHYS4510');

INSERT INTO DegreeCourses VALUES('B.Sc. Astronomy (Major)', 'PHYS1050');
INSERT INTO DegreeCourses VALUES('B.Sc. Astronomy (Major)', 'PHYS1070');
INSERT INTO DegreeCourses VALUES('B.Sc. Astronomy (Major)', 'PHYS2380');
INSERT INTO DegreeCourses VALUES('B.Sc. Astronomy (Major)', 'PHYS2390');
INSERT INTO DegreeCourses VALUES('B.Sc. Astronomy (Major)', 'PHYS2490');
INSERT INTO DegreeCourses VALUES('B.Sc. Astronomy (Major)', 'PHYS3180');
INSERT INTO DegreeCourses VALUES('B.Sc. Astronomy (Major)', 'PHYS3380');
INSERT INTO DegreeCourses VALUES('B.Sc. Astronomy (Major)', 'PHYS3670');
INSERT INTO DegreeCourses VALUES('B.Sc. Astronomy (Major)', 'PHYS4230');
INSERT INTO DegreeCourses VALUES('B.Sc. Astronomy (Major)', 'PHYS4300');
