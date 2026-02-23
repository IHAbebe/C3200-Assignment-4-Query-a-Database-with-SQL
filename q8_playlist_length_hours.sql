-- Q8: Calculate the total runtime of each playlist and show only the ones over 2 hours long.
-- Track length is stored in milliseconds, so we divide by 3,600,000 to convert to hours.
-- ROUND(..., 2) trims the result to two decimal places.
SELECT p.PlaylistId,
       p.Name,
       ROUND(SUM(t.Milliseconds) / 3600000.0, 2) AS LengthHours
FROM playlists p
JOIN playlist_track pt ON p.PlaylistId = pt.PlaylistId
JOIN tracks t ON pt.TrackId = t.TrackId
WHERE p.Name IS NOT NULL
GROUP BY p.PlaylistId, p.Name
HAVING SUM(t.Milliseconds) / 3600000.0 > 2
ORDER BY LengthHours DESC;
