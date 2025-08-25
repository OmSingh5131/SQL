--   ----------------------------------------------------------------- SORTING DATA---------------------------------------------------------------------


-- Find top 5 smartphones with biggest Screen Size 
SELECT model,screen_size FROM campusx.smartphones WHERE brand_name = 'samsung'ORDER BY screen_size DESC LIMIT 5;--
-- Limit keyword gives the information of how much rows do I need to project 

-- Sort all the phones in the descending order of number of total cameras.
SELECT model, (num_rear_cameras + num_front_cameras) AS 'total_Cameras' FROM campusx.smartphones ORDER BY total_Cameras DESC;

-- Sort the data on the basis of ppi in decreasing order.

SELECT model, ROUND( ( SQRT(resolution_width*resolution_width + resolution_height*resolution_height) )/ screen_size , 2 ) AS 'PPI' FROM campusx.smartphones ORDER BY PPI DESC;

-- Find the phone with second largest battery
SELECT model, battery_capacity from campusx.smartphones ORDER BY battery_capacity DESC LIMIT 1,1 ;

-- Use of Limit : Indexing of rows start from 0, LIMIT 5, 2 means start from index 5, remove 0 to 4, Start from index 5 and 3 rows will be printed from, so print row index 5,6
-- LIMIT( 1,1) means start at index 1 which is the second position row and print one row, which is 1st index row or second row only.

-- Find the phone with second smallest battery
SELECT model,battery_capacity from campusx.smartphones ORDER BY battery_capacity ASC LIMIT 1,1;


-- Find the name and rating of worst apple phone
SELECT model, rating FROM campusx.smartphones ORDER BY rating ASC LIMIT 1;


-- Sorting is also possible on multiple columns, for ex sort the smart phones based on brand and the price,
-- we sorted brand by name and price by descending, now we will get the result as Apple having the highest price etc etc.

SELECT * FROM campusx.smartphones ORDER BY brand_name ASC, price DESC;

-- From the Priority List, you know that ORDER by gets executed in the last 

--   ----------------------------------------------------------------- Grouping DATA---------------------------------------------------------------------


-- Group by, what it does, it actually divides the whole of the dataset based on the groups and then we implement the aggregate functions on those groups
-- all those groups have the same columns but the rows are just divided based on the parameter passed.

-- Group the smartphones by brand and get the count, average price, max rating, avg screen size, avg battery capacity

SELECT brand_name, COUNT(*) AS 'number_of_phones', ROUND(AVG(price)) AS 'avg_price', MAX(rating) as 'rating', ROUND(AVG(screen_size), 3) AS 'avg_screen_size' FROM campusx.smartphones GROUP BY brand_name ORDER BY number_of_phones DESC;

-- Group smartphones by whether they have NFC and get the avg price and rating

SELECT has_nfc, AVG(price) as 'avg_price', AVG(rating) as 'avg_rating' FROM campusx.smartphones GROUP BY has_nfc;

-- Group the smartphones by brand and processor brand and get the count of models and the average primary camera resolution(rear)
-- We can also groupp by on the basis of two columns, it will be a kind of cartesian product, each brand_name will get mapped to a processor brand.

-- Suppose has_5G has 5 categories and has_nfc has 4 categories , then total number of groups that can be formed are 5x4 = 20 groups and info from that 20 groups is retrieved

SELECT has_5G, has_nfc, COUNT(*) as 'Count' FROM campusx.smartphones GROUP BY has_5G, has_nfc;

SELECT brand_name,processor_brand, COUNT(*) AS 'num phones', ROUND(AVG(primary_camera_rear)) AS 'avg camera resolution' FROM campusx.smartphones GROUP BY brand_name, processor_brand;

-- Find top 5 most costly phone brands which have the phone of the maximum price

SELECT brand_name, ROUND(AVG(price),2) as 'avg_price' FROM campusx.smartphones GROUP BY brand_name ORDER BY avg_price DESC LIMIT 5;

-- Which brand makes smallest screen smartphones
SELECT brand_name,  ROUND(AVG(screen_size)) as 'size' FROM campusx.smartphones GROUP BY brand_name ORDER BY size ASC LIMIT 1;

-- Avg Price of 5G phones vs avg price of Non 5g phones 
SELECT has_5G, ROUND(AVG(price), 2) as 'price' FROM campusx.smartphones GROUP BY has_5g;

-- Group the smartphones by brand and find the brand with highest number of models that have both NFC and an IR blaster.

SELECT brand_name , COUNT(*) as 'count' FROM campusx.smartphones WHERE has_nfc = 'True' AND has_ir_blaster = 'True' GROUP BY brand_name ORDER BY count DESC;

-- Find all the Samsung 5G enabled smartphones and find out the avg price for NFC and non NFC phones

SELECT has_nfc, AVG(price) FROM campusx.smartphones WHERE brand_name = 'samsung' AND has_5g = 'True' GROUP BY has_nfc ;


-- -----------------------------------------------------------------HAVING CLAUSE-------------------------------------------------------------

-- Filtering on the basis of some aggreate function comes under having 
-- The work WHERE does for SELECT, HAVING does it for GROUP BY

-- Find the average price of those phones which have at least 20 number of phones in the data

SELECT brand_name, AVG(price) as 'avg_price' FROM campusx.smartphones GROUP BY brand_name HAVING COUNT(*) > 20;

-- Find the top 3 brands with the highest average RAM that have a refresh rate of atleast 90 Hz and fast charging available and dont consider brands which have less than 10 phones

SELECT brand_name, AVG(ram_capacity) as 'avg_RAM' FROM campusx.smartphones WHERE fast_charging_available = '1' AND refresh_rate >'90' GROUP BY brand_name HAVING COUNT(*) > 10 ORDER BY avg_RAM limit 3;

-- Find the average price of all the phone brands with average rating > 70 and num_phones more than 10 among all the 5g enabled phones

SELECT brand_name, AVG(price) FROM campusx.smartphones WHERE has_5g = 'True' GROUP BY brand_name HAVING COUNT(*) > 10 AND AVG(rating) > 70;







