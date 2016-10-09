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

CREATE DATABASE IF NOT EXISTS car_rental;

CREATE TABLE IF NOT EXISTS car_rental.categories (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
	category VARCHAR (50) NOT NULL, 
	daily_rate FLOAT(5,2) NOT NULL, 
	weekly_rate FLOAT(6,2) NOT NULL, 
	monthly_rate FLOAT(7,2) NOT NULL, 
	weekend_rate FLOAT(5,2) NOT NULL);
	
CREATE TABLE IF NOT EXISTS car_rental.cars (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,  
	plate_number VARCHAR (8) NOT NULL,  
	make VARCHAR(50) NOT NULL,
	model VARCHAR (50) NOT NULL,  
	car_year YEAR(4), 
	category_id INT NOT NULL, 
	doors ENUM('3', '5') NOT NULL, 
	picture MEDIUMBLOB, 
	`conditions` VARCHAR (50) NOT NULL,  
	available ENUM('yes', 'no') NOT NULL,
	CONSTRAINT fk_categoryID FOREIGN KEY(category_id) REFERENCES categories(id));
	
CREATE TABLE IF NOT EXISTS car_rental.employees (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
	first_name VARCHAR (50) NOT NULL, 
	last_name VARCHAR (50) NOT NULL, 
	title VARCHAR (6) NOT NULL,
	notes LONGTEXT);
	
CREATE TABLE IF NOT EXISTS car_rental.customers (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
	driver_licence_number VARCHAR (50) NOT NULL , 
	full_name VARCHAR (50) NOT NULL,
	address VARCHAR (150) NOT NULL,  
	city VARCHAR (50) NOT NULL,  
	`zip-code` VARCHAR (10) NOT NULL,  
	notes LONGTEXT);


	
CREATE TABLE IF NOT EXISTS car_rental.rental_orders (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
	employee_id INT NOT NULL, 
	customer_id INT NOT NULL, 
	car_id INT NOT NULL, 
	car_condition VARCHAR (50) NOT NULL,  
	tank_level INT NOT NULL, 
	kilometrage_start INT NOT NULL, 
	kilometrage_end INT NOT NULL, 
	total_kilometrage INT NOT NULL, 
	start_date DATE NOT NULL, 
	end_date DATE NOT NULL, 
	total_days INT NOT NULL, 
	rate_applied FLOAT(7,2) NOT NULL, 
	tax_rate FLOAT(7,2) NOT NULL, 
	order_status ENUM('Pending','Awaiting Payment','Awaiting Fulfillment','Completed','Cancelled','Declined') NOT NULL, 
	notes LONGTEXT,
	CONSTRAINT fk_employeeID FOREIGN KEY(employee_id) REFERENCES employees(id),
	CONSTRAINT fk_customerID FOREIGN KEY(customer_id) REFERENCES customers(id),
	CONSTRAINT fk_carID FOREIGN KEY(car_id) REFERENCES cars(id)
	);
	
INSERT INTO categories(category,	daily_rate, weekly_rate, monthly_rate,	weekend_rate)
VALUES
	('Van', 35.40, 165.00, 850.00, 79.98), 
	('SUW', 45.40, 195.00, 1050.00, 89.98), 
	('Car', 25.40, 125.00, 550.00, 59.98);

INSERT INTO cars(plate_number, make, model, car_year, category_id, doors, picture, `conditions`, available)
VALUES
	('A5058SA', 'AUDI', 'T6', '2015', 3, '3', NULL, 'Used', 'yes'), 
	('A4058SA', 'Opel', 'Corsa', '2012', 3, '5', NULL, 'Used', 'yes'), 
	('A2058SA', 'Mazda', '6', '2016', 2, '5', NULL, 'Used', 'no');

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


USE soft_uni 


SELECT first_name,last_name, job_title 
	FROM employees 
		WHERE salary BETWEEN 20000 AND 30000



SELECT DISTINCT (salary) AS salary 
	FROM employees ORDER BY salary


SELECT * 
	FROM employees 
		WHERE job_title = 'Sales Representative'


SELECT CONCAT_WS(" ", first_name, middle_name, last_name) AS full_name 
	FROM employees 
		WHERE salary IN ( 25000, 14000, 12500, 23600) ORDER BY full_name
		
		

SELECT first_name,last_name, salary
	FROM employees 
		WHERE salary > 50000
			ORDER BY salary DESC


			
SELECT first_name,last_name 

	FROM 
		(SELECT * 
			FROM employees 
				ORDER BY salary DESC LIMIT 5) AS a
				
SELECT first_name,last_name 

	FROM employees 
		WHERE department_id != 4
				
				
SELECT *
	FROM employees
		ORDER BY salary DESC,
					first_name ASC,
					last_name DESC,
					middle_name ASC


CREATE VIEW v_employees_salaries  AS
SELECT first_name, last_name, salary
FROM employees 
ORDER BY salary


CREATE VIEW v_employees_job_titles  AS
SELECT CONCAT_WS(" ", e.first_name, IFNULL(e.middle_name, ''), e.last_name) AS full_name , job_title
FROM employees as e


SELECT DISTINCT e.job_title FROM employees as e


SELECT * 
FROM projects 
ORDER BY start_date ASC, name ASC LIMIT 10


SELECT first_name, last_name, hire_date 
FROM employees
ORDER BY hire_date DESC LIMIT 7

SELECT peak_name
FROM peaks
ORDER BY peak_name


SELECT c.country_name, c.population
FROM countries as c 
WHERE c.continent_code = 'EU'
ORDER BY c.population DESC LIMIT 30

use diablo;

SELECT c.name
FROM characters as c
ORDER BY name ASC



/* Exercises: Built-in Functions */

01

SELECT first_name, last_name
FROM employees AS e
WHERE e.first_name LIKE 'SA%'
ORDER BY e.first_name DESC

02

SELECT first_name, last_name
FROM employees AS e
WHERE e.last_name LIKE '%ei%'

03

SELECT first_name
FROM employees AS e
WHERE e.department_id IN(3, 10)
AND YEAR(e.hire_date) BETWEEN '1995' and '2005' 

04

SELECT first_name, last_name
FROM employees AS e
WHERE e.job_title NOT LIKE '%engineer%'

05

SELECT t.name
FROM towns AS t
WHERE CHARACTER_LENGTH(t.name) BETWEEN 5 AND 6
ORDER BY t.name 

06

SELECT t.town_id,  t.name
FROM towns AS t
WHERE t.name RLIKE  '^[BMKE]'
ORDER BY t.name ASC

07

SELECT t.town_id,  t.name
FROM towns AS t
WHERE t.name NOT RLIKE  '^[RBD]'
ORDER BY t.name ASC

08

CREATE VIEW v_employees_hired_after_2000  AS
SELECT first_name, e.last_name
FROM employees AS e
WHERE YEAR(e.hire_date) > '2000'

09

SELECT first_name, last_name
FROM employees AS e
WHERE CHARACTER_LENGTH(e.last_name) = 5

10

SELECT c.country_name, c.iso_code
FROM countries AS c
WHERE (select length(c.country_name)-length(replace(UPPER(c.country_name),'A','')) >= 3)
ORDER BY c.iso_code

11

SELECT p.peak_name, r.river_name, LOWER(CONCAT(SUBSTRING(p.peak_name, 1, CHARACTER_LENGTH(p.peak_name) - 1), r.river_name)) as mix FROM peaks as p, rivers as r
WHERE LEFT(r.river_name, 1) = RIGHT(p.peak_name,1)
ORDER BY mix

12

SELECT g.name, DATE_FORMAT(g.`start`,'%Y-%m-%d') as `start` 
from games as g 
WHERE YEAR(g.`start`) IN ('2011', '2012')
ORDER BY g.`start` ASC, g.name 
LIMIT 50

13

SELECT u.user_name,SUBSTR(email, INSTR(u.email, '@') + 1)  as email 
FROM users as u
ORDER BY email ASC, u.user_name ASC;

14

SELECT u.user_name, u.ip_address
FROM users as u
WHERE u.ip_address LIKE '___.1%.%.___'
ORDER BY u.user_name ASC

15

SELECT 
	g.name, 
CASE 
	 WHEN
	 	HOUR(g.`start`) BETWEEN cast('00' as time) and cast('11' as time) THEN 'Morning' 
	 WHEN
	 	HOUR(g.`start`) BETWEEN cast('12' as time) and cast('17' as time) THEN 'Afternoon'
	WHEN
	 	HOUR(g.`start`) BETWEEN cast('18' as time) and cast('23' as time) THEN 'Evening' 	 
	END as part_of_the_day, 
	
	 CASE 
	 WHEN
	 	g.duration <= 3  THEN 'Extra Short' 
	 WHEN
		g.duration BETWEEN 4 AND 6  THEN 'Short'
    WHEN
	   g.duration > 6  THEN 'Long'
	 WHEN
	  ISNULL( g.duration )  THEN 'Extra Long'
END as duration

FROM games as g
ORDER BY g.name ASC, duration ASC, part_of_the_day ASC


16

CREATE TABLE Orders(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
	product_name VARCHAR(20) NOT NULL, 
	order_date TIMESTAMP NOT NULL) ;
	
INSERT INTO orders (product_name, order_date)
VALUES('Butter', '2016-09-19 00:00:00'), 
		('Milk', '2016-09-30 00:00:00'), 
		('Cheese', '2016-09-04 00:00:00'), 
		('Bread', '2015-12-20 00:00:00'),
		('Tomatoes', '2015-12-30 00:00:00');
		


SELECT o.product_name, 
		 o.order_date, 
		 DATE_ADD(o.order_date,INTERVAL 3 DAY) AS pay_due, 
		 DATE_ADD(o.order_date,INTERVAL 1 MONTH) AS deliver_due
FROM orders as o		

17

CREATE TABLE People(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
	name VARCHAR(50) NOT NULL, 
	birthdate DATETIME NOT NULL) ;
	
INSERT INTO People (name, birthdate)
VALUES('Victor', '2000-12-07 00:00:00'), 
		('Steven', '1992-09-10 00:00:00'), 
		('Stephen', '1910-09-19 00:00:00'), 
		('John', '2010-01-06 00:00:00');
		
SELECT name,  
		 TIMESTAMPDIFF(YEAR , p.birthdate, CURRENT_TIMESTAMP) as ageage_in_years,
		 TIMESTAMPDIFF(MONTH , p.birthdate, CURRENT_TIMESTAMP) as age_in_months,
		 TIMESTAMPDIFF(DAY , p.birthdate, CURRENT_TIMESTAMP) as age_in_days,
		 TIMESTAMPDIFF(MINUTE , p.birthdate, CURRENT_TIMESTAMP) as age_in_minutes
 		
FROM people as p
	