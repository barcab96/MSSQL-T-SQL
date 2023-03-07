CREATE TABLE cars_duplicates
(
Id INT,
Make VARCHAR(50),
Model VARCHAR(50),
Type VARCHAR(50),
Origin VARCHAR(50)
);

BULK INSERT dbo.cars_duplicates
FROM 'C:\Users\Bartek\OneDrive\Pulpit\cars_duplicates.csv'
WITH
(
	FIRSTROW = 2,
	FORMAT = 'CSV',
	FIELDTERMINATOR = ';', 
	ROWTERMINATOR = '0x0a', 
	TABLOCK
	
);

SELECT * FROM cars_duplicates;