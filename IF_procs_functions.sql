-- Instrukcje warunkowe

DECLARE @RomanticFilms int;
DECLARE @ActionFilms int;

SET @RomanticFilms = (SELECT COUNT(*) from tblFilm where FilmGenreID = 3);
SET @ActionFilms = (SELECT COUNT(*) FROM tblFilm WHERE FilmGenreID = 1);

IF @RomanticFilms > 0
	BEGIN	
		PRINT 'WARNING FOR SHIT!'
		PRINT 'There are too many romantic films in the datebase'
		IF @ActionFilms > 5
			BEGIN
				PRINT 'There are enough acition films'
	END
		ELSE
			BEGIN
				PRINT 'There are not enough action films either'
			END
	END
ELSE 
	BEGIN
		PRINT 'INFORMATION'
		PRINT 'There are no more than five romantic films'
	END;



DECLARE @MÊ¯CZYZNA VARCHAR(15);
DECLARE @KOBIETA VARCHAR(15);

SET @MÊ¯CZYZNA = (SELECT COUNT(*) FROM tblActor WHERE ActorGender LIKE 'Male');
SET @KOBIETA = (SELECT COUNT(*) FROM tblActor WHERE ActorGender LIKE 'Female');

	IF @MÊ¯CZYZNA > 100
		BEGIN
			PRINT 'There are a lot of man';
		END
	ELSE 
		BEGIN
			PRINT 'There are not enough man';
		END
	IF @KOBIETA > 100
		BEGIN
			PRINT 'There are a lot of woman';
		END
	ELSE 
		BEGIN
			PRINT 'There are not enough woman';
		END;


-- Pêtla

DECLARE @intCounter as INT = 0;
WHILE @intCounter <= 100
BEGIN
	PRINT 'Bie¿¹ca wartoœæ licznika to: ' + CAST(@intCounter AS VARCHAR);
	SET @IntCounter = @IntCounter + 1;
END;


-- Procedury

CREATE OR ALTER PROC spVariableData
	(@InfoType varchar(10))
AS
BEGIN
	
	IF @InfoType = 'ALL'
		BEGIN
			(SELECT * FROM tblFilm)
			RETURN
		END
	IF @InfoType = 'AWARD'
		BEGIN
			(SELECT FilmName, FilmOscarWins, FilmOscarNominations FROM tblFilm)
			RETURN
		END
	IF @InfoType = 'FINANCIAL'
		BEGIN
			(SELECT FilmName, FilmBoxOfficeDollars, FilmBudgetDollars FROM tblFilm)
			RETURN
		END
	ELSE
		BEGIN
			PRINT 'YOU HAVE CHOSEN WRONG';
		END
	PRINT 'CHOOSE ONLY: ALL, AWARD, FINANCIAL';
END;

EXEC spVariableData @InfoType = 'AWARD';



CREATE OR ALTER PROC DajNazwisko
(@ID INT,
@FirstName VARCHAR(MAX) OUTPUT,
@LastName VARCHAR(MAX) OUTPUT)

AS
BEGIN
	SELECT @LastName=LastName,
	       @FirstName=FirstName
	FROM Person.Person
	WHERE BusinessEntityID=@ID
END

DECLARE @IMIE VARCHAR(MAX);
DECLARE @Nazwisko VARCHAR(MAX);
EXECUTE DajNazwisko @ID = 105, @LastName = @Nazwisko OUTPUT, @FirstName = @IMIE OUTPUT

SELECT @IMIE AS FirstName, @Nazwisko AS LastName 


CREATE OR ALTER PROCEDURE dodaj_klienta
	(@imie VARCHAR(20)
	,@nazwisko VARCHAR(20)
	,@login VARCHAR(20)
	,@email VARCHAR(20) = 'default@mail.com'
	,@data_urodzenia DATE
	,@id INT OUTPUT
	)
AS 
INSERT INTO klienci (imie, nazwisko, login, email, data_utworzenia, data_urodzenia)
VALUES(@imie, @nazwisko, @login, @email, GETDATE(), @data_urodzenia)
SET @id = SCOPE_IDENTITY()

DECLARE @id INT;
EXECUTE dodaj_klienta @imie = 'Pioter', @nazwisko = 'Nowak', @login = 'pnowak', @email = 'nowak@poczta.com', @data_urodzenia = '1970-01-01', @id = @id OUTPUT;

SELECT @id


-- Funkcja

CREATE OR ALTER FUNCTION check_film (@tytul_filmu VARCHAR(300))
RETURNS BIT
AS
BEGIN
	DECLARE @is_there_movie BIT = 0;
	SELECT @is_there_movie = 1 FROM filmy WHERE tytul_filmu = @tytul_filmu;
	RETURN (@is_there_movie);
END;

SELECT dbo.check_film ('Gladiator');
