USE DATABASE REDBIRD;
USE SCHEMA DEV;

----- 1. GEOGRAPHY
-- Geospatial data types, primarily GEOGRAPHY and GEOMETRY. Let’s walk through a practical GEOGRAPHY example

CREATE OR REPLACE TABLE city_locations (
    id INT,
    name STRING,
    location GEOGRAPHY
);

--  Insert Geospatial Data
-- Insert using WKT (POINT)
INSERT INTO city_locations (id, name, location)
SELECT 1, 'New Delhi', TO_GEOGRAPHY('POINT(77.2090 28.6139)')
UNION ALL
SELECT 2, 'Mumbai', TO_GEOGRAPHY('POINT(72.8777 19.0760)')
UNION ALL
SELECT 3, 'Bengaluru', TO_GEOGRAPHY('POINT(77.5946 12.9716)');


-- Get coordinates back
SELECT name, ST_ASWKT(location) AS wkt_representation
FROM city_locations;

-- Calculate distance between two cities (in meters)
SELECT ST_DISTANCE(
    (SELECT location FROM city_locations WHERE name = 'New Delhi'),
    (SELECT location FROM city_locations WHERE name = 'Mumbai')
) AS distance_meters;


----- 2. Semi-Structured Data
--Creating a Table with datatype VARIANT for (Semi-structured data)
CREATE OR REPLACE TABLE customer_data (
    id INT,
    profile VARIANT
);

-- Insert Semi-Structured Data
INSERT INTO customer_data (id, profile)
VALUES
(1, PARSE_JSON('{"name": "Alice", "age": 30, "preferences": {"food": "Italian", "music": "Jazz"}}')),
(2, PARSE_JSON('{"name": "Bob", "age": 25, "preferences": {"food": "Mexican", "music": "Rock"}}'));

INSERT INTO customer_data (id, profile)
SELECT 1, PARSE_JSON('{"name": "Alice", "age": 30, "preferences": {"food": "Italian", "music": "Jazz"}}')
UNION ALL
SELECT 2, PARSE_JSON('{"name": "Bob", "age": 25, "preferences": {"food": "Mexican", "music": "Rock"}}');

-- Get all customer names
SELECT profile:name AS customer_name
FROM customer_data;

-- Filter by age
SELECT profile:name, profile:age
FROM customer_data
WHERE profile:age > 28;


