#процедура должна возвращать ФИО самого загруженного преподователя
DELIMITER //

DROP PROCEDURE IF EXISTS ret_full_teach_fio //

CREATE PROCEDURE ret_full_teach_fio()
LANGUAGE SQL  
BEGIN
SELECT Teacher_Surname 'Фамилия преподователя', count(DISTINCT ClassGroup_Name) 'Кол-во групп'
FROM ClassGroup CG, Teacher T, Lesson L
WHERE T.Teacher_id = L.Teacher_id
AND CG.ClassGroup_id = L.ClassGroup_id
GROUP BY T.Teacher_id
	HAVING count(ClassGroup_Name) > ALL(SELECT count(*)
	FROM Teacher T , Lesson L
	WHERE T.Teacher_id = L.ClassGroup_id
	GROUP BY T.Teacher_id);

END //
Call ret_full_teach_fio //
call update_teacher;