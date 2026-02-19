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

-- Get nested field (food preference)
SELECT profile:preferences.food AS food_pref
FROM customer_data;

-- Filter by age
SELECT profile:name, profile:age
FROM customer_data
WHERE profile:age > 28;
