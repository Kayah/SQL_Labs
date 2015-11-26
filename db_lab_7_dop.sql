USE TimeTable;
DROP PROCEDURE IF EXISTS `info_teacher`;
DELIMITER //
CREATE PROCEDURE `info_teacher` (IN TeacherS VARCHAR (30))
BEGIN
IF TeacherS NOT IN (SELECT Teacher_Surname FROM Teacher) THEN 
SIGNAL SQLSTATE '45000'
SET MESSAGE_TEXT = 'Ничего не делать';
ELSE SELECT Teacher_Surname 'Фамилия преподователя', count(DISTINCT ClassGroup_Name) 'Кол-во групп' FROM Lesson, Teacher, ClassGroup 
WHERE Teacher.Teacher_id = Lesson.Teacher_id
AND ClassGroup.ClassGroup_id = Lesson.ClassGroup_id
AND Teacher.Teacher_Surname = TeacherS
AND EXISTS (SELECT Teacher_Surname FROM Lesson);
/*HAVING count(ClassGroup_Name) > ALL(SELECT count(*)
	FROM Teacher T , Lesson L
	WHERE T.Teacher_id = L.ClassGroup_id
	GROUP BY T.Teacher_id);*/
END IF;
END //
call info_teacher('Petrenko');
