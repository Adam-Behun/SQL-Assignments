/* 1. */

SELECT ticker, fullname, price
FROM Stock;

/* 2. */

SELECT *, Length(fullname) AS "LengthOfName" FROM Stock;

/* 3. */

SELECT * 
FROM Stock
ORDER BY Ticker;

/* 4. */

SELECT *
FROM Stock
ORDER BY Price DESC;

/* 5. */

SELECT * 
FROM Stock
ORDER BY Sector ASC, Ticker ASC;

/* 6. */

SELECT Sector, EPS, Ticker, price
FROM Stock
ORDER BY Sector DESC, EPS DESC;

/* 7. */

SELECT *,  (max_salary - min_salary) AS diff_salary 
FROM job
ORDER BY diff_salary DESC;

/* 8. */

SELECT * 
FROM Stock
LIMIT 10;

/* 9. */

SELECT * 
FROM Stock
ORDER BY price DESC
LIMIT 5;

/* 10. */

SELECT * 
FROM Stock
ORDER BY EPS DESC
LIMIT 3;

/* 11. */

SELECT Ticker, Price, eps
FROM Stock
ORDER BY EPS DESC 
LIMIT 5
OFFSET 3;

/* 12. */

SELECT FullName 
FROM Stock
ORDER BY eps DESC
LIMIT 1
OFFSET 2;

/* 13. */

SELECT DISTINCT Sector FROM Stock;

/* 14. */

SELECT DISTINCT first_name
FROM employee;

/* 15. */

SELECT COUNT(DISTINCT first_name) AS unique_first_name
FROM employee;

/* 16. */

SELECT COUNT(DISTINCT Ticker)
FROM Stock;

/* 17 */

SELECT * FROM Stock WHERE Ticker = "TSLA";

/* 18 */

SELECT * FROM Stock WHERE Ticker IN ("TSL", "AAPL");

/* 19 */

SELECT * 
FROM Stock
WHERE Price > 250;

/* 20 */

SELECT * FROM Stock
WHERE Price < 100 OR Price > 1000; 

/* 21 */

SELECT * FROM Stock 
WHERE Price < 500 AND EPS > 5;

/* 22 */

SELECT * FROM Stock
WHERE ID != 7;

/* 23 */

SELECT * 
FROM Stock
WHERE Price BETWEEN 100 AND 300;

/* 24 */

SELECT * 
FROM Stock
WHERE Price NOT BETWEEN 100 and 300;

/* 25 */

SELECT * 
FROM Stock
WHERE Ticker NOT IN ("V", "FB", "PYPL");

/* 26 */

SELECT *
FROM Stock
WHERE EPS IS NULL; 

/* 27 */

SELECT * 
FROM Stock
WHERE FullName LIKE 'A%';

/* 28 */

SELECT *
FROM Stock
WHERE Length(Ticker) = 4; 

/* 29 */

SELECT *
FROM Stock
WHERE FullName LIKE '%INC%' AND Length(Ticker) = 4;

/* 30 */

SELECT *
FROM Stock
WHERE FullName NOT LIKE '%CORP%';

/* 31 */

SELECT *
FROM Stock
WHERE Sector LIKE '%Tech%' AND EPS > 5;

/* 32 */

SELECT Sector, AVG(EPS) AS AvgEPSPerSector
FROM Stock
GROUP BY Sector
HAVING AvgEPSPerSector > 10
ORDER BY AvgEPSPerSector DESC;

/* 33 */

SELECT *,
CASE 
WHEN EPS IS NULL THEN NULL
WHEN EPS < 5 THEN 'low'
WHEN EPS < 10 THEN 'medium'
ELSE 'high'
END AS EPSLevel
FROM Stock;

/* 34 */

SELECT *,
CASE 
WHEN Price IS NULL THEN NULL
WHEN Price > 659 THEN 'above average'
WHEN Price < 659 THEN 'below average'
ELSE 'average'
END AS PriceComparison
FROM Stock;

