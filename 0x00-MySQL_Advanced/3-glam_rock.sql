-- computing values in sql

SELECT band_name,
IFNULL(split - formed, 2022 - formed) AS lifespan
FROM metal_bands
WHERE style LIKE '%Glam rock%'
ORDER BY lifespan DESC;
