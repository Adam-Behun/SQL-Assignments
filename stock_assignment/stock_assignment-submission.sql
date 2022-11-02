-- Adam Behun SLU'24

-- Answer the following queries: (each 2 points)

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

/* 34 Compute the average of price column, then decide whethert price of one company is higher, lower, or average. */

SELECT *,
CASE 
WHEN Price IS NULL THEN NULL
WHEN Price > 659 THEN 'above average'
WHEN Price < 659 THEN 'below average'
ELSE 'average'
END AS PriceComparison
FROM Stock;