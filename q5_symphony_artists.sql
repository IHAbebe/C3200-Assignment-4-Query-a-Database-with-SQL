-- Q5: Find artists who have at least one album with "symphony" in the title.
-- LOWER() converts the album title to lowercase before checking so the search is case-insensitive.
-- DISTINCT makes sure each artist only appears once even if they have multiple matching albums.
SELECT DISTINCT ar.Name
FROM artists ar
JOIN albums al ON ar.ArtistId = al.ArtistId
WHERE LOWER(al.Title) LIKE '%symphony%'
AND ar.Name IS NOT NULL;
