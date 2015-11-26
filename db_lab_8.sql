USE TimeTable;
DROP TRIGGER IF EXISTS `on_insert_lesson`;
DELIMITER // 
CREATE TRIGGER `on_insert_lesson`
BEFORE INSERT ON Lesson
FOR EACH ROW 
BEGIN
SET @ClassGroup := NEW.ClassGroup_id;
SET @Discipline := NEW.Discipline_id;
SET @Time_Lesson := NEW.Time_Lesson;
SET @Teacher:= NEW.Teacher_id;
SET @Room := NEW.Room_id;

IF(@Time_Lesson IN(SELECT Time_Lesson FROM Lesson WHERE Lesson.Discipline_id = @Discipline 
AND Lesson.Teacher_id = @Teacher 
AND Lesson.ClassGroup_id = @ClassGroup
AND Lesson.Room_id = @Room))THEN
	SIGNAL SQLSTATE '45000'
	SET MESSAGE_TEXT = 'Такая Пара Уже Записана'; 
END IF;

IF(@Teacher IN(SELECT Teacher_id FROM Lesson WHERE Lesson.Time_Lesson = @Time_Lesson))THEN
	SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Преподователь уже ведет урок';
END IF;

IF(@ClassGroup IN(SELECT ClassGroup_id FROM Lesson WHERE Lesson.Time_Lesson = @Time_Lesson))THEN
	SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Эта группа уже находится на уроке';
END IF;

IF(@Room IN(SELECT Room_id FROM Lesson WHERE  Lesson.Time_Lesson = @Time_Lesson))THEN
	SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Комната Занята';
END IF;
#Сколько пар для группы в этот день,если больше 5 , то не добавляет.
/*
IF(@Teacher IN ( SELECT Teacher_id FROM Lesson WHERE Lesson.Discipline_id = @Discipline_id))THEN	
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Препод Занят';
END IF;*/

/*IF (@ClassGroup_id IN ( SELECT ClassGroup_id FROM Lesson WHERE Lesson.Discipline_id = @Discipline_id))THEN
	SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Группа Занята';
END IF;*/
END //