-- Netflix Project 

--Schema
drop table if exists netflix;  
CREATE TABLE netflix
(
	show_id VARCHAR(10),
	type VARCHAR(10),
	title VARCHAR(150),
	director VARCHAR(210),
	casts VARCHAR(1000),
	country VARCHAR(150),
	date_added VARCHAR(50),
	release_year INT,
	rating  VARCHAR(15),
	duration VARCHAR(15),
	listed_in VARCHAR(100),
	description VARCHAR(250)
	
);


