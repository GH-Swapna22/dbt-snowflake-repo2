drop view AIRBNB.DEV.SRC_HOSTS;
drop view AIRBNB.DEV.SRC_LISTINGS;
drop view AIRBNB.DEV.SRC_REVIEWS;


----------------------------------
use role accountadmin;
use database airbnb;
use schema integrations;

create stage mystage
url = 's3://az-pub-bkt/tavant-snowflake/';

list @mystage;

CREATE TABLE airbnb.dev.raw_customer (
  Customer_ID number,
  Customer_Name string ,
  Customer_Email string ,
  Customer_City string ,
  Customer_State string ,
  Customer_DOB DATE
  );

  copy into airbnb.dev.raw_customer
  from @mystage/generated_customer_data.csv
  file_format = (type=csv field_delimiter = '|' skip_header = 1);

  select * from AIRBNB.DEV.RAW_CUSTOMER;

  select * from   airbnb.dev.scd_raw_customer;

    select * from AIRBNB.DEV.RAW_CUSTOMER  where customer_name='Lana Golden';
    select * from   airbnb.dev.scd_raw_customer  where customer_name='Lana Golden';

  update AIRBNB.DEV.RAW_CUSTOMER set customer_state='New Delhi' where customer_name='Lana Golden';



  select * from AIRBNB.DEV.RAW_CUSTOMER  where customer_name='Nell Stone';
    select * from   airbnb.dev.scd_raw_customer  where customer_name='Nell Stone';

    delete from AIRBNB.DEV.RAW_CUSTOMER where customer_name='Nell Stone';


    drop table AIRBNB.DEV.CUST_ACTIVE;
drop table AIRBNB.DEV.SCD_RAW_CUSTOMER;
drop table AIRBNB.DEV.RAW_CUSTOMER;
