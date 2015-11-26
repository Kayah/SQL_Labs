/*1. Напишіть команди Transact SQL для наступних дій:
1. Створити новий обліковий запис;
2. Назначити користувачу роль БД (будь-яку);
3. Надати користувачу Bill повноваження на доступ к збереженої процедури (будь-якої);
4. Відкликати всі надані користувачу John привілегії.
2. Поясніть призначення наступних команд Transact SQL:
a) GRANT SELECT, INSERT 
ON SUPPLIES 
TO J_Smith 
WITH GRANT OPTION AS Economists
b) EXEC[UTE] sp_addlogin ‘king_of_the_db', 
‘a2h7d0f7dg84mdf94', 
‘PROJECTS', 
‘Ukrainian', 
‘master', 
‘NULL'
c) REVOKE ALL TO ‘M_Ivanenko' 
CASCADE
3. Зашифруйте зміст однієї з  колонок таблиці в створеній БД.*/
USE TimeTable;

GRANT ALL ON TimeTable.* TO 'root'@'localhost';
SHOW GRANTS FOR 'root'@'localhost';


CREATE USER 'sizyiy'@'localhost' IDENTIFIED BY 'mypass';
GRANT ALL ON TimeTable.info_teacehr TO 'sizyiy'@'localhost' IDENTIFIED BY 'qwerty';
DROP USER 'sizyiy'@'localhost';

CREATE USER 'John'@'localhost' IDENTIFIED BY 'mypass2';
GRANT ALL ON TimeTable.info_teacher TO 'John'@'localhost' IDENTIFIED BY 'mypass2';
SHOW GRANTS FOR 'John'@'localhost';
REVOKE ALL ON TimeTable.info_teacher FROM 'John'@'localhost';
use test;
UPDATE usr_1 SET user_name =AES_ENCRYPT(user_name, 'key');
SELECT * from usr_1;

