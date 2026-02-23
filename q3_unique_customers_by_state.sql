-- Q3: Count how many distinct customers are in each state, sorted A to Z.
-- We join to invoices so only customers who made a purchase are counted.
-- States with no value are excluded using WHERE State IS NOT NULL.
SELECT c.State, COUNT(DISTINCT c.CustomerId) AS UniqueCustomers
FROM customers c
JOIN invoices i ON c.CustomerId = i.CustomerId
WHERE c.State IS NOT NULL
GROUP BY c.State
ORDER BY c.State ASC;
