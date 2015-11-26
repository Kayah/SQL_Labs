USE TimeTable;
#вывести группы , у которых max пар
SELECT ClassGroup_Name,count(*)
FROM ClassGroup CG, Lesson L
WHERE CG.ClassGroup_id = L.ClassGroup_id
GROUP BY CG.ClassGroup_id 
HAVING count(Time_Lesson) >= ALL(SELECT count(*)
FROM ClassGroup CG, Lesson L
WHERE CG.ClassGroup_id = L.ClassGroup_id
GROUP BY CG.ClassGroup_id  );
#вывести фамилии преподователей которые ведут пары у такой-то группы   
SELECT Teacher_Surname, ClassGroup_Name
FROM Teacher T, ClassGroup CG, Lesson L
WHERE T.Teacher_id = L.Teacher_id
AND CG.ClassGroup_id = L.ClassGroup_id
AND EXISTS (SELECT Teacher_Surname FROM Lesson);
#группа , у которой ведет больше всего преподователей 
SELECT ClassGroup_Name, count(DISTINCT Teacher_Surname)
FROM ClassGroup CG, Teacher T, Lesson L
WHERE T.Teacher_id = L.Teacher_id
AND CG.ClassGroup_id = L.ClassGroup_id
GROUP BY CG.ClassGroup_id
HAVING count(Teacher_Surname) >= ALL(SELECT count(*)
FROM ClassGroup CG, Lesson L
WHERE CG.ClassGroup_id = L.ClassGroup_id
GROUP BY CG.ClassGroup_id);



