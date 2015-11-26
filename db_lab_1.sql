#DROP DATABASE TimeTable;
CREATE DATABASE TimeTable;
USE TimeTable;
CREATE TABLE Room 
	(Room_id INT AUTO_INCREMENT NOT NULL,
    Room_Number INT NOT NULL,
	PRIMARY KEY (Room_id)
	);

CREATE TABLE Discipline 
	(Discipline_id INT AUTO_INCREMENT NOT NULL,
    Discipline_Name VARCHAR(35) NOT NULL UNIQUE ,
    #Teacher_id INT NOT NULL,
    PRIMARY KEY (Discipline_id)
    #FOREIGN KEY (Teacher_id) REFERENCES Teacher(Teacher_id)
    );
    
CREATE TABLE ClassGroup
	(ClassGroup_id INT AUTO_INCREMENT NOT NULL,
    ClassGroup_Name VARCHAR(5) NOT NULL UNIQUE,
    PRIMARY KEY (ClassGroup_id)
    );
    
CREATE TABLE Teacher 
	(Teacher_id INT AUTO_INCREMENT NOT NULL,
    Teacher_Surname VARCHAR(35) NOT NULL, #CHECK (Teacher_Surname NOT LIKE '%(^a-z)%') ,
    Teacher_Firstname VARCHAR(35) NOT NULL, #CHECK (Teacher_Firstname NOT LIKE '%(^a-z)%'),
    Teacher_Secondname VARCHAR(35) NOT NULL, #CHECK (Teacher_Secondame NOT LIKE '%(^a-z)%'),
    #Discipline_id INT NOT NULL,
    PRIMARY KEY (Teacher_id)#,
    #FOREIGN KEY (Discipline_id) REFERENCES Discipline(Discipline_id)
    );

CREATE TABLE Lesson
	(Lesson_id INT AUTO_INCREMENT,
    #Lesson_Name VARCHAR(35) NOT NULL ,
    Teacher_id INT NOT NULL,
    ClassGroup_id INT NOT NULL,
    Room_id INT NOT NULL,
    Discipline_id INT NOT NULL,
    Time_Lesson DATETIME NOT NULL,
    PRIMARY KEY (Lesson_id),
    FOREIGN KEY(Teacher_id) REFERENCES Teacher(Teacher_id),
    FOREIGN KEY(ClassGroup_id) REFERENCES ClassGroup(ClassGroup_id),
    FOREIGN KEY(Discipline_id) REFERENCES Discipline(Discipline_id) ON DELETE CASCADE,
    FOREIGN KEY(Room_id) REFERENCES Room(Room_id) ON DELETE CASCADE
	);