-- PLEASE READ THIS BEFORE RUNNING THE EXERCISE

-- ⚠️ IMPORTANT: This SQL file may crash due to two common issues: comments and missing semicolons.

-- ✅ Suggestions:
-- 1) Always end each SQL query with a semicolon `;`
-- 2) Ensure comments are well-formed:
--    - Use `--` for single-line comments only
--    - Avoid inline comments after queries
--    - Do not use `/* */` multi-line comments, as they may break execution

-- -----------------------------------------------
-- queries.sql
-- Complete each mission by writing your SQL query
-- directly below the corresponding instruction
-- -----------------------------------------------

SELECT * FROM regions;
SELECT * FROM species;
SELECT * FROM climate;
SELECT * FROM observations;


-- MISSION 1 What are the first 10 recorded observations?;

SELECT * 
FROM observations
LIMIT 10;

-- LEVEL 1
-- MISSION 2. Which region identifiers (region_id) appear in the data?;

SELECT DISTINCT region_id
FROM observations;

-- MISSION 3. How many distinct species (species_id) have been observed?;

SELECT COUNT(DISTINCT species_id) AS total_species
FROM observations;


-- MISSION 4. How many observations are there for the region with region_id = 2?;

SELECT COUNT(region_id) AS total_region_2
FROM observations
WHERE region_id = 2;

-- MISSION 5. How many observations were recorded on 1998-08-08?;

SELECT COUNT(observation_date) AS observations_by_specific_day
FROM observations
WHERE observation_date = '1998-08-08';


-- LEVEL 2.
-- MISSION 6. Which region_id has the most observations?;

SELECT region_id, COUNT(region_id) AS observation_by_region
FROM observations
GROUP BY region_id
ORDER BY observation_by_region DESC;

-- MISSION 7. What are the 5 most frequent species_id?;

SELECT species_id, COUNT(species_id) AS frecuency_species
FROM observations
GROUP BY species_id
ORDER BY frecuency_species DESC
LIMIT 5;

-- MISSION 8. Which species (species_id) have fewer than 5 records?;

SELECT species_id, COUNT(species_id) AS frecuency_species
FROM observations
GROUP BY species_id
HAVING frecuency_species < 5
ORDER BY frecuency_species DESC;

-- MISSION 9. Which observers (observer) recorded the most observations?;

SELECT observer, COUNT(observer) AS count_observations
FROM observations
GROUP BY observer
ORDER BY count_observations DESC;

-- LEVEL 3.
-- MISSION 10. Show the region name (regions.name) for each observation.;

SELECT observations.id AS observation_id, regions.name AS region_name
FROM observations
    JOIN regions
    ON observations.region_id = regions.id;

-- MISSION 11. Show the scientific name of each recorded species (species.scientific_name).;

SELECT observations.id AS observation_id, species.scientific_name 
FROM observations
    JOIN species
    ON observations.species_id = species.id;

-- MISSION 12. Which is the most observed species in each region?;

SELECT regions.name AS region_name , species.scientific_name, COUNT(*) AS total
FROM observations
    JOIN regions ON observations.region_id = regions.id
    JOIN species ON observations.species_id = species.id
    GROUP BY region_name, species.scientific_name
    ORDER BY total DESC;

-- LEVEL 4
-- MISSION 13. Insert a new fictitious observation into the observations table.;

INSERT INTO observations (
    species_id, region_id, observer, observation_date, latitude, longitude, count)
VALUES (
    15, 8, 'obsr_test', '1995-06-16', -15.157692, 95.576485, -3);

-- MISSION 14. Correct the scientific name of a species with a typo.

UPDATE species
SET scientific_name = 'Corvus coronoides'  
WHERE scientific_name = 'Corvis coronoides';

-- MISSION 15. Delete a test observation (use its id).

DELETE FROM observations
WHERE id = 35;