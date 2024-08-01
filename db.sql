-- SQL data analytic queries using data from WSDA Music Management
/* 
Created by: Ikemefula Oriaku
Created on: 26/05/2023
Description: List Employee's name, date of birth and age
*/
SELECT 
	FirstName || ' ' || LastName AS 'Full Name',
	BirthDate AS 'Date of Birth',
	strftime('%Y-%m-%d', BirthDate) AS 'Birth Date with No Timeline',
	strftime('%Y-%m-%d', 'now') - strftime('%Y-%m-%d', BirthDate) AS 'Age'
FROM 
	Employee

/* 
Created by: Ikemefula Oriaku
Created on: 26/05/2023
Description: List Customer's name and mailing address with postal code
*/
SELECT 
	FirstName || ' ' || LastName AS 'Full Name',
	Address || ' ' || City || ' ' || State || ' ' || PostalCode AS 'Mailing Address',
	LENGTH(PostalCode) AS 'Postal Code Length',
	substr(PostalCode, 1,5) AS 'Formatted Postal Code'
FROM 
	Customer
WHERE
	Country = 'USA'

/* 
Created by: Ikemefula Oriaku
Created on: 6/05/2023
Description: Selecting multiple tables in a database using JOIN
*/

SELECT 
	e.FirstName ||' '||
	e.LastName AS 'Employee Name',
	e.EmployeeId AS 'Employee ID',
	c.FirstName AS 'Customer First Name',
	c.LastName AS 'Customer Last Name',
	c.SupportRepId 'Support Rep ID',
	i.CustomerId AS 'Customer ID',
	i.Total
FROM 
	Invoice AS i
INNER JOIN
	Customer AS c
ON
	i.CustomerId = c.CustomerId
INNER JOIN
	Employee AS e
ON
	c.SupportRepId = e.EmployeeId
ORDER BY 
	i.total DESC
LIMIT 10

/*
Created by: Ikemefula Oriaku
Created on: 06/05/2023
Description: Using the CASE clause to differentiate values
*/

SELECT 
	InvoiceDate AS 'Invoice Date',
	BillingAddress AS Address,
	BillingCity AS City,
	total,
CASE
WHEN total < 2.00 THEN 'Baseline Purchase'
WHEN total BETWEEN 2.00 AND 6.99 THEN 'Low Purchase'
WHEN total BETWEEN 7.00 AND 15.00 THEN 'Target Purchase'
ELSE 'Top Performer'
END AS PurchaseType
FROM 
	Invoice
WHERE
	PurchaseType = 'Top Performer'
ORDER BY
	BillingCity
	
	/*
Created by: Ikemefula Oriaku
Created on: 06/05/2023
Description: Aggregate and Nested Function: using aggregate and nested function to calculate grand total 
*/

SELECT
	SUM(total) AS 'Total Sales',
	ROUND(AVG(total),2) AS 'Average Sales',
	MAX(total) AS 'Maximum Sales',
	MIN(total) AS 'Minimum Sales',
	COUNT(*) AS 'Sales Count'
FROM
	Invoice
	
/*Created by: Ikemefula Oriaku
Created on: 01/06/2023
Description: Grouping in SQL: Group AVG invoice by city 
*/

SELECT
	BillingCity AS Cities,
	ROUND(AVG(total),2) AS 'Average Total'
FROM
	Invoice
GROUP BY
	BillingCity
ORDER BY
	BillingCity
	
/*
Created by: Ikemefula Oriaku
Created on: 01/06/2023
Description: Grouping in SQL: Group AVG invoice by city starting with L
*/

SELECT
	BillingCity AS 'Cities Starting with letter L',
	ROUND(AVG(total),2) AS 'Average Total'
FROM
	Invoice
WHERE 
		BillingCity LIKE 'L%'
GROUP BY
	BillingCity
ORDER BY
	BillingCity
	
/*
Created by: Ikemefula Oriaku
Created on: 01/06/2023
Description: Grouping in SQL: Group AVG invoice total greater than $5.00
*/

SELECT
	BillingCity AS Cities,
	ROUND(AVG(total),2) AS 'Average Total'
FROM
	Invoice
GROUP BY
	BillingCity
HAVING
AVG(total) > 5.00
ORDER BY
	BillingCity

/*
Created by: Ikemefula Oriaku
Created on: 01/06/2023
Description: Grouping in SQL: Group AVG invoice total greater than $5.00 for cities starting with B
*/

SELECT
	BillingCity AS 'Cities',
	ROUND(AVG(total),2) AS 'Average Total'
FROM
	Invoice
WHERE
	BillingCity LIKE 'B%'
GROUP BY
	BillingCity
HAVING
AVG(total) > 5.00
ORDER BY
	BillingCity
