-- Adam Behun SLU'24

-- Answer the following queries: (each 2 points)

--1.	Write a SQL statement to display the breed and type of all pets.

SELECT PetType, PetBreed FROM PET;

--2.	Write a SQL statement to display the breed, type, and DOB of all pets having the type Dog.

SELECT PetType, PetBreed, PetDOB
FROM PET
WHERE PetType = "Dog";

--3.	Write an SQL statement to display the PetBreed column of PET.

SELECT PetBreed 
FROM PET;

--4.	Write a SQL statement to display the PetBreed column of PET. Do not show duplicates.

SELECT DISTINCT PetBreed 
FROM PET;

--5.	Write a SQL statement to display the breed, type, and DOB for all pets having the type Dog and the breed Std. Poodle.

SELECT PetBreed, PetType, PetDOB
FROM PET
WHERE PetType = "Dog" AND PetBreed = "Std. Poodle";

--6.	Write a SQL statement to display the name, breed, and type for all pets that are not of type Bird, Dog, or Fish.

SELECT PetName, PetBreed, PetType
FROM PET
WHERE PetType != "Dog" AND PetType != "Fish" AND PetType != "Bird";

--7.	Write a SQL statement to display the last name, first name and email of all owners who have an email address ending with somewhere.com. Assume that 
--email account names can be any number of characters.

SELECT OwnerLastName, OwnerFirstName, OwnerEmail
FROM PET_OWNER
WHERE OwnerEmail LIKE "%somewhere.com";

--8.	Write an SQL statement to display the last name, first name and email of any owner who has a NULL value for OwnerPhone.

SELECT OwnerLastName, OwnerFirstName, OwnerEmail
FROM PET_OWNER
WHERE OwnerPhone IS NULL;

--9.	Write an SQL statement to display the name and breed of all pets sorted by PetName.

SELECT PetName, PetBreed
FROM PET
GROUP BY PetName
ORDER BY PetName;

--10.	Write a SQL statement to display the name and breed of all pets sorted by PetBreed in ascending order and by PetName in descending order within PetBreed.

SELECT PetName, PetBreed
FROM PET
ORDER BY PetBreed ASC, PetName DESC;

--11.	Write an SQL statement to count the number of distinct breeds.

SELECT COUNT(DISTINCT PetBreed)
FROM PET;

--12.	Write an SQL statement to display the last name, first name, and email of any owners of cats with the name Teddy.

SELECT OwnerLastName, OwnerFirstName, OwnerEmail, PetName, PetType
FROM PET_OWNER AS O JOIN PET AS P
WHERE O.OwnerID = P.OwnerID AND P.PetType = "Cat" AND P.PetName = "Teddy";

--13.	Write an SQL statement to display the minimum, maximum, and average weight of dogs.

SELECT MIN(PetWeight), MAX(PetWeight), AVG(PetWeight)
FROM PET_WEIGHT
WHERE PetType = "Dog";

--14.	Write an SQL statement to group the data by PetBreed and display the average Weight per breed.

SELECT AVG(PetWeight), PetBreed
FROM PET_WEIGHT
WHERE PetBreed NOT NULL
GROUP BY PetBreed;

--15.	Display the last name, first name, and email of any owner of a pet that has an AverageLifeExpectancy value greater than 15

SELECT DISTINCT O.OwnerLastName, O.OwnerFirstName, O.OwnerEmail
FROM PET_OWNER AS O, BREED AS B, PET AS P
WHERE B.AverageLifeExpectancy > 15;