USE TimeTable;
ALTER TABLE ClassGroup DROP Column Lesson_id;
ALTER TABLE ClassGroup ADD Column Lesson_id  INT;
SHOW INDEX FROM Teacher ;
ALTER TABLE Teacher ADD COLUMN Test_1 INT UNIQUE;
ALTER TABLE Teacher DROP Column Test;
ALTER TABLE Teacher DROP INDEX Test_1 ;
ALTER TABLE Teacher ADD UNIQUE (Test_1);
ALTER TABLE Teacher DROP INDEX Teacher_Firstname;
ALTER TABLE Teacher DROP INDEX Teacher_Surname;
ALTER TABLE Teacher DROP INDEX Teacher_Secondname;
USE TimeTable;
ALTER TABLE Teacher DROP FOREIGN KEY Teacher_ibfk_1;
ALTER TABLE Lesson ADD COLUMN Discipline_id INT;
ALTER TABLE Lesson ADD FOREIGN KEY (Discipline_id) REFERENCES Discipline (Discipline_id);
RENAME TABLE Room TO Room_1;
RENAME TABLE Room_1 TO Room;
ALTER TABLE Teacher ADD COLUMN Test INT UNIQUE CHECK (Test like '%[^a-z]%');
ALTER TABLE Teacher DROP COLUMN Test ;
ALTER TABLE Lesson ADD COLUMN Time_Lesson Time;
