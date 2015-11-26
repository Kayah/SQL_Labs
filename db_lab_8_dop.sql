USE TimeTable ;
#Сколько пар для группы в этот день,если больше 3 , то не добавляет.
DROP TRIGGER IF EXISTS `check_lesson`;
DELIMITER //
CREATE TRIGGER `check_lesson`
BEFORE INSERT ON Lesson
FOR EACH ROW 
BEGIN 
SET @ClassGroup := NEW.ClassGroup_id;
SET @Discipline := NEW.Discipline_id;
SET @Time_Lesson := NEW.Time_Lesson;
SET @Teacher:= NEW.Teacher_id;
SET @Room := NEW.Room_id;
SET @Lesson :=New.Lesson_id;

IF(SELECT count(*) FROM Lesson WHERE day(@Time_Lesson)
AND Lesson.ClassGroup_id = @ClassGroup) >= 2 THEN
SIGNAL SQLSTATE '45000'
SET MESSAGE_TEXT = "У этой группы больше 3 пар сегодня";

END IF ;
END //
