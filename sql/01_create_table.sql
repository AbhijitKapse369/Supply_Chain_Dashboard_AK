-- ============================================================
-- Supply Chain Performance Dashboard | SQL Project
-- Author  : Abhijeet S. Kapse | MBA - Hospital and Healthcare Management, IIM Bodh Gaya
-- Dataset : DataCo Supply Chain (9,999 orders)
-- Tool    : PostgreSQL (pgAdmin)
-- Step 1  : Create table and load data
-- ============================================================

CREATE TABLE supply_chain (
    type                        VARCHAR(20),
    days_shipping_real          INT,
    days_shipment_scheduled     INT,
    shipping_delay_days         NUMERIC(6,2),
    benefit_per_order           NUMERIC(10,2),
    sales_per_customer          NUMERIC(10,2),
    delivery_status             VARCHAR(50),
    late_delivery_risk          INT,
    category_id                 INT,
    category_name               VARCHAR(100),
    customer_city               VARCHAR(100),
    customer_fname              VARCHAR(50),
    customer_id                 INT,
    customer_lname              VARCHAR(50),
    customer_segment            VARCHAR(50),
    customer_state              VARCHAR(50),
    department_id               INT,
    department_name             VARCHAR(100),
    latitude                    NUMERIC(10,6),
    longitude                   NUMERIC(10,6),
    market                      VARCHAR(50),
    order_city                  VARCHAR(100),
    order_country               VARCHAR(100),
    order_customer_id           INT,
    order_date                  DATE,
    order_month                 INT,
    order_id                    INT,
    order_item_cardprod_id      INT,
    order_item_discount         NUMERIC(10,2),
    order_item_discount_rate    NUMERIC(6,4),
    order_item_id               INT,
    order_item_product_price    NUMERIC(10,2),
    order_item_profit_ratio     NUMERIC(6,4),
    order_item_quantity         INT,
    sales                       NUMERIC(10,2),
    order_item_total            NUMERIC(10,2),
    order_profit_per_order      NUMERIC(10,2),
    order_region                VARCHAR(100),
    order_state                 VARCHAR(100),
    order_status                VARCHAR(50),
    product_card_id             INT,
    product_category_id         INT,
    product_name                VARCHAR(200),
    product_price               NUMERIC(10,2),
    shipping_date               DATE,
    shipping_mode               VARCHAR(50)
);

-- After creating the table, import the CSV using pgAdmin:
-- Right-click table → Import/Export → select the CSV file
-- Make sure to skip the header row
