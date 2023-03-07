CREATE TABLE HumanResources.Pracownicy
(
 ID INT,
 FirstName NVARCHAR(50),
 LastName NVARCHAR(50),
 Gender NVARCHAR(50),
 Salary INT
);

INSERT INTO HumanResources.Pracownicy (ID, FirstName, LastName, Gender, Salary) VALUES
(1, 'Mark', 'Hastings', 'Male', 60000),
(1, 'Mark', 'Hastings', 'Male', 60000),
(1, 'Mark', 'Hastings', 'Male', 60000),
(2, 'Mary', 'Lambeth', 'Female', 30000),
(2, 'Mary', 'Lambeth', 'Female', 30000),
(3, 'Ben', 'Hoskins', 'Male', 70000),
(3, 'Ben', 'Hoskins', 'Male', 70000),
(3, 'Ben', 'Hoskins', 'Male', 70000);


-- znalezienie duplikatów w tabeli i ich policzenie
SELECT FirstName, COUNT(*) AS "duplikaty"
FROM HumanResources.Pracownicy
GROUP BY FirstName
HAVING COUNT(*) > 1;

-- usuniêcie ze zbioru wynikowego
SELECT DISTINCT * FROM HumanResources.Pracownicy;
-- lub
SELECT *
FROM (
		SELECT *,  ROW_NUMBER() OVER(PARTITION BY id ORDER BY id) AS RowNumber
		FROM HumanResources.Pracownicy) AS Podzapytanie
WHERE RowNumber =1;

-- usuniêcie duplikatów z tabeli
WITH PracownicyCTE AS
(SELECT *, ROW_NUMBER() OVER(PARTITION BY ID ORDER BY ID) AS RowNumber
FROM HumanResources.Pracownicy)
SELECT * FROM PracownicyCTE

DELETE FROM PracownicyCTE
WHERE RowNumber > 1;