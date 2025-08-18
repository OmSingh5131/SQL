
-- -------------------------------------------------------------- INSERT (CREATE) ---------------------------------------------------------

INSERT INTO campusx.users (user_id, name, email, password)
VALUES ( NULL, 'Om Singh', 'om@gmail.com',1234);

INSERT INTO campusx.users
VALUES (NULL, 'Harry Potter', 'harry@hogwarts.com',1245);

INSERT INTO campusx.users (password , name, email)
VALUES ( 'its not leviosa, its leviosaah ', 'Hermoine Granger', 'hermoine@muggle.com');

INSERT INTO campusx.users VALUES
(NULL, 'Ron Weasley', 'ron@ginge.com', 456),
(NULL,'Draco Malfoy', 'pottuh@gmail.com', 657);

-- -------------------------------------------------------------- RETRIEVE ------------------------------------------------

 
SELECT * FROM campusx.smartphones;
SELECT * FROM campusx.smartphones WHERE 1; -- This means that we have applied no condition.


-- Filtering the columns
SELECT os, model, battery_capacity FROM campusx.smartphones;

-- Alias : renaming the columns
SELECT os as 'Operating System', model, battery_capacity as 'mAh'FROM campusx.smartphones;

-- Create mathematical operations using columns
SELECT model,resolution_width,resolution_height,screen_size FROM campusx.smartphones;

SELECT model, (SQRT(resolution_width*resolution_width + resolution_height*resolution_height))/screen_size AS ppi FROM campusx.smartphones;

-- Constants 
SELECT model, 'smartphones' as 'Types' FROM campusx.smartphones;

-- Distinct(unique) values from a column ( Tells the number of Distinct elements in a particular column )
SELECT DISTINCT(brand_name) AS 'Brands' FROM campusx.smartphones;
SELECT DISTINCT(processor_brand) AS 'Processor brands' FROM campusx.smartphones;
SELECT DISTINCT(os) AS 'Processor brands' FROM campusx.smartphones;
SELECT DISTINCT brand_name, os FROM campusx.smartphones;


-- Filtering the rows based on WHERE clause ( We have filtered the columns but we use this to filter the rows )


SELECT * FROM campusx.smartphones WHERE brand_name = 'apple'; -- Select all the phones with brand name as Samsung
SELECT * FROM campusx.smartphones WHERE price > 50000; -- Select all the phones with price more than 50 thousand Rupees
-- Select all the smartphones with Price range in 10000 and 20000
SELECT * FROM campusx.smartphones WHERE price > 10000 AND price < 20000;
SELECT * FROM campusx.smartphones WHERE price BETWEEN 10000 AND 20000;
-- Find smartphones with rating > 80 and smartphones < 15000 and processor brand as snapdragon
SELECT * FROM campusx.smartphones WHERE price < 15000 AND rating > 80 AND processor_bran;
-- Find all samsung phones with RAM capacity greater than 8GB;
SELECT * FROM campusx.smartphones WHERE brand_name = 'samsung' AND ram_capacity > 8;
-- Find all samsung phones with snapdragon processor
SELECT * FROM campusx.smartphones WHERE brand_name = 'samsung' AND processor_brand = 'snapdragon';



-- ORDER OF QUERY EXECUTION
-- SELECT statement has many clauses and there is a sequence of execution of that F J W G H S D O  ( From Join Where Group BY Having Select Distinct Order By )
-- Find the brands who sell phones with price > 50000

SELECT DISTINCT brand_name FROM campusx.smartphones WHERE price > 50000;
-- 1.From is executed first, it takes all the data from table smartphones
-- 2.Where is executed now which filters all the rows and we are left with rows having price > 50000
-- 3.Select is now executed and all the brand_names are now returned
-- 4.Distinct is now executed and we now have the list of brands having the smartphones of price greater than 50,000


-- IN AND NOT IN 

-- Write a query in whcih the brand of processor is snapdragon, exynos or bionic
SELECT * FROM campusx.smartphones WHERE processor_brand = 'snapdragon' OR processor_brand = 'exynos' OR prcessor_brand = 'bionic';
SELECT * FROM campusx.smartphones WHERE processor_brand IN ('snapdragon','exynos','bionic');
-- getting all the phones which are not in these processor brnads
SELECT* FROM campusx.smartphones WHERE processor_brand NOT IN ('snapdragon','exynos','bionic');


-- -------------------------------------------------------------- UPDATE ------------------------------------------------

UPDATE campusx.smartphones SET processor_brand = 'dimensia' WHERE processor_brand = 'mediatek'; 
UPDATE campusx.users SET email = 'om@yahoo.com', password = 'oyeom' WHERE name = 'Om';


-- -------------------------------------------------------------- DELETE ------------------------------------------------

SELECT * FROM campusx.smartphones WHERE price > 200000; -- Delete these smartphones information from the table
DELETE FROM campusx.smartphones WHERE price > 200000;

-- ------------------------------------------------------TYPES OF FUNCTIONS in MYSQL ------------------------------------------------

-- -----------------------AGGREGATE FUNCTIONS ( They are kind of a summary )
-- find the minimum and maximum price
SELECT MAX(price) FROM campusx.smartphones;
SELECT MIN(price) FROM campusx.smartphones;
-- find the price of costliest Samsung phone
SELECT MAX(price) FROM campusx.smartphones WHERE brand_name = 'samsung';
SELECT * FROM campusx.smartphones WHERE brand_name = 'samsung' AND price = 110999;
-- find the average rating of apple phones
SELECT AVG(rating) FROM campusx.smartphones WHERE brand_name = 'apple';
-- find the average price with which the samsung phones come in the market
SELECT AVG(price) FROM campusx.smartphones WHERE brand_name = 'apple';
-- find the money to buy all of the phones of apple
SELECT SUM(price) FROM campusx.smartphones WHERE brand_name = 'apple' ; 
-- find the number of one plus phones
SELECT COUNT(*) FROM campusx.smartphones WHERE brand_name = 'oneplus';
-- find the total number of different brands of smartphones we have
SELECT COUNT(DISTINCT(brand_name)) FROM campusx.smartphones;


--  ------------------------------ SCALAR Functions ( These are the functions applied on single values )

-- Select the absolute value of price by subtracting it from 1 lakh
-- ABS -> ABSOLUTE
SELECT ABS(100000 - price) as 'temp' FROM campusx.smartphones;
-- ROUND -> getting the round off value of each entry to the two decimal places
SELECT ROUND((100000 - price)/17,2) as 'temp' FROM campusx.smartphones;

-- CEIL => 6.5 -> 7 and FLOOR => 6.5 -> 6






