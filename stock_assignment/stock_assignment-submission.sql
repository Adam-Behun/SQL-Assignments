-- Adam Behun SLU'24

-- Answer the following queries: (each 2 points)

-- Stock

/* 1. Create a query that displays the columns in the given order: Ticekr, FullName, Price*/

SELECT ticker, fullname, price
FROM Stock;

/* 2. Create a query that displays all columns in the Stock table and adds a column names LengthOfName that returns the length of the company name*/

SELECT *, Length(fullname) AS "LengthOfName" FROM Stock;

/* 3. Print out all records of Stock table ordered by Ticker*/

SELECT * 
FROM Stock
ORDER BY Ticker;

/* 4. Order records by Price from high to low*/

SELECT *
FROM Stock
ORDER BY Price DESC;

/* 5. Show data in Stock table sorted by columns Sector ASC, and Ticker ASC*/

SELECT * 
FROM Stock
ORDER BY Sector ASC, Ticker ASC;

/* 6. Recreate the follwoing table (table screenshot provided below)*/

SELECT Sector, EPS, Ticker, price
FROM Stock
ORDER BY Sector DESC, EPS DESC;

/* 7. Show all data from the job table, add a column that calculates the difference between max and min salary assign it the alias diff_salary. Sort results by diff_salary column DESC*/

SELECT *,  (max_salary - min_salary) AS diff_salary 
FROM job
ORDER BY diff_salary DESC;

/* 8. Display the first 10 records of the stock table*/

SELECT * 
FROM Stock
LIMIT 10;

/* 9. Display the 5 stocks with the highest price. Sort by price column DESC*/

SELECT * 
FROM Stock
ORDER BY price DESC
LIMIT 5;

/* 10. Display the first three records of stock table with the highest EPS value. Sort by EPS column DESC*/

SELECT * 
FROM Stock
ORDER BY EPS DESC
LIMIT 3;

/* 11. Display Ticker, Price, EPS from Stock table and sort by EPS column. Skip the first three records and display the next five records only.*/

SELECT Ticker, Price, eps
FROM Stock
ORDER BY EPS DESC 
LIMIT 5
OFFSET 3;

/* 12. Display the company with the third highest EPS value*/

SELECT FullName 
FROM Stock
ORDER BY eps DESC
LIMIT 1
OFFSET 2;

/* 13. Display unique values from the sector column*/

SELECT DISTINCT Sector FROM Stock;

/* 14. Display unique first names of the employee table*/

SELECT DISTINCT first_name
FROM employee;

/* 15. Display the number of unique employee names as unique_first_names*/

SELECT COUNT(DISTINCT first_name) AS unique_first_name
FROM employee;

/* 16. Display the number of unique tickers*/

SELECT COUNT(DISTINCT Ticker)
FROM Stock;

/* 17 Display the record of Tesla, use Ticker*/

SELECT * FROM Stock WHERE Ticker = "TSLA";

/* 18 Display the records of Tesla and Apple, use Ticker*/

SELECT * FROM Stock WHERE Ticker IN ("TSL", "AAPL");

/* 19 Display records of companies with price higher than $250*/

SELECT * 
FROM Stock
WHERE Price > 250;

/* 20 Display companies with prices lower than $100 or higher than $1000*/

SELECT * FROM Stock
WHERE Price < 100 OR Price > 1000; 

/* 21 Display companies with price lower than $500 and EPS higher than $5*/

SELECT * FROM Stock 
WHERE Price < 500 AND EPS > 5;

/* 22 Display companies that do not have ID = 7*/

SELECT * FROM Stock
WHERE ID != 7;

/* 23 Display companies with price between $100 and $300*/

SELECT * 
FROM Stock
WHERE Price BETWEEN 100 AND 300;

/* 24 Display companies with prices out of 100, 300*/

SELECT * 
FROM Stock
WHERE Price NOT BETWEEN 100 and 300;

/* 25 Display companies which do not have tickers V, FB, PYPL*/

SELECT * 
FROM Stock
WHERE Ticker NOT IN ("V", "FB", "PYPL");

/* 26 Display companies with missing EPS values*/

SELECT *
FROM Stock
WHERE EPS IS NULL; 

/* 27 Display companies with names starting with A*/

SELECT * 
FROM Stock
WHERE FullName LIKE 'A%';

/* 28 Display companies which tickers are 4 chars long*/

SELECT *
FROM Stock
WHERE Length(Ticker) = 4; 

/* 29 Display companies which names include the word INC*/

SELECT *
FROM Stock
WHERE FullName LIKE '%INC%' AND Length(Ticker) = 4;

/* 30 Display companies which do not have CORP in their names*/

SELECT *
FROM Stock
WHERE FullName NOT LIKE '%CORP%';

/* 31 Display companies with sector names containing TECH and EPS above $5*/

SELECT *
FROM Stock
WHERE Sector LIKE '%Tech%' AND EPS > 5;

/* 32 Group companies based on Sector, calculate the average EPS per secotr and display sectors with EPS higher than 10, sort DESC*/

SELECT Sector, AVG(EPS) AS AvgEPSPerSector
FROM Stock
GROUP BY Sector
HAVING AvgEPSPerSector > 10
ORDER BY AvgEPSPerSector DESC;

/* 33 Display Stock table data and add a column splitting eps values into three levels (low, medium, high)*/

SELECT *,
CASE 
WHEN EPS IS NULL THEN NULL
WHEN EPS < 5 THEN 'low'
WHEN EPS < 10 THEN 'medium'
ELSE 'high'
END AS EPSLevel
FROM Stock;

/* 34 Compute the average of price column, then decide whether price of one company is higher, lower, or average. */

SELECT *,
CASE 
WHEN Price IS NULL THEN NULL
WHEN Price > 659 THEN 'above average'
WHEN Price < 659 THEN 'below average'
ELSE 'average'
END AS PriceComparison
FROM Stock;



/* Employee and Stock tables queries*/

/*1. Display the top 5 highest paying positions*/ 

SELECT * 
FROM job
ORDER BY max_salary DESC
LIMIT 5;

/*2. Display the top 5 highest paying positions according to the mean of max and min salary*/

SELECT *, (max_salary + min_salary / 2) AS avg_salary 
FROM job
ORDER BY avg_salary
LIMIT 5;

/*3. Display job titles with minimum wage of $9000*/
 
SELECT job_title
FROM job
WHERE min_salary > 9000;

/*4. Display jobs where minimum wage is between 5000 and 8000*/

SELECT job_title
FROM job
WHERE min_salary BETWEEN 5000 AND  8000;

/*5. Display employees hires on 1992-12-07*/ 

SELECT *
FROM employee
WHERE hire_date = '1992-12-07';

/*6. Display employees where employee id is 101, 106, and 109*/ 

SELECT * 
FROM employee
WHERE employee_id IN (101,106,109);

/*7. Display the number of records in the stock table*/

SELECT COUNT(Id)
FROM Stock;

/*8. Display the number of non-missing eps values*/

SELECT COUNT(EPS) AS NonMissingEPS
FROM Stock
WHERE EPS NOT NULL;

/*9. Display the number of different sectors*/

SELECT COUNT (DISTINCT Sector) AS NumberOfSectors
FROM Stock;

/*10. Display maximum and minimum EPS values*/

SELECT MAX(EPS) AS MaxEps, MIN(EPS) AS MinEPS
FROM Stock;

/*11. How many stocks are there at different sectors*/

SELECT Sector, COUNT(*) AS NumOfStocks 
FROM Stock
GROUP BY Sector; 

/*12. Display the average eps values per sector*/

SELECT Sector, AVG(EPS) AS AvgEPSPerSector
FROM Stock
GROUP BY Sector
ORDER BY AvgEPSPerSector DESC;

/*13. Display the number employees at different departments*/

SELECT COUNT(DISTINCT employee_id) AS number_of_employees
FROM employee
GROUP BY department_id
ORDER BY number_of_employees DESC;

/*14. Display the average salary per job_id*/

SELECT AVG(salary) AS avg_salary
FROM employee
GROUP BY job_id
ORDER BY avg_salary DESC;

/*15. Display the job_ids and avg salaries with avg salary higher than 10000*/

SELECT job_id, AVG(salary) AS avg_salary
FROM employee
GROUP BY job_id
HAVING avg_salary > 10000
ORDER BY avg_salary DESC;

/*16. Display the job_ids and avg salaries with avg salary between 10000 and 20000*/

SELECT job_id, AVG(salary) AS avg_salary
FROM employee
GROUP BY job_id
HAVING avg_salary BETWEEN 10000 AND 20000
ORDER BY avg_salary DESC;

/*17. Display if company is in asia or not (1 or 0) */

SELECT country_id, country_name,
	CASE
		WHEN country_name IN ('China', 'HonkKong', 'Israel', 'India', 'Japan', 'Kuwait', 'Singapore')
			THEN 1
		ELSE 0
	END AS is_asia
FROM country;	

/*18. Display the job table, add a column that display the difference between max and min salary for a job, sort DESC*/

SELECT *,(max_salary - min_salary) AS diff_salary
FROM job
ORDER BY diff_salary DESC;

/*19. Display unique first names*/

SELECT DISTINCT first_name 
FROM employee;

/*20. Display the number of unique first names */

SELECT COUNT(DISTINCT first_name)
FROM employee;

/*21. Display departments for which salary is greater than 10000, use employee table*/

SELECT department_name FROM department
	WHERE department_id IN
		(SELECT department_id FROM employee WHERE salary > 10000);



--Left join exercises

/*1. Join department and location tables and display all results*/

SELECT *
FROM department AS t1
LEFT JOIN location AS t2 ON t1.location_id = t2.location_id;

/*2. Display department_id, department_name, street_address, city columns*/

SELECT t1.department_id, t1.department_name, t2.street_address, t2.city
FROM department AS t1
LEFT JOIN location AS t2 ON t1.location_id = t2.location_id;

/*3. Display all columns of department, location, and country tables*/

SELECT *
FROM department AS t1
LEFT JOIN location AS t2 ON t1.location_id = t2.location_id
LEFT JOIN country AS t3 ON t2.country_id = t3.country_id;

/*4. Display department_id, department_name, street_address, city, country_name*/

SELECT t1.department_id, t1.department_name, t2.street_address, t2.city, t3.country_name
FROM department AS t1
LEFT JOIN location AS t2 ON t1.location_id = t2.location_id
LEFT JOIN country AS t3 ON t2.country_id = t3.country_id;

/*5. Display all columns of the lef join of job and employee tables*/

SELECT * 
FROM employee AS t1
LEFT JOIN job AS t2 ON t1.job_id = t2.job_id;

/*6. Display employee_id, email, salary, job_title*/

SELECT t1.employee_id, t1.email, t1.salary, t2.job_title
FROM employee AS t1
LEFT JOIN job AS t2 ON t1.job_id = t2.job_id;

/*7. Display employee_id, email, salary, job_title but show salaries higher than 8000, sort DESC by salary*/

SELECT t1.employee_id, t1.email, t1.salary, t2.job_title
FROM employee AS t1
LEFT JOIN job AS t2 ON t1.job_id = t2.job_id
WHERE t1.salary > 8000
ORDER BY t1.salary DESC;

/*8. Left join employee, job, and department tables*/

SELECT t1.employee_id, t1.email, t1.salary, t2.job_title, t3.department_name
FROM employee AS t1
LEFT JOIN job AS t2 ON t1.job_id = t2.job_id
LEFT JOIN department AS t3 ON t1.department_id = t3.department_id;

/*9. Modify the above query: group at the department level and calculate the number of employees, sort by number_of_employees DESC*/

SELECT t3.department_name, COUNT(*) AS number_of_employees
FROM employee AS t1
LEFT JOIN job AS t2 ON t1.job_id = t2.job_id
LEFT JOIN department AS t3 ON t1.department_id = t3.department_id
GROUP BY t3.department_name
ORDER BY number_of_employees DESC;

/*10. Modify the above query: group at the job_title level, display the number of employees for each position, find the avg_salary at the position, sort DESC*/

SELECT job_title, COUNT(*) AS number_of_employees, AVG(salary) AS avg_salary 
FROM employee AS t1
LEFT JOIN job AS t2 ON t1.job_id = t2.job_id
GROUP BY job_title
ORDER BY avg_salary DESC;

/*11. Lef join location and country tables*/

SELECT t1.location_id, t1.street_address, t1.city, t2.country_name
FROM location AS t1
LEFT JOIN country AS t2 ON t1.country_id = t2.country_id
ORDER BY country_name ASC;