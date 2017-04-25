    --Creating Table
    CREATE TABLE IF NOT EXISTS real_estate(street string,city string,zip bigint,state string,beds int,baths int, sq_ft int,type string,sale_date string,price bigint,latitude float,longitude float)                         
    ROW FORMAT DELIMITED
    FIELDS TERMINATED BY ','
    STORED AS TEXTFILE;


 --Loading Data into table
LOAD DATA LOCAL INPATH '/home/acadgild/Downloads/real_estate.csv' OVERWRITE INTO TABLE real_estate;


--City wise list all the Condos which is not less than ten thousand

SELECT city,COUNT(type) FROM real_estate WHERE type=="Condo" AND price>=10000  GROUP BY city;

-Cheapest Condo in CA. name the city,street and price for the Condo.

SELECT street,city,price FROM real_estate WHERE state=="CA" AND type=="Condo" ORDER BY price LIMIT 1;

--List top 5 residency details which lie in the budget of 60000-120000, an area more than 1450, sold after 17th may, min bedroom 3 and, min bathroom 2.

SELECT * FROM real_estate WHERE price>=60000 AND price<=120000 AND sq_ft>1450 AND beds>=3 AND baths>=2 AND  LIMIT 5; 

--Query to separate list of residential apartments with more than 2 beds. Also include columns in following order City,Baths,Sq_feet,Price,flat_type,Beds respectively

SELECT city,baths,sq_ft,price,type,beds FROM real_estate WHERE beds>2 AND type="Residential";
