CREATE TABLE stg_category (
    cateid        NUMBER,
    catename        NVARCHAR2(50),
    "Description" NVARCHAR2(250)
);

ALTER TABLE stg_category ADD CONSTRAINT category_pk PRIMARY KEY ( cateid );

CREATE TABLE stg_channel (
    chanid   NUMBER,
    Channel  NVARCHAR2(50),
    feevalue NUMBER(12, 3),
    feeunit  NVARCHAR2(50)
);

ALTER TABLE stg_channel ADD CONSTRAINT channel_pk PRIMARY KEY ( chanid );

CREATE TABLE stg_order (
    tranid   NUMBER,
    item  NUMBER, 
    prodid   NUMBER,
    qty      INT,
    price    NUMBER,
    subtotal NUMBER
);

CREATE TABLE stg_coupon (
    tranid        NUMBER,
    couponid      NUMBER,
    description   NVARCHAR2(250),
    QRCode          VARCHAR(50),
    Bill_MinAmount NUMBER,
    MaxDiscount    NUMBER,
    CouponType     VARCHAR2(50),
    CouponValue    NUMBER(12, 1)
);

CREATE TABLE stg_customer ( 
    cuid     NUMBER,
    fullname NVARCHAR2(50),
    email    VARCHAR(50),   
    phone    VARCHAR(50),
    address  NVARCHAR2(250),
    gender   NVARCHAR2(50),
    dob      DATE, 
    createdDate DATE 
);
ALTER TABLE stg_customer ADD CONSTRAINT customer_pk PRIMARY KEY ( cuid );


CREATE TABLE stg_product (
    ProdID NUMBER,
    productname NVARCHAR2(200),
    productmodel NVARCHAR2(500),
    Processor NVARCHAR2(200),
    RAM_HDD NVARCHAR2(200),
    VGA NVARCHAR2(200),
    Display NVARCHAR2(200),
    Optical_Drive NVARCHAR2(200),
    Fax_Nic_WL NVARCHAR2(200),
    Weight_Battery NVARCHAR2(200),
    CateID  NUMBER
);

ALTER TABLE stg_product ADD CONSTRAINT  product_pk PRIMARY KEY ( ProdID );

CREATE TABLE stg_shipper (
    chanid    NUMBER,
    shipperid NUMBER,
    fullname  NVARCHAR2(50),
    phone     VARCHAR(20)
);

CREATE TABLE stg_store (
    storeid    NUMBER,
    address    NVARCHAR2(500),
    openeddate TIMESTAMP,
    closeddate TIMESTAMP,
    status     VARCHAR2(50)
);

CREATE TABLE stg_trans (
    tranid         NUMBER,
    cuid           NUMBER,
    storeid        NUMBER,
    createddate    TIMESTAMP,
    orderchannelid NUMBER,
    loadeddate     DATE
);

CREATE TABLE stg_delivery (
    tranid    NUMBER,
    shipperid NUMBER,
    address   NVARCHAR2(250),
    phone     VARCHAR(20)
);

CREATE TABLE fact_trans (
    tranid         NUMBER,
    cuid           NUMBER,
    storeid        NUMBER,
    orderchannelid INT,
    createddate    TIMESTAMP,
    loadeddate     DATE,
    qty            NUMBER,
    total          NUMBER, 
    shipperid       NUMBER, 
    deliveryfee     NUMBER, 
    couponid        NUMBER, 
    couponamount    NUMBER, 
    revenue         NUMBER
);  

CREATE TABLE fact_trans_1 (
    tranid         NUMBER,
    cuid           NUMBER,
    storeid        NUMBER,
    orderchannelid INT,
    salesdate    TIMESTAMP,
    loadeddate     DATE,
    qty            NUMBER,
    total          NUMBER, 
    shipperid       NUMBER, 
    Channel  NVARCHAR2(50),  
    deliveryfee     NUMBER, 
    couponamount    NUMBER, 
    couponid        NUMBER, 
    event     NVARCHAR2(250),      
    revenue         NUMBER
);  
    

------------------------------------

CREATE TABLE dim_date (
    "Date"    DATE,
    "Year"    INT,
    "Month"   INT,
    "Day"     INT,
    iso_year  INT,
    iso_month INT,
    quarter   INT
);


CREATE TABLE fact_test (
    tranid         NUMBER,
    cuid           NUMBER,
    storeid        NUMBER,
    orderchannelid INT,
    salesdate    TIMESTAMP,
    loadeddate     DATE,
    qty            NUMBER,
    total          NUMBER, 
    shipperid       NUMBER, 
    Channel  NVARCHAR2(50),  
    deliveryfee     NUMBER, 
    couponamount    NUMBER, 
    couponid        NUMBER, 
    event     NVARCHAR2(250),      
    revenue         NUMBER
); 



