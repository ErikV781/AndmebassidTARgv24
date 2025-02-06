--SQL SALVESTATUD PROTSEDUURID-- Funktsioonid - mitu SQL käsku käivitakse järjest 
--SQL SERVER 
CREATE DATABASE procTARgv24; 
--liisa uus database
USE procTARgv24;
--use 

CREATE TABLE uudised (
    uudisID INT PRIMARY KEY IDENTITY(1,1),
    uudiseTeema VARCHAR(50), 
    kuupaev DATE,
    autor VARCHAR(25),
    kirjeldus TEXT
);
--create table 

SELECT * FROM uudised;

INSERT INTO uudised (
    uudiseTeema, kuupaev, autor, kirjeldus
) VALUES (
    'udune ilm', '2025-02-06', 'postimees', 'lõunani on udune ilm'
);

CREATE PROCEDURE lisaUudis
    @uusTeema VARCHAR(50),
    @paev DATE,
    @autor VARCHAR(20),
    @kirjeldus TEXT
AS
BEGIN
    INSERT INTO uudised (
        uudiseTeema, kuupaev, autor, kirjeldus
    ) VALUES (
        @uusTeema, @paev, @autor, @kirjeldus
    );
    SELECT * FROM uudised;
END;
--kutse 
EXEC lisaUudis 'windows 11', '2025-02-06', 'Õpetaja Pant', 'w11 ei tööta';
EXEC lisaUudis 
    @uusTeema = '1.märts on juba kevad',
    @paev = '2025-02-06',
    @autor = 'test',
    @kirjeldus = 'puudub';

CREATE PROCEDURE kustutaUudis
    @id INT
AS
BEGIN
    SELECT * FROM uudised;
    DELETE FROM uudised WHERE uudisID = @id;
    SELECT * FROM uudised;
END;
--kutse 
EXEC kustutaUudis 3;
EXEC kustutaUudis @id = 3;

UPDATE uudised 
SET kirjeldus = 'uus kirjeldus'
WHERE kirjeldus LIKE 'puudub';

SELECT * FROM uudised;

CREATE PROCEDURE uuendaKirjeldus 
    @uuskirjeldus TEXT
AS
BEGIN
    UPDATE uudised 
    SET kirjeldus = @uuskirjeldus
    WHERE kirjeldus LIKE 'puudub';
    SELECT * FROM uudised;
END;
--kutse 
EXEC uuendaKirjeldus @uuskirjeldus = 'uus tekst kirjelduses';

CREATE PROCEDURE otsingUudiseTeema
    @taht CHAR(1)
AS
BEGIN
    SELECT * FROM uudised 
    WHERE uudiseTeema LIKE @taht + '%';
END;
--kutse 
EXEC otsingUudiseTeema 'w';
