1-
CREATE DATABASE [db_TheatreManager]
2- USE db_TheatreManager
CREATE TABLE Company(
CName nvarchar(25) PRIMARY KEY, Country nvarchar(25) )
CREATE TABLE Production(
PName nvarchar(25) not null, Director nvarchar(25) not null, CName nvarchar(25), PRIMARY KEY(PName,Director), FOREIGN KEY(CName) REFERENCES Company(CName) )
CREATE TABLE Diary(
Date date primary key, Seats int, Price int, PName nvarchar(25), Director nvarchar(25), FOREIGN KEY (PName,Director) REFERENCES Production(PName,Director) )
3-
INSERT INTO Company (CName,Country) VALUES ('Adidas','Almanya'), ('Nike','italya'), ('Puma','Kýbrýs'), ('Lumberjack','Türkiye'), ('Dockers','USA');
INSERT INTO Production (CName,PName,Director) VALUES ('Adidas','koþu','ali'), ('Nike','krampon','veli'), ('Puma','terlik','selami'), ('Lumberjack','bot','can'), ('Dockers','outdoor','canan');
INSERT INTO Diary (Date,Seats,Price,PName,Director) VALUES('2006-11-05',1,12,' koþu',' ali ') INSERT INTO Diary (Date,Seats,Price,PName,Director) VALUES('2004-12-25',6,13, 'krampon','veli')
INSERT INTO Diary (Date,Seats,Price,PName,Director) VALUES('2015-08-30',6,14, 'terlik','selami') INSERT INTO Diary (Date,Seats,Price,PName,Director) VALUES('2011-01-15',11,15, 'bot','can') INSERT INTO Diary (Date,Seats,Price,PName,Director) VALUES('2014-05-21',3,21, 'outdoor','canan')
--4
select max(Price) from Diary where
EXISTS(select PName from Production where PName='A' )
--5
select count(Price) from Diary where
EXISTS(select PName from Production where PName='B' )
--6
select Ddate from Diary where
EXISTS(select PName from Production where (PName='B' or PName='A'))
--7
SELECT Seats FROM Diary ORDER BY Seats ASC
--8
select PName from Production where Ddate
BETWEEN 23.11.2010 AND 29.11.2015
--9
select Director from Production where
EXISTS(select PName from Company where (PName='B' or PName='A'))
--10
select PName from Company where (PName='B' and PName<>'C')
--11
select PName from Company where Country
IN(select Country from Company where Country='Eskiþehir')
select PName from Company where
EXISTS(select Country from Company where Country='Eskiþehir')
--12
SELECT avg(price)
FROM Diary
GROUP BY PName
HAVING avg(Price)> 10;