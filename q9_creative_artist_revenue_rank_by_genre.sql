-- Q9: Creative Addition
-- This query finds the top spending customer in each country.
-- It pulls from customers, invoices, and uses RANK() to order customers
-- within each country by how much they spent in total.
-- Each customer gets a rank -- rank 1 means they spent the most in their country.
-- Useful for seeing who the biggest buyers are in each region.

SELECT
    c.Country,
    c.FirstName || ' ' || c.LastName AS CustomerName,
    COUNT(DISTINCT i.InvoiceId) AS TotalOrders,
    ROUND(SUM(i.Total), 2) AS TotalSpent,
    RANK() OVER (PARTITION BY c.Country ORDER BY SUM(i.Total) DESC) AS SpendingRank
FROM customers c
JOIN invoices i ON c.CustomerId = i.CustomerId
WHERE c.Country IS NOT NULL
GROUP BY c.Country, c.CustomerId, c.FirstName, c.LastName
ORDER BY c.Country, SpendingRank;
