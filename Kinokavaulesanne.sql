CREATE DATABASE procKinokava;
-- create db

USE procKinokava;
-- use db

CREATE TABLE kinokava (
    filmiID INT PRIMARY KEY IDENTITY(1,1),
    filmiNimetus VARCHAR(100), 
    Autor VARCHAR(50),
    genre VARCHAR(50),
    premierData DATE
);
-- cr table

SELECT * FROM kinokava;
--выбрать из таблицы кинопрограммы

INSERT INTO kinokava (
    filmiNimetus, Autor, genre, premierData
) VALUES (
    'Interstellar', 'Christopher Nolan', 'Sci-Fi', '2014-11-07'
);
--вставить  в таблицу
CREATE PROCEDURE lisaFilm
    @uusNimetus VARCHAR(100),
    @autor VARCHAR(50),
    @zanr VARCHAR(50),
    @premier DATE
AS
BEGIN
    INSERT INTO kinokava (
        filmiNimetus, Autor, genre, premierData
    ) VALUES (
        @uusNimetus, @autor, @zanr, @premier
    );
    SELECT * FROM kinokava;
END;
-- kustuta 
EXEC lisaFilm 'Coolfilm', 'Evgeny Onegin', 'Thriller', '2011-07-16';

CREATE PROCEDURE kustutaFilm
    @id INT
AS
BEGIN
    SELECT * FROM kinokava;
    DELETE FROM kinokava WHERE filmiID = @id;
    SELECT * FROM kinokava;
END;
--kustuta 
EXEC kustutaFilm 6;

UPDATE kinokava 
SET genre = 'Drama'
WHERE genre LIKE 'Sci-Fi';

SELECT * FROM kinokava;

CREATE PROCEDURE uuendaZanr
    @uuszanr VARCHAR(50)
AS
BEGIN
    UPDATE kinokava 
    SET genre = @uuszanr
    WHERE genre LIKE 'Sci-Fi';
    SELECT * FROM kinokava;
END;
 
EXEC uuendaZanr @uuszanr = 'Thriller';

CREATE PROCEDURE otsingAutor
    @taht CHAR(1)
AS
BEGIN
    SELECT * FROM kinokava 
    WHERE Autor LIKE @taht + '%';
END;
 
EXEC otsingAutor 'C';
