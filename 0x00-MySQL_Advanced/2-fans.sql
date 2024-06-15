-- Rank country origins of bands by the number of non-unique fans

-- STEPS:
-- Select the origin and the sum of fans, group by origin
-- Order by the sum of fans in descending order

SELECT origin, SUM(fans) AS nb_fans
FROM metal_bands
GROUP BY origin
ORDER BY nb_fans DESC;
