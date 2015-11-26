SELECT * from usr;
UPDATE test.usr SET user_name2='' WHERE user_id = 12;
UPDATE test.usr SET user_name2='' WHERE user_id = 13;
UPDATE test.usr SET user_name2='' WHERE user_id = 14;
SELECT * from usr;
UPDATE usr SET user_name = AES_ENCRYPT(user_name, 'key');
SELECT * from usr;
Update test.usr set user_name2= user_name where user_id = 12;
Update test.usr set user_name2= user_name where user_id = 13;
Update test.usr set user_name2= user_name where user_id = 14;
SELECT * from usr;
update usr set user_name2 = aes_decrypt(user_name2, 'key');
update usr set user_name = aes_decrypt(user_name, 'key');
SELECT * from usr;







insert into usr (user_name, user_name2) values('franki','franki');

create table usr(user_id INT AUTO_INCREMENT NOT NULL,
    user_name VARCHAR(30), 
    user_name2 VARCHAR(30),
	PRIMARY KEY (user_id)
	);