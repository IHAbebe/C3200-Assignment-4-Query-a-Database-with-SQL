-- Q7: Count how many artists have 10 or more MPEG tracks across all their albums.
-- The inner query groups by artist and filters for those with at least 10 MPEG tracks.
-- The outer query then just counts how many artists passed that filter.
SELECT COUNT(*) AS ArtistCount
FROM (
    SELECT ar.ArtistId
    FROM artists ar
    JOIN albums al ON ar.ArtistId = al.ArtistId
    JOIN tracks t ON al.AlbumId = t.AlbumId
    JOIN media_types mt ON t.MediaTypeId = mt.MediaTypeId
    WHERE mt.Name LIKE '%MPEG%'
    GROUP BY ar.ArtistId
    HAVING COUNT(t.TrackId) >= 10
) sub;
