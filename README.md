# WSDA Music Management SQL Project

This project contains a series of SQL queries written using SQLite syntax to analyse and extract insights from the WSDA Music Management database. The queries cover aspects such as employee details, customer mailing addresses, invoice categorisation, sales aggregation, and specific analyses grouped by city or high-value criteria. Each query is designed to demonstrate a range of SQL skills, from basic querying to more advanced data analysis techniques, and covers data retrieval, transformation, aggregation, and complex joins, showing a comprehensive use of SQL for database analysis.

## Queries Overview
The project includes queries for:
- Employee and customer data retrieval
- Sales performance analysis
- Invoice categorization
- Aggregate sales statistics
- City-based sales analysis with various filtering and grouping options

## Key Insights

* **Employee Demographics**: I extracted employee names and birth dates and also calculated their ages using SQL date functions.
  
* **Customer Information**: I extracted full names and mailing addresses, including a formatted postal code for US customers
  
* **Top 10 Sales Representatives**: I extracted the top-performing sales representatives based on total invoice amounts by joining the Employee, Customer, and Invoice tables.
  
* **Purchase Categorisation**: Based on the total amount, I categorised invoices into different purchase types (Baseline, Low, Target, and Top Performer).
  
* **Sales Statistics**: I utilised aggregate and nested functions to calculate key metrics for all invoices (total sales, average sales, maximum and minimum sales, and the total number of sales).
  
* **City-based Analysis**: 
   - Average total invoice by
     - Billing cities
     - Cities starting with letter 'L'.
     - Cities with average total invoice greater than $5
     - Cities starting with letter 'B' and having average totals above $5

## How to Use

These SQLite syntax work with a relational database management system (RDBMS) using a DB Browser for SQLite. Each query is commented on with its purpose and creation details and I included the WSDA Music Management database.

Feel free to contribute to this project by adding new queries or improving existing ones!

**Collaborations:**

Reach out to me using my contact below for gigs and collaborations.

ike@ikemefulaoriaku.space | (https://www.linkedin.com/in/gentleiyke/)
