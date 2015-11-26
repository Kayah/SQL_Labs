Use TimeTable;

SELECT Discipline_Name
FROM Discipline, Lesson
WHERE Discipline.Discipline_id = Lesson.Discipline_id;


SELECT ClassGroup_Name
FROM Lesson,ClassGroup
WHERE Lesson.ClassGroup_id = ClassGroup.ClassGroup_id;

SELECT ClassGroup.ClassGroup_Name, count(*)*1 AS Teacher FROM Lesson,ClassGroup
WHERE ClassGroup.ClassGroup_id = Lesson.ClassGroup_id
GROUP BY Lesson.ClassGroup_id;

SELECT Teacher_Surname, Teacher_Firstname, Discipline_Name, Room_Number , ClassGroup_Name ,Time_Lesson
FROM Teacher, ClassGroup, Room, Lesson, Discipline
WHERE  Teacher.Teacher_id = Lesson.Teacher_id 
AND ClassGroup.ClassGroup_id = Lesson.ClassGroup_id
AND Room.Room_id = Lesson.Room_id
AND Discipline.Discipline_id = Lesson.Discipline_id;

SELECT ClassGroup_Name, Room_Number, Discipline_Name, Time_Lesson
FROM  Room, ClassGroup, Lesson, Discipline
WHERE Room.Room_id = Lesson.Room_id
AND ClassGroup.ClassGroup_id = Lesson.ClassGroup_id
AND Discipline.Discipline_id = Lesson.Discipline_id;
#----------------------examples--------------------------------
SELECT ClassGroup_Name, Room_Number
FROM Room R , ClassGroup CG , Lesson L
WHERE R.Room_id = L.Room_id
AND CG.ClassGroup_id = L.ClassGroup_id;

SELECT Teacher_Surname 
FROM Teacher 
WHERE Teacher_Surname LIKE 'J%';

SELECT Teacher_Surname 
FROM Teacher 
WHERE Teacher_Surname LIKE '_%a%';
 
 SELECT Lesson.Time_Lesson, Lesson.ClassGroup_id, Lesson.Discipline_id 
 FROM Lesson WHERE Lesson.ClassGroup_id = ClassGroup.ClassGroup_id 
 AND Lesson.Discipline_id = Discipline.Discipline_id;