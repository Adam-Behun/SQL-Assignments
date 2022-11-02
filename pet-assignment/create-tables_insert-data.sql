/* Drop tables if exist*/

DROP TABLE IF EXISTS PET_OWNER;
DROP TABLE IF EXISTS BREED;
DROP TABLE IF EXISTS PET;
DROP TABLE IF EXISTS PET_WEIGHT;


CREATE TABLE PET_OWNER(
		OwnerID INTEGER PRIMARY KEY,
		OwnerLastName TEXT,
		OwnerFirstName TEXT,
		OwnerPhone TEXT,
		OwnerEmail TEXT);
		
CREATE TABLE BREED(
		BreedName TEXT NOT NULL,
		MinWeight INTEGER,
		MaxWeight INTEGER,
		AverageLifeExpectancy INTEGER);
		
CREATE TABLE PET(
		PetID INTEGER PRIMARY KEY,
		PetName TEXT,
		PetType TEXT,
		PetBreed TEXT,
		PetDOB DateTime,
		OwnerID INTEGER,
		FOREIGN KEY (OwnerID) REFERENCES PET_OWNER(OwnerID));
		
CREATE TABLE PET_WEIGHT(
		PetID INTEGER PRIMARY KEY,
		PetName TEXT,
		PetType TEXT,
		PetBreed TEXT,
		PetDOB DateTime,
		PetWeight INTEGER,
		OwnerID INTEGER,
		FOREIGN KEY (OwnerID) REFERENCES PET_OWNER(OwnerID));


/*Insert Data*/

INSERT INTO PET_OWNER VALUES(1, 'Downs', 'Marsha', '555-537-8765', 'Marsha.Downs@somewhere.com');
INSERT INTO PET_OWNER VALUES(2, 'James', 'Richard', '555-537-7654', 'Richard.James@somewhere.com');
INSERT INTO PET_OWNER VALUES(3, 'Frier', 'Liz', '555-537-6543', 'Liz.Frier@somewhere.com');
INSERT INTO PET_OWNER (OwnerID, OwnerLastName, OwnerFirstName) VALUES(4,'Trent', 'Miles');


INSERT INTO BREED VALUES('BorderCollie', 15.0, 22.5, 20);
INSERT INTO BREED VALUES('Cashmier', 10.0, 15.0, 12);
INSERT INTO BREED VALUES('Collie Mix', 17.5, 25.0, 18);
INSERT INTO BREED VALUES('Std. Poodle', 22.5, 30.0, 18);
INSERT INTO BREED(BreedName) VALUES('Unknown');


INSERT INTO PET VALUES(1, 'King', 'Dog', 'Std. Poodle', '27-Feb-09', 1);
INSERT INTO PET VALUES(2, 'Teddy', 'Cat', 'Cashmier', '01-Feb-10', 2);
INSERT INTO PET VALUES(3, 'Fido', 'Dog', 'Std. Poodle', '17-Jul-08', 1);
INSERT INTO PET VALUES(4, 'AJ', 'Dog', 'Collie Mix', '05-May-09', 3);
INSERT INTO PET VALUES(5, 'Cedro', 'Cat', 'Unknown', '06-Jun-07', 2);
INSERT INTO PET(PetID, PetName, PetType, PetBreed, OwnerID) VALUES(6,'Woolley', 'Cat', 'Unknown', 2);
INSERT INTO PET VALUES(7, 'Buster', 'Dog', 'BorderCollie', '11-Dec-06', 4);


INSERT INTO PET_WEIGHT VALUES (1, 'King', 'Dog', 'Std. Poodle', '27-Feb-09', 25.5, 1);
INSERT INTO PET_WEIGHT VALUES (2, 'Teddy', 'Cat', 'Cashmier', '01-Feb-10', 10.5, 2);
INSERT INTO PET_WEIGHT VALUES (3, 'Fido', 'Dog', 'Std. Poodle', '17-Jul-08', 28.5, 1);
INSERT INTO PET_WEIGHT VALUES (4, 'AJ', 'Dog', 'Collie Mix', '05-May-09', 20.0, 3);
INSERT INTO PET_WEIGHT VALUES (5, 'Cedro', 'Cat', 'Unknown', '06-Jun-07', 9.5, 2);
INSERT INTO PET_WEIGHT VALUES (7, 'Buster', 'Dog', 'BorderCollie', '11-Dec-06', 25.0, 4);
