-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2023-04-25 03:45:37.118

-- tables
-- Table: stg_coupon
CREATE TABLE stg_coupon (
    id integer  NOT NULL,
    order_id integer  NOT NULL,
    description nvarchar2(500)  NULL,
    code varchar2(50)  NOT NULL,
    bill_min_amount integer  NOT NULL,
    max_discount integer  NOT NULL,
    coupom_type nvarchar2(50)  NOT NULL,
    coupon_value number(12,1)  NOT NULL,
    CONSTRAINT stg_coupon_pk PRIMARY KEY (id)
);

-- Table: stg_customer
CREATE TABLE stg_customer (
    id integer  NOT NULL,
    fullname nvarchar2(500)  NOT NULL,
    email varchar2(50)  NOT NULL,
    phone nvarchar2(50)  NOT NULL,
    address nvarchar2(500)  NOT NULL,
    gender nvarchar2(50)  NOT NULL,
    dob date  NOT NULL,
    CONSTRAINT stg_customer_pk PRIMARY KEY (id)
);

-- Table: stg_delivery
CREATE TABLE stg_delivery (
    id integer  NOT NULL,
    order_id integer  NOT NULL,
    shipper_id integer  NOT NULL,
    address nvarchar2(500)  NOT NULL,
    phone nvarchar2(50)  NOT NULL,
    CONSTRAINT stg_delivery_pk PRIMARY KEY (id)
) ;

-- Table: stg_delivery_channel
CREATE TABLE stg_delivery_channel (
    id integer  NOT NULL,
    name nvarchar2(500)  NOT NULL,
    fee_value number(12,3)  NOT NULL,
    fee_unit varchar2(50)  NOT NULL,
    CONSTRAINT stg_delivery_channel_pk PRIMARY KEY (id)
) ;

-- Table: stg_order_line
CREATE TABLE stg_order_line (
    id integer  NOT NULL,
    product_id integer  NOT NULL,
    order_id integer  NOT NULL,
    qty integer  NOT NULL,
    price integer  NOT NULL,
    subtotal integer  NOT NULL,
    CONSTRAINT stg_order_line_pk PRIMARY KEY (id)
) ;

-- Table: stg_order_status
CREATE TABLE stg_order_status (
    id integer  NOT NULL,
    status_name nvarchar2(50)  NOT NULL,
    CONSTRAINT stg_order_status_pk PRIMARY KEY (id)
) ;

-- Table: stg_product
CREATE TABLE stg_product (
    id integer  NOT NULL,
    product_category integer  NOT NULL,
    name nvarchar2(500)  NOT NULL,
    model nvarchar2(500)  NOT NULL,
    processor nvarchar2(500)  NOT NULL,
    ram_hdd nvarchar2(500)  NOT NULL,
    vga nvarchar2(500)  NOT NULL,
    display nvarchar2(500)  NOT NULL,
    optical_drive nvarchar2(500)  NOT NULL,
    fax_nic_wl nvarchar2(500)  NOT NULL,
    weight_battery nvarchar2(500)  NOT NULL,
    CONSTRAINT stg_product_pk PRIMARY KEY (id)
) ;

-- Table: stg_product_category
CREATE TABLE stg_product_category (
    id integer  NOT NULL,
    name nvarchar2(500)  NOT NULL,
    description nvarchar2(500)  NULL,
    CONSTRAINT stg_product_category_pk PRIMARY KEY (id)
) ;

-- Table: stg_shipper
CREATE TABLE stg_shipper (
    id integer  NOT NULL,
    channel_id integer  NOT NULL,
    fullname nvarchar2(500)  NOT NULL,
    phone varchar2(50)  NOT NULL,
    CONSTRAINT stg_shipper_pk PRIMARY KEY (id)
) ;

-- Table: stg_shop_order
CREATE TABLE stg_shop_order (
    id integer  NOT NULL,
    customer_id integer  NOT NULL,
    store_id integer  NOT NULL,
    created_date timestamp  NOT NULL,
    order_channel_id integer  NOT NULL,
    order_status integer  NOT NULL,
    CONSTRAINT stg_shop_order_pk PRIMARY KEY (id)
) ;

-- Table: stg_store
CREATE TABLE stg_store (
    id integer  NOT NULL,
    name nvarchar2(500)  NOT NULL,
    address nvarchar2(500)  NOT NULL,
    opened_date timestamp  NULL,
    closed_date timestamp  NULL,
    status nvarchar2(50)  NOT NULL,
    CONSTRAINT stg_store_pk PRIMARY KEY (id)
) ;

-- foreign keys
-- Reference: coupon_shop_order (table: stg_coupon)
ALTER TABLE stg_coupon ADD CONSTRAINT coupon_shop_order
    FOREIGN KEY (order_id)
    REFERENCES stg_shop_order (id);

-- Reference: delivery_shipper (table: stg_delivery)
ALTER TABLE stg_delivery ADD CONSTRAINT delivery_shipper
    FOREIGN KEY (shipper_id)
    REFERENCES stg_shipper (id);

-- Reference: delivery_shop_order (table: stg_delivery)
ALTER TABLE stg_delivery ADD CONSTRAINT delivery_shop_order
    FOREIGN KEY (order_id)
    REFERENCES stg_shop_order (id);

-- Reference: order_line_product (table: stg_order_line)
ALTER TABLE stg_order_line ADD CONSTRAINT order_line_product
    FOREIGN KEY (product_id)
    REFERENCES stg_product (id);

-- Reference: order_line_shop_order (table: stg_order_line)
ALTER TABLE stg_order_line ADD CONSTRAINT order_line_shop_order
    FOREIGN KEY (order_id)
    REFERENCES stg_shop_order (id);

-- Reference: product_product_category (table: stg_product)
ALTER TABLE stg_product ADD CONSTRAINT product_product_category
    FOREIGN KEY (product_category)
    REFERENCES stg_product_category (id);

-- Reference: shipper_delivery_channel (table: stg_shipper)
ALTER TABLE stg_shipper ADD CONSTRAINT shipper_delivery_channel
    FOREIGN KEY (channel_id)
    REFERENCES stg_delivery_channel (id);

-- Reference: shop_order_customer (table: stg_shop_order)
ALTER TABLE stg_shop_order ADD CONSTRAINT shop_order_customer
    FOREIGN KEY (customer_id)
    REFERENCES stg_customer (id);

-- Reference: shop_order_order_status (table: stg_shop_order)
ALTER TABLE stg_shop_order ADD CONSTRAINT shop_order_order_status
    FOREIGN KEY (order_status)
    REFERENCES stg_order_status (id);

-- Reference: shop_order_store (table: stg_shop_order)
ALTER TABLE stg_shop_order ADD CONSTRAINT shop_order_store
    FOREIGN KEY (store_id)
    REFERENCES stg_store (id);

-- End of file.

