CREATE TABLE Time
(
	Id INT AUTO_INCREMENT PRIMARY KEY,    
	time DATETIME
);

INSERT Time (time)  VALUES (NOW());

select * from Time;
