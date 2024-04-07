DROP DATABASE IF EXISTS Друзья_человека;
CREATE DATABASE Друзья_человека;
USE  Друзья_человека;

DROP TABLE IF EXISTS Horse;
CREATE TABLE Horse(
Horse_id INT PRIMARY KEY AUTO_INCREMENT,
`Name` VARCHAR(20),
Date_birtch DATETIME,
Color VARCHAR(20),
Comand VARCHAR(20)
);

INSERT INTO Horse(`Name`, Date_birtch, Color, Comand)
VALUES 
		('Inga', '22.10.2022', 'black', 'run, jump'),
		('Zelda', '12.10.2021', 'black', 'run, jump');

DROP TABLE IF EXISTS Camle;
CREATE TABLE Camle(
Camle_id INT PRIMARY KEY AUTO_INCREMENT,
`Name` VARCHAR(20),
Date_birtch DATETIME,
Color VARCHAR(20),
Comand VARCHAR(20)
);

INSERT INTO Camle(`Name`, Date_birtch, Color, Comand)
VALUES 
		('Jon', '23.10.2015', 'green', 'run, jump'),
		('Fecha', '19.10.2020', 'black', 'run, jump');

DROP TABLE IF EXISTS Donkeys;
CREATE TABLE Donkeys(
Donkeys_id INT PRIMARY KEY AUTO_INCREMENT,
`Name` VARCHAR(20),
Date_birtch DATETIME,
Color VARCHAR(20),
Comand VARCHAR(20)
);

INSERT INTO Donkeys(`Name`, Date_birtch, Color, Comand)
VALUES 
		('Beer', '27.10.2020', 'green', 'run, jump'),
		('Matcha', '19.10.2012', 'pink', 'run, jump');

DROP TABLE IF EXISTS Dogs;
CREATE TABLE Dogs(
Dogs_id INT PRIMARY KEY AUTO_INCREMENT,
`Name` VARCHAR(20),
Date_birtch DATETIME,
Color VARCHAR(20),
Comand VARCHAR(20)
);

INSERT INTO Dogs(`Name`, Date_birtch, Color, Comand)
VALUES 
		('Bobik', '27.10.2017', 'braun', 'voice, jump'),
		('Shrek', '17.10.2015', 'white', 'voice, jump');

DROP TABLE IF EXISTS Cats;
CREATE TABLE Cats(
Cats_id INT PRIMARY KEY AUTO_INCREMENT,
`Name` VARCHAR(20),
Date_birtch DATETIME,
Color VARCHAR(20),
Comand VARCHAR(20)
);

INSERT INTO Cats(`Name`, Date_birtch, Color, Comand)
VALUES 
		('Grendi', '27.10.2017', 'black', 'lie, voice'),
		('Barash', '17.10.2015', 'white', 'lie, voice');

DROP TABLE IF EXISTS Hamsters;
CREATE TABLE Hamsters(
Hamsters_id INT PRIMARY KEY AUTO_INCREMENT,
`Name` VARCHAR(20),
Date_birtch DATETIME,
Color VARCHAR(20),
Comand VARCHAR(20)
);

INSERT INTO Hamsters(`Name`, Date_birtch, Color, Comand)
VALUES 
		('Hammy', '27.10.2017', 'black', 'run'),
		('Bubl', '17.10.2015', 'white', 'run');

DROP TABLE IF EXISTS Home_animals;
CREATE TABLE Home_animals(
Home_id INT PRIMARY KEY AUTO_INCREMENT,
Dogs_id INT,
FOREIGN KEY (Dogs_id) REFERENCES Dogs(Dogs_id) ON UPDATE CASCADE ON DELETE CASCADE,
Cats_id INT,
FOREIGN KEY (Cats_id) REFERENCES Cats(Cats_id) ON UPDATE CASCADE ON DELETE CASCADE,
Hamsters_id INT,
FOREIGN KEY (Hamsters_id) REFERENCES Hamsters(Hamsters_id) ON UPDATE CASCADE ON DELETE CASCADE
);

DROP TABLE IF EXISTS Pack_animals;
CREATE TABLE Pack_animals(
Pack_id INT PRIMARY KEY AUTO_INCREMENT,
Horse_id INT,
FOREIGN KEY (Horse_id) REFERENCES Horse(Horse_id) ON UPDATE CASCADE ON DELETE CASCADE,
Camle_id INT,
FOREIGN KEY (Camle_id) REFERENCES Camle(Camle_id) ON UPDATE CASCADE ON DELETE CASCADE,
Donkeys_id INT,
FOREIGN KEY (Donkeys_id) REFERENCES Donkeys(Donkeys_id) ON UPDATE CASCADE ON DELETE CASCADE
);

DROP TABLE IF EXISTS Animals;
CREATE TABLE Animals(
Animal_id INT PRIMARY KEY AUTO_INCREMENT,
Home_id INT,
FOREIGN KEY (Home_id) REFERENCES  Home_animals(Home_id) ON UPDATE CASCADE ON DELETE CASCADE,
Pack_id INT,
FOREIGN KEY (Pack_id) REFERENCES  Pack_animals(Pack_id) ON UPDATE CASCADE ON DELETE CASCADE 
);

DELETE FROM Camle;
SELECT `Name`, Date_birtch, Color, Comand FROM Horse
UNION
SELECT `Name`, Date_birtch, Color, Comand FROM Donkeys;

DROP TABLE animals;
CREATE TABLE animals  
SELECT *, 'Лошади' as genus FROM Horse
UNION SELECT *, 'Ослы' AS genus FROM Donkeys
UNION SELECT *, 'Собаки' AS genus FROM Dogs
UNION SELECT *, 'Кошки' AS genus FROM Cats
UNION SELECT *, 'Хомяки' AS genus FROM Hamsters;

SELECT * FROM animals;

DROP TABLE Yang_animal;
CREATE TABLE Yang_animal 
SELECT `Name`, Date_birtch, Comand, genus, TIMESTAMPDIFF(MONTH, Date_birtch, CURDATE()) AS Age_in_month
FROM animals WHERE Date_birtch BETWEEN ADDDATE(curdate(), INTERVAL -3 YEAR) AND ADDDATE(CURDATE(), INTERVAL -1 YEAR);
 
SELECT * FROM Yang_animal;
    
SELECT h.`Name`, h.Date_birtch, h.Color, h.Comand, a.genus
FROM Horse h
INNER JOIN animals a ON a.`Name` = h.`Name`
UNION ALL
	SELECT d.`Name`, d.Date_birtch, d.Color, d.Comand, a.genus
FROM Donkeys d
INNER JOIN animals a ON a.`Name` = d.`Name`
UNION ALL
	SELECT dg.`Name`, dg.Date_birtch, dg.Color, dg.Comand, a.genus
FROM Dogs dg
INNER JOIN animals a ON a.`Name` = dg.`Name`
UNION
	SELECT c.`Name`, c.Date_birtch, c.Color, c.Comand, a.genus
FROM Cats c
INNER JOIN animals a ON a.`Name` = c.`Name` 
UNION ALL
	SELECT hm.`Name`, hm.Date_birtch, hm.Color, hm.Comand, a.genus
FROM Hamsters hm
INNER JOIN animals a ON a.`Name` = hm.`Name`;
	



