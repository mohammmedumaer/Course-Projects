-- 1.Create new schema as ecommerce.
create database ecommerce;
use ecommerce;

-- 2.Import .csv file users_data into MySQL
-- (right click on ecommerce schema -> Table Data import Wizard -> Give path of the file -> Next -> choose options : Create a new table , select delete if exist -> next -> next)
use ecommerce;
SELECT 
    COUNT(*)
FROM
    users_data;

-- 3.Run SQL command to see the structure of table
desc users_data;


-- 4.Run SQL command to select first 100 rows of the database.
SELECT 
    *
FROM
    users_data
LIMIT 100;

-- 5.How many distinct values exist in table for field country and language.
SELECT 
    COUNT(DISTINCT country) country,
    COUNT(DISTINCT language) language
FROM
    users_data;

-- 6.Check whether male users are having maximum followers or female users.
SELECT 
    gender, SUM(socialNBFollowers)
FROM
    users_data
GROUP BY gender;
 
-- 7.Calculate the total users those:
-- a.Uses Profile Picture in their Profile
SELECT 
    COUNT(hasProfilePicture) Users_with_ProfilePicture
FROM
    users_data
WHERE
    hasProfilePicture = 'True';
-- b.Uses Application for Ecommerce platform
SELECT 
    COUNT(hasAnyApp) Users_with_Anyapp
FROM
    users_data
WHERE
    hasAnyApp = 'True';
-- c.Uses Android app
SELECT 
    COUNT(hasAndroidApp) Users_with_Androidapp
FROM
    users_data
WHERE
    hasAndroidApp = 'True';
-- d.Uses ios app
SELECT 
    COUNT(hasIosApp) Users_with_Iosdapp
FROM
    users_data
WHERE
    hasIosApp = 'True';

-- 8.Calculate the total number of buyers for each country and sort the result in descending order of total number of buyers. (Hint: consider only those users having at least 1 product bought.)
SELECT 
    country, COUNT(productsBought) Buyers
FROM
    users_data
GROUP BY country
ORDER BY Buyers DESC;

-- 9.Calculate the total number of sellers for each country and sort the result in ascending order of total number of sellers. (Hint: consider only those users having at least 1 product sold.)
SELECT 
    country, COUNT(productsSold) Sellers
FROM
    users_data
GROUP BY country
ORDER BY Sellers ASC;


-- 10.Display name of top 10 countries having maximum products pass rate.
SELECT 
    country
FROM
    users_data
GROUP BY country
HAVING MAX(productsPassRate)
LIMIT 10;

-- 11.Calculate the number of users on an ecommerce platform for different language choices
SELECT 
    language, COUNT(language)
FROM
    users_data
GROUP BY language;


-- 12.Check the choice of female users about putting the product in a wishlist or to like socially on an ecommerce platform. (Hint: use UNION to answer this question.)
SELECT 
    SUM(productsWished), SUM(socialProductsLiked)
FROM
    users_data
WHERE
    gender = 'F';
-- choice of each female users about putting the product in a wishlist or to like socially om an ecommerce platform is same. 


-- 13.Check the choice of male users about being seller or buyer. (Hint: use UNION to solve this question.)
SELECT 
    COUNT(productsSold), COUNT(productsBought)
FROM
    users_data
WHERE
    gender = 'M';
-- choicr of male users about being seller or buyer is same.

-- 14.Which country is having maximum number of buyers?
SELECT 
    country, MAX(productsBought) Max_no_of_buyers
FROM
    users_data
GROUP BY country
ORDER BY MAX(productsBought) DESC
LIMIT 1;
-- Belfique country is having maximum number of buyers.

-- 15.List the name of 10 countries having zero number of sellers.
SELECT 
    country, productsSold
FROM
    users_data
WHERE
    productsSold = 0
LIMIT 10;


-- 16.Display record of top 110 users who have used ecommerce platform recently.
SELECT 
    *
FROM
    users_data
GROUP BY daysSinceLastLogin
HAVING MIN(daysSinceLastLogin)
ORDER BY daysSinceLastLogin ASC
LIMIT 110;


-- 17.Calculate the number of female users those who have not logged in since last 100 days.
SELECT 
    COUNT(type)
FROM
    users_data
WHERE
    gender = 'F'
        AND daysSinceLastLogin >= 100;

-- 18.Display the number of female users of each country at ecommerce platform.
SELECT 
    country, COUNT(gender) Female_users
FROM
    users_data
WHERE
    gender = 'F'
GROUP BY country;

-- 19.Display the number of male users of each country at ecommerce platform.
SELECT 
    country, COUNT(gender) Male_users
FROM
    users_data
WHERE
    gender = 'M'
GROUP BY country;

-- 20.Calculate the average number of products sold and bought on ecommerce platform by male users for each country.
SELECT 
    country,
    AVG(productsSold) Products_sold,
    AVG(productsBought) Products_bought
FROM
    users_data
WHERE
    gender = 'M'
GROUP BY country;
