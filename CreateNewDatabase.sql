/*01*/

CREATE DATABASE minions;


/*02*/

CREATE TABLE minions.minions(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR (20) NOT NULL,
	age INT
);

CREATE TABLE minions.towns(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR (20) NOT NULL
);


/*03*/

ALTER TABLE minions.minions
	ADD town_id INT NOT NULL;
	
ALTER TABLE minions.minions
	ADD FOREIGN KEY (town_id) REFERENCES minions.towns(id);

/*04*/

INSERT INTO minions.towns (id, name)
VALUES (1, 'Sofia'), (2, 'Plovdiv'), (3, 'Varna');

INSERT INTO minions.minions (id, name, age, town_id)
VALUES (1, 'Kevin', 22, 1), (2, 'Bob', 15, 3), (3,'Steward',NULL ,2);

/*05*/


TRUNCATE TABLE minions;

/*06*/

DROP TABLE minions, towns;


/*07*/

CREATE TABLE People (
	ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	NAME VARCHAR (200) NOT NULL,
	PICTURE MEDIUMBLOB,
	HEIGHT FLOAT(3, 2),
	WEIGHT FLOAT(5,2),
	GENDER ENUM('m', 'f') NOT NULL,
	BIRTHDATE DATE NOT NULL,
	BIOGRAPHY LONGTEXT
		
);


INSERT INTO People (NAME, PICTURE, HEIGHT, WEIGHT, GENDER, BIRTHDATE, BIOGRAPHY)
VALUES 
			('Kalin', NULL, 1.74, 77.5,'m', '1980-01-26', 'Prosto trqbwa da ima nqkakyw text' ),
			('Ivan', NULL, NULL, NULL, 'm', '1981-12-22', NULL),
			('Lubo', NULL, NULL, NULL, 'm', '1922-10-12', NULL),
			('Jechka', NULL, 1.55, 51.00, 'f', '1972-10-02', NULL),
			('Norka', NULL, NULL, NULL, 'f', '1982-04-22', 'Oshte malko text che trqbwa da ima');
			

			
/*08*/


CREATE TABLE Users(
	ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	USERNAME VARCHAR (30) NOT NULL,
	PASSWORD VARCHAR (26) NOT NULL,
	PROFILE_PICTURE MEDIUMBLOB,
	LAST_LOGIN_TIME TIMESTAMP NOT NULL,
	IS_DELETED ENUM ('TRUE', 'FALSE') NOT NULL
);

INSERT INTO Users(USERNAME, PASSWORD, LAST_LOGIN_TIME, IS_DELETED)
VALUES
	('Chobi', 'q1w2e3r4', NOW(), 'FALSE'),
	('Sybcho', 'qwerty', NOW(), 'TRUE'),
	('Moni', 'zaq1xsw2', NOW(), 'FALSE'),
	('Lusy', 'zxcvbnmj', NOW(), 'FALSE'),
	('Kolyo', 'asdqweas', NOW(), 'TRUE');
	
/*10*/
ALTER TABLE minions.users
MODIFY COLUMN LAST_LOGIN_TIME DATETIME  DEFAULT CURRENT_TIMESTAMP;

/*11*/
ALTER TABLE users
DROP PRIMARY KEY,
ADD PRIMARY KEY(ID),
ADD UNIQUE (USERNAME);


/*12*/

CREATE DATABASE Movies;

CREATE TABLE directors (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
	director_name VARCHAR(50) NOT NULL, 
	notes LONGTEXT);
	
CREATE TABLE 	genres (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
	genre_name VARCHAR(50) NOT NULL, 
	notes LONGTEXT);
	
CREATE TABLE 	categories (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
	category_name VARCHAR(50) NOT NULL, 
	notes LONGTEXT);
	
CREATE TABLE 	movies (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
	title  VARCHAR(200) NOT NULL, 
	director_id INT NOT NULL,
	copyright_year YEAR(4) , 
	length TIME, 
	genre_id INT NOT NULL , 
	category_id INT NOT NULL , 
	rating FLOAT(5,2), 
	notes LONGTEXT,
	
	CONSTRAINT fk_DirectorsID FOREIGN KEY (director_id) REFERENCES directors(id),
    CONSTRAINT fk_GenreID FOREIGN KEY (genre_id) REFERENCES genres(id), 
    CONSTRAINT fk_CategoryID FOREIGN KEY (category_id) REFERENCES categories(id) 
  
);

	
INSERT INTO categories(category_name, notes)
VALUES
		('Action', 'Neshto si'),
		('Comedy', 'Neshto si'),
		('Drama', 'Neshto si'),
		('Fantasy', 'Neshto si'),
		('Science', 'Neshto si');
		
INSERT INTO directors(director_name, notes)
VALUES
	('Ashton', 'Neshto si'),
	('Filip', 'Neshto si'),
	('Kosta', 'Neshto si'),
	('Panko', 'Neshto si'),
	('Veselin', 'Neshto si');
	
INSERT INTO genres(genre_name, notes)
VALUES
	('Adventure', 'Neshto si'),
	('Family', 'Neshto si'),
	('Horror', 'Neshto si'),
	('Musical', 'Neshto si'),
	('Romance', 'Neshto si');	
	
INSERT INTO movies(title, director_id, copyright_year, length, genre_id, category_id, rating, notes )
VALUES
	('Flash', 2,'2014','00:43:32',2,1,8.9,'Nqkakyv komentar'),
	('Arrow', 1,'2014','00:43:32',2,1,8.9,'Nqkakyv komentar'),
	('Lie to me', 1,'2014','00:43:32',2,1,8.9,'Nqkakyv komentar'),
	('August rush', 5,'2014','00:43:32',2,1,8.9,'Nqkakyv komentar'),
	('Star wars',3,'2014','00:43:32',2,1,8.9,'Nqkakyv komentar');


/*13*/


/*14*/


/*15*/


/*16*/


/*17*/


/*18*/


/*19*/


/*20*/
/*21*/
/*22*/
/*23*/
/*24*/
/*25*/
/*26*/
/*27*/
/*28*/
/*29*/
/*30*/
/*31*/
