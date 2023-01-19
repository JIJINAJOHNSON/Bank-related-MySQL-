create database bank;
use bank;



CREATE TABLE bank_details
(
product CHAR(10),
quantity INT,
price REAL,
purchase_cost Decimal(6,2),
estimated_sale_price float
);

describe bank_details;

INSERT INTO bank_details VALUES('paycard',3,330,8008,9009);
INSERT INTO bank_details VALUES('paypoints',4,440,9009,9009);
INSERT INTO bank_details VALUES('paypoints',3,330,8008,9009);
INSERT INTO bank_details VALUES('paycard',4,440,9008,9009);

show tables;

SELECT * FROM bank_details;

/* add a column Geo_location*/

ALTER TABLE bank_details add column Geo_location VARCHAR(20);

SELECT * FROM bank_details;

/* value of Geo-location */

SELECT Geo_location from bank_details WHERE product='paycard';

/* length of paycard*/

SELECT char_length(product) FROM bank_details WHERE product='paycard';

/* 8. Alter the product field from CHAR to VARCHAR in bank_details*/
ALTER TABLE bank_details modify product VARCHAR(10);
select * FROM bank_details;
describe bank_details;

/* 9. Reduce the size of the product field from 10 to 6 and check it is possible */
ALTER TABLE bank_details modify product VARCHAR(6);
describe bank_details;

/* 10. Create a table named as bank_holidays with below fields
a) Holiday field which display only date
b) start_time field which displays hours and minutes
c) end_time field which displays hours,minutes and timezone*/
CREATE TABLE Bank_Holidays
(
Holiday DATE,
start_time datetime,
end_time timestamp
);

show tables;
describe Bank_HOLIDAYS;

/* 11. step1-> Insert todays date details in all fields of Bank_Holidays.
step2 -> Postpone Holiday to next day by updating the Holiday field */
INSERT INTO Bank_Holidays values(curdate(),curdate(),current_date());
describe Bank_Holidays;

/* 12.Update*/
UPDATE Bank_Holidays SET Holiday= date_add(Holiday,INTERVAL 1 DAY) WHERE Holiday='curdate';
SELECT * FROM Bank_Holidays;
 /* 13. european*/
 UPDATE Bank_Holidays  SET end_time=utc_timestamp() where end_time='curdate';
 
 /* 14. Display output of product field as NEW_PRODUCT in Bank_Details table */
 SELECT PRODUCT AS NEW_PRODUCT FROM Bank_Details;
 
 /* 15.Display only one record from bank-details*/
 SELECT * FROM Bank_Details limit 1;
 
 /*16. Display the first value five characters of the Geo_location field of bank_details*/
 SELECT substr(Geo_location,1,5) FROM bank_details;