-- Q6: Find all artists who have an MPEG track (audio or video) in the "Brazilian Music" or "Grunge" playlist.
-- This requires joining 6 tables to trace the path from artist all the way to playlist.
-- LIKE '%MPEG%' catches both "MPEG audio file" and "Protected MPEG-4 video file" media types.
SELECT DISTINCT ar.Name
FROM artists ar
JOIN albums al ON ar.ArtistId = al.ArtistId
JOIN tracks t ON al.AlbumId = t.AlbumId
JOIN media_types mt ON t.MediaTypeId = mt.MediaTypeId
JOIN playlist_track pt ON t.TrackId = pt.TrackId
JOIN playlists p ON pt.PlaylistId = p.PlaylistId
WHERE mt.Name LIKE '%MPEG%'
AND p.Name IN ('Brazilian Music', 'Grunge')
AND ar.Name IS NOT NULL;
