CREATE DATABASE SmartCinemas;

USE SmartCinemas;

CREATE TABLE Cinemas (
	Id INT IDENTITY(1, 1) PRIMARY KEY,
	Name VARCHAR(30) NOT NULL,
	City VARCHAR(30) NOT NULL,
	Street VARCHAR(100),
	PostCode CHAR(6) NOT NULL,
	OpenedDate DATE NOT NULL,
	ClosedDate DATE
);

CREATE TABLE CinemaHalls (
	Id INT IDENTITY PRIMARY KEY,
	Name VARCHAR(50) NOT NULL,
	Floor VARCHAR(5),
	ScreenQuality VARCHAR(10),
	CinemaId INT FOREIGN KEY REFERENCES Cinemas(Id)
);

CREATE TABLE CinemaHallsSeats (
	Id INT IDENTITY PRIMARY KEY,
	SeatNumber VARCHAR(4) NOT NULL,
	Row VARCHAR(4) NOT NULL,
	HallId INT FOREIGN KEY REFERENCES CinemaHalls(Id)
);

CREATE TABLE Movies (
	Id INT IDENTITY PRIMARY KEY,
	Title VARCHAR(300) NOT NULL,
	Duration INT NOT NULL,
	ReleaseYear CHAR(4),
	Description VARCHAR(1000),
	Language CHAR(2), -- FOR EXAMPLE: EU, DE, PL
	SubtitlesPl CHAR(1), -- VALUES: Y, N
	Genre VARCHAR(20) NOT NULL,
	AgeRestrictions VARCHAR(5), -- FOR EXAMPLE: 3+, 12+
	AvailableFrom DATE NOT NULL,
	AvailableUntil DATE NOT NULL,
	LicenseCost MONEY
);

CREATE TABLE Sessions (
	Id INT IDENTITY PRIMARY KEY,
	SessionDate DATE NOT NULL,
	SessionTime TIME(0) NOT NULL,
	FilmId INT FOREIGN KEY REFERENCES Movies(Id) NOT NULL,
	HallId INT FOREIGN KEY REFERENCES CinemaHalls(Id) NOT NULL,
	TicketPrice MONEY NOT NULL
);

CREATE TABLE Customers (
	Id INT IDENTITY PRIMARY KEY,
	FirstName VARCHAR(20) NOT NULL,
	LastName VARCHAR(20) NOT NULL,
	Login VARCHAR(20) NOT NULL,
	Email VARCHAR(20) NOT NULL,
	CreationDate DATETIME
);

CREATE TABLE Reservations (
	id INT IDENTITY PRIMARY KEY,
	SessionId INT FOREIGN KEY REFERENCES Sessions(Id) NOT NULL,
	SeatId INT FOREIGN KEY REFERENCES CinemaHallsSeats(Id) NOT NULL,
	ReservationDate DATE NOT NULL,
	ReservationTime TIME(0),
	IfPaid VARCHAR(1), -- VALUES: Y, N
	PlaceOfPurchase VARCHAR(25), -- Internet, ticket office
	CustomerId INT FOREIGN KEY REFERENCES Customers(Id)
);

ALTER TABLE Customers
ADD DateOfBirth DATE NOT NULL;

INSERT INTO Cinemas (Name, City, Street, PostCode, OpenedDate, ClosedDate)
VALUES
    ('Starlight Cinemas', 'Los Angeles', 'Main Street', '90001', '2022-02-15', NULL),
    ('Cineplex Central', 'New York', 'Broadway Avenue', '10001', '2020-06-10', NULL),
    ('Golden Screens', 'London', 'Oxford Street', 'W1D1BS', '2021-03-20', NULL),
    ('Cinema Paradiso', 'Rome', 'Via del Corso', '00186', '2019-11-05', NULL),
    ('Metro Movies', 'Paris', 'Champs-Elysées', '75008', '2023-01-08', NULL),
    ('Sunset Theatres', 'Los Angeles', 'Sunset Boulevard', '90028', '2022-08-30', NULL),
    ('Skyline Cineplex', 'Tokyo', 'Shibuya Street', '150042', '2020-12-12', NULL),
    ('Cinema Lumiere', 'Paris', 'Rue du Faubourg Saint-Antoine', '75012', '2021-07-18', NULL),
    ('Majestic Movies', 'New York', 'Park Avenue', '10016', '2018-04-25', NULL),
    ('Dreamland Theatres', 'London', 'Piccadilly Circus', 'W1J9HP', '2017-09-03', NULL);

SELECT * FROM Cinemas;

INSERT INTO CinemaHalls (Name, Floor, ScreenQuality, CinemaId) VALUES ('Alpha','1','4K',(SELECT id FROM Cinemas WHERE Name = 'Starlight Cinemas'));
INSERT INTO CinemaHalls (Name, Floor, ScreenQuality, CinemaId) VALUES ('Galaxy','1','8K',(SELECT id FROM Cinemas WHERE Name = 'Starlight Cinemas'));
INSERT INTO CinemaHalls (Name, Floor, ScreenQuality, CinemaId) VALUES ('Cristal','2','4K',(SELECT id FROM Cinemas WHERE Name = 'Starlight Cinemas'));
INSERT INTO CinemaHalls (Name, Floor, ScreenQuality, CinemaId) VALUES ('Paramount','2','3D',(SELECT id FROM Cinemas WHERE Name = 'Starlight Cinemas'));
INSERT INTO CinemaHalls (Name, Floor, ScreenQuality, CinemaId) VALUES ('Royal','3','8K',(SELECT id FROM Cinemas WHERE Name = 'Starlight Cinemas'));
INSERT INTO CinemaHalls (Name, Floor, ScreenQuality, CinemaId) VALUES ('Omega','3','4K',(SELECT id FROM Cinemas WHERE Name = 'Starlight Cinemas'));
INSERT INTO CinemaHalls (Name, Floor, ScreenQuality, CinemaId) VALUES ('Alpha','1','4K',(SELECT id FROM Cinemas WHERE Name = 'Cineplex Central'));
INSERT INTO CinemaHalls (Name, Floor, ScreenQuality, CinemaId) VALUES ('Galaxy','1','8K',(SELECT id FROM Cinemas WHERE Name = 'Cineplex Central'));
INSERT INTO CinemaHalls (Name, Floor, ScreenQuality, CinemaId) VALUES ('Cristal','2','4K',(SELECT id FROM Cinemas WHERE Name = 'Cineplex Central'));
INSERT INTO CinemaHalls (Name, Floor, ScreenQuality, CinemaId) VALUES ('Paramount','2','3D',(SELECT id FROM Cinemas WHERE Name = 'Cineplex Central'));
INSERT INTO CinemaHalls (Name, Floor, ScreenQuality, CinemaId) VALUES ('Royal','3','8K',(SELECT id FROM Cinemas WHERE Name = 'Cineplex Central'));
INSERT INTO CinemaHalls (Name, Floor, ScreenQuality, CinemaId) VALUES ('Omega','3','4K',(SELECT id FROM Cinemas WHERE Name = 'Cineplex Central'));
INSERT INTO CinemaHalls (Name, Floor, ScreenQuality, CinemaId) VALUES ('Alpha','1','4K',(SELECT id FROM Cinemas WHERE Name = 'Golden Screens'));
INSERT INTO CinemaHalls (Name, Floor, ScreenQuality, CinemaId) VALUES ('Galaxy','1','8K',(SELECT id FROM Cinemas WHERE Name = 'Golden Screens'));
INSERT INTO CinemaHalls (Name, Floor, ScreenQuality, CinemaId) VALUES ('Cristal','2','4K',(SELECT id FROM Cinemas WHERE Name = 'Golden Screens'));
INSERT INTO CinemaHalls (Name, Floor, ScreenQuality, CinemaId) VALUES ('Paramount','2','3D',(SELECT id FROM Cinemas WHERE Name = 'Golden Screens'));
INSERT INTO CinemaHalls (Name, Floor, ScreenQuality, CinemaId) VALUES ('Royal','3','8K',(SELECT id FROM Cinemas WHERE Name = 'Golden Screens'));
INSERT INTO CinemaHalls (Name, Floor, ScreenQuality, CinemaId) VALUES ('Omega','3','4K',(SELECT id FROM Cinemas WHERE Name = 'Golden Screens'));
INSERT INTO CinemaHalls (Name, Floor, ScreenQuality, CinemaId) VALUES ('Alpha','1','4K',(SELECT id FROM Cinemas WHERE Name = 'Cinema Paradiso'));
INSERT INTO CinemaHalls (Name, Floor, ScreenQuality, CinemaId) VALUES ('Galaxy','1','8K',(SELECT id FROM Cinemas WHERE Name = 'Cinema Paradiso'));
INSERT INTO CinemaHalls (Name, Floor, ScreenQuality, CinemaId) VALUES ('Cristal','2','4K',(SELECT id FROM Cinemas WHERE Name = 'Cinema Paradiso'));
INSERT INTO CinemaHalls (Name, Floor, ScreenQuality, CinemaId) VALUES ('Paramount','2','3D',(SELECT id FROM Cinemas WHERE Name = 'Cinema Paradiso'));
INSERT INTO CinemaHalls (Name, Floor, ScreenQuality, CinemaId) VALUES ('Royal','3','8K',(SELECT id FROM Cinemas WHERE Name = 'Cinema Paradiso'));
INSERT INTO CinemaHalls (Name, Floor, ScreenQuality, CinemaId) VALUES ('Omega','3','4K',(SELECT id FROM Cinemas WHERE Name = 'Cinema Paradiso'));
INSERT INTO CinemaHalls (Name, Floor, ScreenQuality, CinemaId) VALUES ('Alpha','1','4K',(SELECT id FROM Cinemas WHERE Name = 'Metro Movies'));
INSERT INTO CinemaHalls (Name, Floor, ScreenQuality, CinemaId) VALUES ('Galaxy','1','8K',(SELECT id FROM Cinemas WHERE Name = 'Metro Movies'));
INSERT INTO CinemaHalls (Name, Floor, ScreenQuality, CinemaId) VALUES ('Cristal','2','4K',(SELECT id FROM Cinemas WHERE Name = 'Metro Movies'));
INSERT INTO CinemaHalls (Name, Floor, ScreenQuality, CinemaId) VALUES ('Paramount','2','3D',(SELECT id FROM Cinemas WHERE Name = 'Metro Movies'));
INSERT INTO CinemaHalls (Name, Floor, ScreenQuality, CinemaId) VALUES ('Royal','3','8K',(SELECT id FROM Cinemas WHERE Name = 'Metro Movies'));
INSERT INTO CinemaHalls (Name, Floor, ScreenQuality, CinemaId) VALUES ('Omega','3','4K',(SELECT id FROM Cinemas WHERE Name = 'Metro Movies'));
INSERT INTO CinemaHalls (Name, Floor, ScreenQuality, CinemaId) VALUES ('Alpha','1','4K',(SELECT id FROM Cinemas WHERE Name = 'Sunset Theatres'));
INSERT INTO CinemaHalls (Name, Floor, ScreenQuality, CinemaId) VALUES ('Galaxy','1','8K',(SELECT id FROM Cinemas WHERE Name = 'Sunset Theatres'));
INSERT INTO CinemaHalls (Name, Floor, ScreenQuality, CinemaId) VALUES ('Cristal','2','4K',(SELECT id FROM Cinemas WHERE Name = 'Sunset Theatres'));
INSERT INTO CinemaHalls (Name, Floor, ScreenQuality, CinemaId) VALUES ('Paramount','2','3D',(SELECT id FROM Cinemas WHERE Name = 'Sunset Theatres'));
INSERT INTO CinemaHalls (Name, Floor, ScreenQuality, CinemaId) VALUES ('Royal','3','8K',(SELECT id FROM Cinemas WHERE Name = 'Sunset Theatres'));
INSERT INTO CinemaHalls (Name, Floor, ScreenQuality, CinemaId) VALUES ('Omega','3','4K',(SELECT id FROM Cinemas WHERE Name = 'Sunset Theatres'));
INSERT INTO CinemaHalls (Name, Floor, ScreenQuality, CinemaId) VALUES ('Alpha','1','4K',(SELECT id FROM Cinemas WHERE Name = 'Skyline Cineplex'));
INSERT INTO CinemaHalls (Name, Floor, ScreenQuality, CinemaId) VALUES ('Galaxy','1','8K',(SELECT id FROM Cinemas WHERE Name = 'Skyline Cineplex'));
INSERT INTO CinemaHalls (Name, Floor, ScreenQuality, CinemaId) VALUES ('Cristal','2','4K',(SELECT id FROM Cinemas WHERE Name = 'Skyline Cineplex'));
INSERT INTO CinemaHalls (Name, Floor, ScreenQuality, CinemaId) VALUES ('Paramount','2','3D',(SELECT id FROM Cinemas WHERE Name = 'Skyline Cineplex'));
INSERT INTO CinemaHalls (Name, Floor, ScreenQuality, CinemaId) VALUES ('Royal','3','8K',(SELECT id FROM Cinemas WHERE Name = 'Skyline Cineplex'));
INSERT INTO CinemaHalls (Name, Floor, ScreenQuality, CinemaId) VALUES ('Omega','3','4K',(SELECT id FROM Cinemas WHERE Name = 'Skyline Cineplex'));
INSERT INTO CinemaHalls (Name, Floor, ScreenQuality, CinemaId) VALUES ('Alpha','1','4K',(SELECT id FROM Cinemas WHERE Name = 'Cinema Lumiere'));
INSERT INTO CinemaHalls (Name, Floor, ScreenQuality, CinemaId) VALUES ('Galaxy','1','8K',(SELECT id FROM Cinemas WHERE Name = 'Cinema Lumiere'));
INSERT INTO CinemaHalls (Name, Floor, ScreenQuality, CinemaId) VALUES ('Cristal','2','4K',(SELECT id FROM Cinemas WHERE Name = 'Cinema Lumiere'));
INSERT INTO CinemaHalls (Name, Floor, ScreenQuality, CinemaId) VALUES ('Paramount','2','3D',(SELECT id FROM Cinemas WHERE Name = 'Cinema Lumiere'));
INSERT INTO CinemaHalls (Name, Floor, ScreenQuality, CinemaId) VALUES ('Royal','3','8K',(SELECT id FROM Cinemas WHERE Name = 'Cinema Lumiere'));
INSERT INTO CinemaHalls (Name, Floor, ScreenQuality, CinemaId) VALUES ('Omega','3','4K',(SELECT id FROM Cinemas WHERE Name = 'Cinema Lumiere'));
INSERT INTO CinemaHalls (Name, Floor, ScreenQuality, CinemaId) VALUES ('Alpha','1','4K',(SELECT id FROM Cinemas WHERE Name = 'Majestic Movies'));
INSERT INTO CinemaHalls (Name, Floor, ScreenQuality, CinemaId) VALUES ('Galaxy','1','8K',(SELECT id FROM Cinemas WHERE Name = 'Majestic Movies'));
INSERT INTO CinemaHalls (Name, Floor, ScreenQuality, CinemaId) VALUES ('Cristal','2','4K',(SELECT id FROM Cinemas WHERE Name = 'Majestic Movies'));
INSERT INTO CinemaHalls (Name, Floor, ScreenQuality, CinemaId) VALUES ('Paramount','2','3D',(SELECT id FROM Cinemas WHERE Name = 'Majestic Movies'));
INSERT INTO CinemaHalls (Name, Floor, ScreenQuality, CinemaId) VALUES ('Royal','3','8K',(SELECT id FROM Cinemas WHERE Name = 'Majestic Movies'));
INSERT INTO CinemaHalls (Name, Floor, ScreenQuality, CinemaId) VALUES ('Omega','3','4K',(SELECT id FROM Cinemas WHERE Name = 'Majestic Movies'));
INSERT INTO CinemaHalls (Name, Floor, ScreenQuality, CinemaId) VALUES ('Alpha','1','4K',(SELECT id FROM Cinemas WHERE Name = 'Dreamland Theatres'));
INSERT INTO CinemaHalls (Name, Floor, ScreenQuality, CinemaId) VALUES ('Galaxy','1','8K',(SELECT id FROM Cinemas WHERE Name = 'Dreamland Theatres'));
INSERT INTO CinemaHalls (Name, Floor, ScreenQuality, CinemaId) VALUES ('Cristal','2','4K',(SELECT id FROM Cinemas WHERE Name = 'Dreamland Theatres'));
INSERT INTO CinemaHalls (Name, Floor, ScreenQuality, CinemaId) VALUES ('Paramount','2','3D',(SELECT id FROM Cinemas WHERE Name = 'Dreamland Theatres'));
INSERT INTO CinemaHalls (Name, Floor, ScreenQuality, CinemaId) VALUES ('Royal','3','8K',(SELECT id FROM Cinemas WHERE Name = 'Dreamland Theatres'));
INSERT INTO CinemaHalls (Name, Floor, ScreenQuality, CinemaId) VALUES ('Omega','3','4K',(SELECT id FROM Cinemas WHERE Name = 'Dreamland Theatres'));

SELECT * FROM cinemahalls;

INSERT INTO CinemaHallsSeats (SeatNumber, Row, HallId) VALUES ('1','1',1);
INSERT INTO CinemaHallsSeats (SeatNumber, Row, HallId) VALUES ('2','1',1);
INSERT INTO CinemaHallsSeats (SeatNumber, Row, HallId) VALUES ('3','1',1);
INSERT INTO CinemaHallsSeats (SeatNumber, Row, HallId) VALUES ('4','1',1);
INSERT INTO CinemaHallsSeats (SeatNumber, Row, HallId) VALUES ('5','1',1);
INSERT INTO CinemaHallsSeats (SeatNumber, Row, HallId) VALUES ('6','1',1);
INSERT INTO CinemaHallsSeats (SeatNumber, Row, HallId) VALUES ('7','1',1);
INSERT INTO CinemaHallsSeats (SeatNumber, Row, HallId) VALUES ('8','1',1);
INSERT INTO CinemaHallsSeats (SeatNumber, Row, HallId) VALUES ('9','1',1);
INSERT INTO CinemaHallsSeats (SeatNumber, Row, HallId) VALUES ('10','1',1);
INSERT INTO CinemaHallsSeats (SeatNumber, Row, HallId) VALUES ('11','2',1);
INSERT INTO CinemaHallsSeats (SeatNumber, Row, HallId) VALUES ('12','2',1);
INSERT INTO CinemaHallsSeats (SeatNumber, Row, HallId) VALUES ('13','2',1);
INSERT INTO CinemaHallsSeats (SeatNumber, Row, HallId) VALUES ('14','2',1);
INSERT INTO CinemaHallsSeats (SeatNumber, Row, HallId) VALUES ('15','2',1);
INSERT INTO CinemaHallsSeats (SeatNumber, Row, HallId) VALUES ('16','2',1);
INSERT INTO CinemaHallsSeats (SeatNumber, Row, HallId) VALUES ('17','2',1);
INSERT INTO CinemaHallsSeats (SeatNumber, Row, HallId) VALUES ('18','2',1);
INSERT INTO CinemaHallsSeats (SeatNumber, Row, HallId) VALUES ('19','2',1);
INSERT INTO CinemaHallsSeats (SeatNumber, Row, HallId) VALUES ('20','2',1);
INSERT INTO CinemaHallsSeats (SeatNumber, Row, HallId) VALUES ('21','3',1);
INSERT INTO CinemaHallsSeats (SeatNumber, Row, HallId) VALUES ('22','3',1);
INSERT INTO CinemaHallsSeats (SeatNumber, Row, HallId) VALUES ('23','3',1);
INSERT INTO CinemaHallsSeats (SeatNumber, Row, HallId) VALUES ('24','3',1);
INSERT INTO CinemaHallsSeats (SeatNumber, Row, HallId) VALUES ('25','3',1);
INSERT INTO CinemaHallsSeats (SeatNumber, Row, HallId) VALUES ('26','3',1);
INSERT INTO CinemaHallsSeats (SeatNumber, Row, HallId) VALUES ('27','3',1);
INSERT INTO CinemaHallsSeats (SeatNumber, Row, HallId) VALUES ('28','3',1);
INSERT INTO CinemaHallsSeats (SeatNumber, Row, HallId) VALUES ('29','3',1);
INSERT INTO CinemaHallsSeats (SeatNumber, Row, HallId) VALUES ('30','3',1);
INSERT INTO CinemaHallsSeats (SeatNumber, Row, HallId) VALUES ('31','4',1);
INSERT INTO CinemaHallsSeats (SeatNumber, Row, HallId) VALUES ('32','4',1);
INSERT INTO CinemaHallsSeats (SeatNumber, Row, HallId) VALUES ('33','4',1);
INSERT INTO CinemaHallsSeats (SeatNumber, Row, HallId) VALUES ('34','4',1);
INSERT INTO CinemaHallsSeats (SeatNumber, Row, HallId) VALUES ('35','4',1);
INSERT INTO CinemaHallsSeats (SeatNumber, Row, HallId) VALUES ('36','4',1);
INSERT INTO CinemaHallsSeats (SeatNumber, Row, HallId) VALUES ('37','4',1);
INSERT INTO CinemaHallsSeats (SeatNumber, Row, HallId) VALUES ('38','4',1);
INSERT INTO CinemaHallsSeats (SeatNumber, Row, HallId) VALUES ('39','4',1);
INSERT INTO CinemaHallsSeats (SeatNumber, Row, HallId) VALUES ('40','4',1);

SELECT * FROM Movies;

INSERT INTO Movies (Title, Duration, ReleaseYear, Description, Language, Genre, AgeRestrictions, LicenseCost, AvailableFrom, AvailableUntil) VALUES ('The Shawshank Redemption', 142, '1994', 'A story of hope and friendship in a prison.', 'EN', 'DRAMA', '12+', '35000', '2022-10-22', '2023-12-31');
INSERT INTO Movies (Title, Duration, ReleaseYear, Description, Language, Genre, AgeRestrictions, LicenseCost, AvailableFrom, AvailableUntil) VALUES ('Pulp Fiction', 154, '1994', 'A twisted tale of crime and redemption.', 'EN', 'CRIME', '15+', '37000', '2022-06-17', '2023-12-31');
INSERT INTO Movies (Title, Duration, ReleaseYear, Description, Language, Genre, AgeRestrictions, LicenseCost, AvailableFrom, AvailableUntil) VALUES ('Inception', 148, '2010', 'A mind-bending heist in the world of dreams.', 'EN', 'SCI-FI', '12+', '30000', '2022-11-05', '2023-12-31');
INSERT INTO Movies (Title, Duration, ReleaseYear, Description, Language, Genre, AgeRestrictions, LicenseCost, AvailableFrom, AvailableUntil) VALUES ('The Lion King', 88, '1994', 'An animated tale about the journey of a lion who wants to reclaim his kingdom.', 'EN', 'ANIMATION', '3+', '25000', '2022-03-05', '2023-12-31');
INSERT INTO Movies (Title, Duration, ReleaseYear, Description, Language, Genre, AgeRestrictions, LicenseCost, AvailableFrom, AvailableUntil) VALUES ('The Avengers', 143, '2012', 'Superheroes unite to save the world from a threat.', 'EN', 'SCI-FI', '12+', '32000', '2022-02-10', '2023-12-31');
INSERT INTO Movies (Title, Duration, ReleaseYear, Description, Language, Genre, AgeRestrictions, LicenseCost, AvailableFrom, AvailableUntil) VALUES ('Gladiator', 155, '2000', 'A Roman general becomes a gladiator.', 'EN', 'ACTION', '15+', '33000', '2022-03-17', '2023-12-31');
INSERT INTO Movies (Title, Duration, ReleaseYear, Description, Language, Genre, AgeRestrictions, LicenseCost, AvailableFrom, AvailableUntil) VALUES ('Avatar', 162, '2009', 'Humans explore an alien world for resources.', 'EN', 'SCI-FI', '12+', '42000', '2022-12-12', '2023-12-31');
INSERT INTO Movies (Title, Duration, ReleaseYear, Description, Language, Genre, AgeRestrictions, LicenseCost, AvailableFrom, AvailableUntil) VALUES ('The Silence of the Lambs', 118, '1991', 'An FBI agent consults a brilliant but insane serial killer to catch another.', 'EN', 'THRILLER', '17+', '28000', '2022-04-08', '2023-12-31');
INSERT INTO Movies (Title, Duration, ReleaseYear, Description, Language, Genre, AgeRestrictions, LicenseCost, AvailableFrom, AvailableUntil) VALUES ('Toy Story', 81, '1995', 'Animated toys come to life when their owner is away.', 'EN', 'ANIMATION', '3+', '25000', '2022-02-04', '2023-12-31');
INSERT INTO Movies (Title, Duration, ReleaseYear, Description, Language, Genre, AgeRestrictions, LicenseCost, AvailableFrom, AvailableUntil) VALUES ('Fight Club', 139, '1999', 'An underground fight club leads to anarchy.', 'EN', 'DRAMA', '15+', '29000', '2022-08-14', '2023-12-31');

INSERT INTO Sessions (FilmId, HallId, SessionDate, SessionTime, TicketPrice)
	VALUES (1, 1, '2023-08-01', '10:00', 24);
INSERT INTO Sessions (FilmId, HallId, SessionDate, SessionTime, TicketPrice)
	VALUES (1, 11, '2023-08-01', '10:00', 24);
INSERT INTO Sessions (FilmId, HallId, SessionDate, SessionTime, TicketPrice)
	VALUES (1, 19, '2023-08-01', '10:00', 24);
INSERT INTO Sessions (FilmId, HallId, SessionDate, SessionTime, TicketPrice)
	VALUES (1, 28, '2023-08-01', '10:00', 24);
INSERT INTO Sessions (FilmId, HallId, SessionDate, SessionTime, TicketPrice)
	VALUES (1, 37, '2023-08-01', '10:00', 24);

INSERT INTO Sessions (FilmId, HallId, SessionDate, SessionTime, TicketPrice)
	VALUES (2, 2, '2023-08-04', '12:00', 24);
INSERT INTO Sessions (FilmId, HallId, SessionDate, SessionTime, TicketPrice)
	VALUES (2, 12, '2023-08-04', '12:00', 24);
INSERT INTO Sessions (FilmId, HallId, SessionDate, SessionTime, TicketPrice)
	VALUES (2, 20, '2023-08-04', '12:00', 24);
INSERT INTO Sessions (FilmId, HallId, SessionDate, SessionTime, TicketPrice)
	VALUES (2, 27, '2023-08-04', '12:00', 24);
INSERT INTO Sessions (FilmId, HallId, SessionDate, SessionTime, TicketPrice)
	VALUES (2, 36, '2023-08-04', '12:00', 24);

INSERT INTO Sessions (FilmId, HallId, SessionDate, SessionTime, TicketPrice)
	VALUES (3, 3, '2023-08-07', '14:00', 24);
INSERT INTO Sessions (FilmId, HallId, SessionDate, SessionTime, TicketPrice)
	VALUES (3, 13, '2023-08-07', '14:00', 24);
INSERT INTO Sessions (FilmId, HallId, SessionDate, SessionTime, TicketPrice)
	VALUES (3, 21, '2023-08-07', '14:00', 24);
INSERT INTO Sessions (FilmId, HallId, SessionDate, SessionTime, TicketPrice)
	VALUES (3, 32, '2023-08-07', '14:00', 24);
INSERT INTO Sessions (FilmId, HallId, SessionDate, SessionTime, TicketPrice)
	VALUES (3, 43, '2023-08-07', '14:00', 24);

INSERT INTO Sessions (FilmId, HallId, SessionDate, SessionTime, TicketPrice)
	VALUES (4, 4, '2023-08-09', '15:00', 24);
INSERT INTO Sessions (FilmId, HallId, SessionDate, SessionTime, TicketPrice)
	VALUES (4, 14, '2023-08-09', '15:00', 24);
INSERT INTO Sessions (FilmId, HallId, SessionDate, SessionTime, TicketPrice)
	VALUES (4, 22, '2023-08-09', '15:00', 24);
INSERT INTO Sessions (FilmId, HallId, SessionDate, SessionTime, TicketPrice)
	VALUES (4, 33, '2023-08-09', '15:00', 24);
INSERT INTO Sessions (FilmId, HallId, SessionDate, SessionTime, TicketPrice)
	VALUES (4, 44, '2023-08-09', '15:00', 24);

INSERT INTO Sessions (FilmId, HallId, SessionDate, SessionTime, TicketPrice)
	VALUES (5, 5, '2023-08-12', '16:00', 24);
INSERT INTO Sessions (FilmId, HallId, SessionDate, SessionTime, TicketPrice)
	VALUES (5, 15, '2023-08-12', '16:00', 24);
INSERT INTO Sessions (FilmId, HallId, SessionDate, SessionTime, TicketPrice)
	VALUES (5, 23, '2023-08-12', '16:00', 24);
INSERT INTO Sessions (FilmId, HallId, SessionDate, SessionTime, TicketPrice)
	VALUES (5, 34, '2023-08-12', '16:00', 24);
INSERT INTO Sessions (FilmId, HallId, SessionDate, SessionTime, TicketPrice)
	VALUES (5, 45, '2023-08-12', '16:00', 24);

INSERT INTO Sessions (FilmId, HallId, SessionDate, SessionTime, TicketPrice)
	VALUES (6, 6, '2023-08-15', '17:00', 24);
INSERT INTO Sessions (FilmId, HallId, SessionDate, SessionTime, TicketPrice)
	VALUES (6, 24, '2023-08-15', '17:00', 24);
INSERT INTO Sessions (FilmId, HallId, SessionDate, SessionTime, TicketPrice)
	VALUES (6, 35, '2023-08-15', '17:00', 24);
INSERT INTO Sessions (FilmId, HallId, SessionDate, SessionTime, TicketPrice)
	VALUES (6, 46, '2023-08-15', '17:00', 24);
INSERT INTO Sessions (FilmId, HallId, SessionDate, SessionTime, TicketPrice)
	VALUES (6, 51, '2023-08-15', '17:00', 24);

INSERT INTO Sessions (FilmId, HallId, SessionDate, SessionTime, TicketPrice)
	VALUES (7, 7, '2023-08-17', '18:00', 24);
INSERT INTO Sessions (FilmId, HallId, SessionDate, SessionTime, TicketPrice)
	VALUES (7, 25, '2023-08-17', '18:00', 24);
INSERT INTO Sessions (FilmId, HallId, SessionDate, SessionTime, TicketPrice)
	VALUES (7, 30, '2023-08-17', '18:00', 24);
INSERT INTO Sessions (FilmId, HallId, SessionDate, SessionTime, TicketPrice)
	VALUES (7, 47, '2023-08-17', '18:00', 24);
INSERT INTO Sessions (FilmId, HallId, SessionDate, SessionTime, TicketPrice)
	VALUES (7, 52, '2023-08-17', '18:00', 24);

INSERT INTO Sessions (FilmId, HallId, SessionDate, SessionTime, TicketPrice)
	VALUES (8, 8, '2023-08-19', '19:00', 24);
INSERT INTO Sessions (FilmId, HallId, SessionDate, SessionTime, TicketPrice)
	VALUES (8, 26, '2023-08-19', '19:00', 24);
INSERT INTO Sessions (FilmId, HallId, SessionDate, SessionTime, TicketPrice)
	VALUES (8, 38, '2023-08-19', '19:00', 24);
INSERT INTO Sessions (FilmId, HallId, SessionDate, SessionTime, TicketPrice)
	VALUES (8, 48, '2023-08-19', '19:00', 24);
INSERT INTO Sessions (FilmId, HallId, SessionDate, SessionTime, TicketPrice)
	VALUES (8, 53, '2023-08-19', '19:00', 24);

INSERT INTO Sessions (FilmId, HallId, SessionDate, SessionTime, TicketPrice)
	VALUES (9, 9, '2023-08-22', '20:00', 24);
INSERT INTO Sessions (FilmId, HallId, SessionDate, SessionTime, TicketPrice)
	VALUES (9, 29, '2023-08-22', '20:00', 24);
INSERT INTO Sessions (FilmId, HallId, SessionDate, SessionTime, TicketPrice)
	VALUES (9, 39, '2023-08-22', '20:00', 24);
INSERT INTO Sessions (FilmId, HallId, SessionDate, SessionTime, TicketPrice)
	VALUES (9, 49, '2023-08-22', '20:00', 24);
INSERT INTO Sessions (FilmId, HallId, SessionDate, SessionTime, TicketPrice)
	VALUES (9, 54, '2023-08-22', '20:00', 24);

INSERT INTO Sessions (FilmId, HallId, SessionDate, SessionTime, TicketPrice)
	VALUES (10, 10, '2023-08-25', '20:30', 24);
INSERT INTO Sessions (FilmId, HallId, SessionDate, SessionTime, TicketPrice)
	VALUES (10, 31, '2023-08-25', '20:30', 24);
INSERT INTO Sessions (FilmId, HallId, SessionDate, SessionTime, TicketPrice)
	VALUES (10, 40, '2023-08-25', '20:30', 24);
INSERT INTO Sessions (FilmId, HallId, SessionDate, SessionTime, TicketPrice)
	VALUES (10, 50, '2023-08-25', '20:30', 24);
INSERT INTO Sessions (FilmId, HallId, SessionDate, SessionTime, TicketPrice)
	VALUES (10, 59, '2023-08-25', '20:30', 24);

SELECT * FROM Sessions;