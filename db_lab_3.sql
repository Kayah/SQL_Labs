USE TimeTable;

INSERT INTO Discipline(Discipline_Name) VALUES ('Math');
INSERT INTO Discipline(Discipline_Name) VALUES ('English');
INSERT INTO Discipline(Discipline_Name) VALUES ('Physic');
INSERT INTO Discipline(Discipline_Name) VALUES ('Chemistry');
INSERT INTO Discipline(Discipline_Name) VALUES ('History');
INSERT INTO Discipline(Discipline_Name) VALUES ('OOP');
INSERT INTO Discipline(Discipline_Name) VALUES ('Geography');
INSERT INTO Discipline(Discipline_Name) VALUES ('OZ');
INSERT INTO Discipline(Discipline_Name) VALUES ('ZI');
INSERT INTO Discipline(Discipline_Name) VALUES ('FP');
INSERT INTO Discipline(Discipline_Name) VALUES ('Deutsch');
SELECT * FROM Discipline; 

INSERT INTO Teacher (Teacher_Surname,Teacher_Firstname, Teacher_Secondname) VALUES ('Petrenko','Vladislav','Epistafievich');
INSERT INTO Teacher (Teacher_Surname,Teacher_Firstname, Teacher_Secondname) VALUES ('Petrenkov','Vladislav','Epistafievichevich');
INSERT INTO Teacher (Teacher_Surname,Teacher_Firstname, Teacher_Secondname) VALUES ('Postavlenko','Kirill','Radionovich');
INSERT INTO Teacher (Teacher_Surname,Teacher_Firstname, Teacher_Secondname) VALUES ('Ivanov','Sergei','Romanovich');
INSERT INTO Teacher (Teacher_Surname,Teacher_Firstname, Teacher_Secondname) VALUES ('Vkashu','Evgeniy','Aristarhovich');
INSERT INTO Teacher (Teacher_Surname,Teacher_Firstname, Teacher_Secondname) VALUES ('VLasko','Aleskey','Petrovich');
INSERT INTO Teacher (Teacher_Surname,Teacher_Firstname, Teacher_Secondname) VALUES ('Paltus','Andrey','Tihonovich');
INSERT INTO Teacher (Teacher_Surname,Teacher_Firstname, Teacher_Secondname) VALUES ('Johns','Andy','Michael');
INSERT INTO Teacher (Teacher_Surname,Teacher_Firstname, Teacher_Secondname) VALUES ('Skorobagatko','Anton','Aleksandrovich');
INSERT INTO Teacher (Teacher_Surname,Teacher_Firstname, Teacher_Secondname) VALUES ('Konoplev','Artem','Silvestorovich');
INSERT INTO Teacher (Teacher_Surname,Teacher_Firstname, Teacher_Secondname) VALUES ('Kobochkov','Gleb','Einshteinovich');
SELECT * FROM Teacher; 

INSERT INTO ClassGroup (ClassGroup_Name ) VALUES ('TS-20');
INSERT INTO ClassGroup (ClassGroup_Name ) VALUES ('TS-21');
INSERT INTO ClassGroup (ClassGroup_Name ) VALUES ('EE-11');
INSERT INTO ClassGroup (ClassGroup_Name ) VALUES ('EE-34');
INSERT INTO ClassGroup (ClassGroup_Name ) VALUES ('TS-32');
INSERT INTO ClassGroup (ClassGroup_Name ) VALUES ('TS-31');
INSERT INTO ClassGroup (ClassGroup_Name ) VALUES ('TS-30');
INSERT INTO ClassGroup (ClassGroup_Name ) VALUES ('FT-25');
INSERT INTO ClassGroup (ClassGroup_Name ) VALUES ('FK-18');
INSERT INTO ClassGroup (ClassGroup_Name ) VALUES ('TK-2M');
SELECT * FROM ClassGroup;

INSERT INTO Room (Room_Number) VALUES (332);
INSERT INTO Room (Room_Number) VALUES (558);
INSERT INTO Room (Room_Number) VALUES (306);
INSERT INTO Room (Room_Number) VALUES (308);
INSERT INTO Room (Room_Number) VALUES (156);
INSERT INTO Room (Room_Number) VALUES (406);
INSERT INTO Room (Room_Number) VALUES (456);
INSERT INTO Room (Room_Number) VALUES (225);
INSERT INTO Room (Room_Number) VALUES (111);
INSERT INTO Room (Room_Number) VALUES (345);
SELECT * FROM Room;

INSERT INTO Lesson (Teacher_id, ClassGroup_id, Room_id, Discipline_id, Time_Lesson) VALUES (1,1,1,1,'2015-01-05 10:00:00');
INSERT INTO Lesson (Teacher_id, ClassGroup_id, Room_id, Discipline_id, Time_Lesson) VALUES (2,3,3,4,'2015-01-05 12:00:00');
INSERT INTO Lesson (Teacher_id, ClassGroup_id, Room_id, Discipline_id, Time_Lesson) VALUES (3,4,3,2,'2015-02-05 14:00:00');
INSERT INTO Lesson (Teacher_id, ClassGroup_id, Room_id, Discipline_id, Time_Lesson) VALUES (4,3,3,3,'2015-02-05 16:00:00');
INSERT INTO Lesson (Teacher_id, ClassGroup_id, Room_id, Discipline_id, Time_Lesson) VALUES (2,2,3,3,'2015-03-05 10:00:00');
INSERT INTO Lesson (Teacher_id, ClassGroup_id, Room_id, Discipline_id, Time_Lesson) VALUES (1,2,2,2,'2015-03-05 12:00:00');
INSERT INTO Lesson (Teacher_id, ClassGroup_id, Room_id, Discipline_id, Time_Lesson) VALUES (6,1,2,3,'2015-03-05 12:00:00');
INSERT INTO Lesson (Teacher_id, ClassGroup_id, Room_id, Discipline_id, Time_Lesson) VALUES (7,5,5,5,'2015-03-05 14:00:00');
INSERT INTO Lesson (Teacher_id, ClassGroup_id, Room_id, Discipline_id, Time_Lesson) VALUES (1,5,3,2,'2015-03-05 16:00:00');
INSERT INTO Lesson (Teacher_id, ClassGroup_id, Room_id, Discipline_id, Time_Lesson) VALUES (2,5,3,1,'2015-03-05 18:00:00');
INSERT INTO Lesson (Teacher_id, ClassGroup_id, Room_id, Discipline_id, Time_Lesson) VALUES (1,1,4,1,'2015-04-06 16:00:00');
INSERT INTO Lesson (Teacher_id, ClassGroup_id, Room_id, Discipline_id, Time_Lesson) VALUES (1,1,4,1,'2015-04-06 12:00:00');
INSERT INTO Lesson (Teacher_id, ClassGroup_id, Room_id, Discipline_id, Time_Lesson) VALUES (8,8,1,1,'2001-01-01 10:00:00');
SELECT * FROM Lesson;
DELETE FROM Lesson WHERE Lesson_id = 84;





