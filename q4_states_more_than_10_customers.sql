-- Q4: Same as Q3 but only returns states where more than 10 unique customers made purchases.
-- HAVING filters the grouped results after counting, which is why we use it instead of WHERE here.
SELECT c.State, COUNT(DISTINCT c.CustomerId) AS UniqueCustomers
FROM customers c
JOIN invoices i ON c.CustomerId = i.CustomerId
WHERE c.State IS NOT NULL
GROUP BY c.State
HAVING COUNT(DISTINCT c.CustomerId) > 10;
