USE TimeTable;
DROP PROCEDURE IF EXISTS `info_lesson`;
DELIMITER //
CREATE PROCEDURE `info_lesson` (IN TeacherS VARCHAR (30), 
IN ClassGroupS VARCHAR (30), IN RoomS VARCHAR (30), IN DisciplineS VARCHAR (30), IN Time_LessonS DATETIME)
BEGIN 
IF RoomS IN (SELECT Room_id FROM Lesson)THEN
SIGNAL SQLSTATE '45000'
SET MESSAGE_TEXT = 'комната занята ';
ELSE UPDATE Lesson SET Teacher_id = TeacherS, Room_id = RoomS, 
ClassGroup_id = ClassGroupS, Discipline_id = DisciplineS, Time_Lesson = Time_Lessons;

END IF ;
END //
call info_lesson(1,1,6,1,'2015-01-05 10:00:00');
