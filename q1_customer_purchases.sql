-- Q1: Get the last name and email of every customer who has at least one invoice.
-- Joining to invoices makes sure we only include customers who actually bought something.
-- DISTINCT removes duplicate rows in case a customer made multiple purchases.
SELECT DISTINCT c.LastName, c.Email
FROM customers c
JOIN invoices i ON c.CustomerId = i.CustomerId
WHERE c.LastName IS NOT NULL AND c.Email IS NOT NULL;
