-- ============================================================
-- Supply Chain Performance Dashboard | SQL Analysis
-- Author  : Abhijeet S. Kapse | MBA - Hospital and Healthcare Management, IIM Bodh Gaya
-- Dataset : DataCo Supply Chain (9,999 orders)
-- Tool    : PostgreSQL (pgAdmin)
-- ============================================================


-- ============================================================
-- Q1. What is the total number of orders and how many were late?
-- ============================================================
-- Purpose: Get a high-level view of overall delivery performance

SELECT
    COUNT(order_id)                                          AS total_orders,
    SUM(late_delivery_risk)                                  AS late_orders,
    COUNT(order_id) - SUM(late_delivery_risk)                AS on_time_orders,
    ROUND(SUM(late_delivery_risk) * 100.0 / COUNT(order_id), 2) AS late_delivery_pct
FROM supply_chain;


-- ============================================================
-- Q2. Which market has the highest late delivery rate?
-- ============================================================
-- Purpose: Identify which region is causing the most delivery delays

SELECT
    market,
    COUNT(order_id)                                              AS total_orders,
    SUM(late_delivery_risk)                                      AS late_orders,
    ROUND(SUM(late_delivery_risk) * 100.0 / COUNT(order_id), 2) AS late_delivery_pct
FROM supply_chain
GROUP BY market
ORDER BY late_delivery_pct DESC;


-- ============================================================
-- Q3. How does each shipping mode perform on delivery time?
-- ============================================================
-- Purpose: Find which shipping mode is most reliable vs most delayed

SELECT
    shipping_mode,
    COUNT(order_id)                                              AS total_orders,
    ROUND(AVG(shipping_delay_days), 2)                           AS avg_delay_days,
    SUM(late_delivery_risk)                                      AS late_orders,
    ROUND(SUM(late_delivery_risk) * 100.0 / COUNT(order_id), 2) AS late_pct
FROM supply_chain
GROUP BY shipping_mode
ORDER BY avg_delay_days DESC;


-- ============================================================
-- Q4. What is the revenue and profit contribution by department?
-- ============================================================
-- Purpose: Understand which departments drive the most business value

SELECT
    department_name,
    COUNT(order_id)                        AS total_orders,
    ROUND(SUM(sales), 2)                   AS total_revenue,
    ROUND(SUM(order_profit_per_order), 2)  AS total_profit,
    ROUND(AVG(order_item_profit_ratio) * 100, 2) AS avg_profit_margin_pct
FROM supply_chain
GROUP BY department_name
ORDER BY total_revenue DESC;


-- ============================================================
-- Q5. How does discount rate affect profit ratio by customer segment?
-- ============================================================
-- Purpose: Check if higher discounts lead to lower profits (key business insight)

SELECT
    customer_segment,
    ROUND(AVG(order_item_discount_rate) * 100, 2) AS avg_discount_pct,
    ROUND(AVG(order_item_profit_ratio) * 100, 2)  AS avg_profit_margin_pct,
    COUNT(order_id)                                AS total_orders
FROM supply_chain
GROUP BY customer_segment
ORDER BY avg_discount_pct DESC;


-- ============================================================
-- Q6. Which order status has the most orders, and what is its revenue share?
-- ============================================================
-- Purpose: Understand order fulfillment health across status types

SELECT
    order_status,
    COUNT(order_id)                  AS total_orders,
    ROUND(SUM(sales), 2)             AS total_revenue,
    ROUND(COUNT(order_id) * 100.0 / (SELECT COUNT(*) FROM supply_chain), 2) AS order_share_pct
FROM supply_chain
GROUP BY order_status
ORDER BY total_orders DESC;


-- ============================================================
-- Q7. What is the monthly order volume and revenue trend?
-- ============================================================
-- Purpose: Identify seasonal peaks and dips in business activity

SELECT
    order_month,
    COUNT(order_id)         AS total_orders,
    ROUND(SUM(sales), 2)    AS total_revenue,
    SUM(late_delivery_risk) AS late_orders
FROM supply_chain
GROUP BY order_month
ORDER BY order_month;


-- ============================================================
-- Q8. Which shipping modes are used the most in each market?
-- ============================================================
-- Purpose: Understand shipping preferences across different regions
-- Uses JOIN to combine a subquery result with the main table

SELECT
    s.market,
    s.shipping_mode,
    COUNT(s.order_id) AS total_orders
FROM supply_chain s
JOIN (
    SELECT DISTINCT market
    FROM supply_chain
) m ON s.market = m.market
GROUP BY s.market, s.shipping_mode
ORDER BY s.market, total_orders DESC;


-- ============================================================
-- Q9. Which departments have an above-average late delivery rate?
-- ============================================================
-- Purpose: Find problem departments where delivery performance is worse than average
-- Uses HAVING to filter after aggregation

SELECT
    department_name,
    COUNT(order_id)                                              AS total_orders,
    SUM(late_delivery_risk)                                      AS late_orders,
    ROUND(SUM(late_delivery_risk) * 100.0 / COUNT(order_id), 2) AS late_delivery_pct
FROM supply_chain
GROUP BY department_name
HAVING ROUND(SUM(late_delivery_risk) * 100.0 / COUNT(order_id), 2)
       > (SELECT ROUND(SUM(late_delivery_risk) * 100.0 / COUNT(order_id), 2) FROM supply_chain)
ORDER BY late_delivery_pct DESC;


-- ============================================================
-- Q10. What are the top 10 countries by order volume and their avg shipping delay?
-- ============================================================
-- Purpose: Rank countries by business volume and flag high-delay locations

SELECT
    order_country,
    COUNT(order_id)                    AS total_orders,
    ROUND(AVG(shipping_delay_days), 2) AS avg_delay_days,
    SUM(late_delivery_risk)            AS late_orders
FROM supply_chain
GROUP BY order_country
ORDER BY total_orders DESC
LIMIT 10;
