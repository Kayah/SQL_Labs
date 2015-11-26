CREATE VIEW FirstView
AS 
SELECT Teacher_id, ClassGroup_id, Room_id, Discipline_id, Time_Lesson
FROM Lesson
WHERE Teacher_id = 1
WITH CHECK OPTION;

INSERT INTO FirstView 
#VALUES (2,3,3,4,'2015-04-05 10:00:00');CHECK OPTION FAILD 'TimeTalbe.FirstView'
VALUES (1,3,3,4,'2015-04-05 10:00:00');#1 row affeccted 

CREATE VIEW LESSON
AS
SELECT Teacher_Surname Фамилия_Преподователя, Teacher_Firstname Имя_Преподователя, Discipline_Name Урок, Room_Number Класс , ClassGroup_Name Группа ,Time_Lesson Время
FROM Teacher T INNER JOIN Lesson L  
ON T.Teacher_id = L.Teacher_id 
INNER JOIN Room R ON R.Room_id = L.Room_id
INNER JOIN ClassGroup CG ON CG.ClassGroup_id = L.ClassGroup_id
INNER JOIN Discipline D ON D.Discipline_id = L.Discipline_id;

SELECT *
FROM LESSON
WHERE УРОК = 'math'
AND Фамилия_Преподователя = 'Petrenko';

SELECT *
FROM LESSON
WHERE Фамилия_Преподователя ='Petrenko'
GROUP BY Группа;

SELECT *
FROM LESSON
WHERE Фамилия_Преподователя ='Petrenko'
AND Урок = 'math'
GROUP BY Группа;
