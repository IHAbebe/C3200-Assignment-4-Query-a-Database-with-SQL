-- Q2: List every album along with the name of the artist who made it.
-- albums and artists are linked by ArtistId, so we join on that field.
-- NULL values are filtered out so only complete records show up.
SELECT al.Title AS AlbumName, ar.Name AS ArtistName
FROM albums al
JOIN artists ar ON al.ArtistId = ar.ArtistId
WHERE al.Title IS NOT NULL AND ar.Name IS NOT NULL;
