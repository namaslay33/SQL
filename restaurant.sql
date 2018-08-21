

-- CREATE TABLE restaurant(
--     id SERIAL NOT NULL PRIMARY KEY,
--     name VARCHAR,
--     distance REAL,
--     stars INTEGER,
--     category VARCHAR,
--     favorite_dish VARCHAR,
--     does_takeout BOOLEAN,
--     last_time_you_ate_there DATE
-- )


-- INSERT INTO restaurant (id, name, distance, stars, category, favorite_dish, does_takeout, last_time_you_ate_there) VALUES 
--     (DEFAULT, 'Kulture', 1.7, 4, 'Southern', 'Shrimp & Grits', False, '2017-06-08'),
--     (DEFAULT, 'Rodeo Goat', 1.6, 5, 'Burgers', 'Royale with Cheese', True, '2018-08-10'),
--     (DEFAULT, 'Truck Yard-Houston', 1.6, 4, 'Food Stand', 'Truck Yard Philly Cheesesteak', True, '2018-01-14'),
--     (DEFAULT, 'Nara Express', 2.0, 3, 'Thai', 'Thai Fried Rice with Chicken', True, '2018-08-07'),
--     (DEFAULT, 'Nancys Hustle', 1.3, 5, 'American', 'Roasted Black Bass', False, Null),
--     (DEFAULT, 'Grotto Downtown', 1.7, 4, 'Italian', 'Pescatore', False, '2017-12-03'),
--     (DEFAULT, 'Dasman', 4.6, 4, 'Mediterranean', 'Chicken Shawarma', True, '2018-04-15'),
--     (DEFAULT, 'Jackson Street BBQ', 1.0, 4, 'BBQ', 'The Trinity', True, '2017-09-01')

-- ;

-- SELECT name FROM restaurant WHERE stars = 5;

-- SELECT name, favorite_dish FROM restaurant WHERE stars = 5;

-- INSERT INTO restaurant VALUES (
--     DEFAULT, 'Moon Tower', 0.2, 4, 'Hot Dogs', 'Duck Doggie', True, Null
-- );
-- SELECT id FROM restaurant WHERE name = 'Moon Tower';

-- SELECT name FROM restaurant WHERE category = 'BBQ';

-- SELECT name FROM restaurant WHERE does_takeout = TRUE;

-- INSERT INTO restaurant VALUES(
--     DEFAULT, 'Rays BBQ Shack', 5.2, 5, 'BBQ', 'Rib Plate', False, '2016-11-10'
-- );
-- SELECT name FROM restaurant WHERE category = 'BBQ' and does_takeout = TRUE;

-- SELECT name FROM restaurant WHERE distance < 2;

-- SELECT name FROM restaurant WHERE last_time_you_ate_there IS NULL;

-- SELECT name FROM restaurant WHERE last_time_you_ate_there IS NULL and stars = 5;


-- - - - - - - - - - - - - - - - - - - - - - - - - -  - - -
-- Aggregation and Sorting Queries
-- SELECT name, distance FROM restaurant ORDER BY distance;

-- SELECT name, distance FROM restaurant ORDER BY distance LIMIT 2;

-- SELECT name, stars FROM restaurant ORDER BY stars desc LIMIT 2;

-- SELECT name, stars, distance FROM restaurant WHERE distance < 2 ORDER BY stars desc LIMIT 2 ;

-- SELECT COUNT(*) FROM restaurant;

-- SELECT COUNT(*), category FROM restaurant GROUP BY category;

-- SELECT category, AVG(stars) FROM restaurant GROUP BY category;

-- SELECT category, MAX(stars) FROM restaurant GROUP BY category;
