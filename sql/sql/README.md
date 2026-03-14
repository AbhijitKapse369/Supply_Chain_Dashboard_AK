# SQL Analysis — Supply Chain Performance Dashboard

**Tool:** PostgreSQL (pgAdmin 4)  
**Dataset:** DataCo Global Supply Chain — 9,999 orders · 46 columns  
**Author:** Abhijeet S. Kapse | MBA, IIM Bodh Gaya (2025)  
**GitHub:** [Supply_Chain_Dashboard_AK](https://github.com/AbhijitKapse369/Supply_Chain_Dashboard_AK)

---

## Schema Overview

Single denormalized flat table — no joins required across multiple tables.  
Columns are logically grouped into five domains used in the analysis below.

![Schema Diagram](https://raw.githubusercontent.com/AbhijitKapse369/Supply_Chain_Dashboard_AK/main/schema_diagram.png)

| Domain | Key Columns |
|--------|-------------|
| **Order** | order_id, order_date, order_month, order_status, order_country |
| **Customer** | customer_id, customer_segment, sales_per_customer |
| **Product / Dept** | product_card_id, product_name, department_name, order_item_quantity |
| **Shipping / Delivery** | shipping_mode, delivery_status, late_delivery_risk, days_shipping_real |
| **Financials** | sales, order_profit_per_order, order_item_discount_rate, order_item_profit_ratio |

---

## How to Run

1. Open **pgAdmin 4** and create a new database (e.g. `supply_chain_db`)
2. Run `01_create_table.sql` — creates the `supply_chain` table with all 46 columns
3. Import the CSV: right-click table → **Import/Export** → select CSV → enable Header row
4. Run `02_analysis_queries.sql` — execute each query block individually (F5 or Run button)

---

## Queries Covered

| # | Business Question | SQL Concepts |
|---|-------------------|--------------|
| Q1 | What is the overall late delivery rate? | COUNT, SUM, ROUND, calculated column |
| Q2 | Which market has the highest late delivery %? | GROUP BY, ORDER BY DESC |
| Q3 | Which shipping mode performs worst on delays? | AVG, GROUP BY, multiple metrics |
| Q4 | Which department generates the most revenue and profit? | SUM, AVG, GROUP BY |
| Q5 | Does higher discount correlate with lower profit? By segment | AVG, GROUP BY, comparison |
| Q6 | What % of revenue does each order status represent? | Subquery in SELECT, ROUND |
| Q7 | How do order volume and revenue trend month by month? | GROUP BY month, ORDER BY |
| Q8 | How is each shipping mode distributed across markets? | JOIN with subquery |
| Q9 | Which departments have above-average late delivery rates? | HAVING with subquery |
| Q10 | Which are the top 10 countries by order volume and avg delay? | ORDER BY, LIMIT |

---

## Key Findings

- **53.7% overall late delivery rate** — more than 1 in 2 orders was delayed
- **Europe** had the highest late delivery rate (60.1%) across all 5 markets
- **First Class** shipping had 99.65% late delivery — worst of all modes despite being premium
- **Standard Class** was the most reliable at 37.47% late
- **Higher discount rates** consistently correlated with lower profit margins across all 3 customer segments — confirmed via Q5
- **Apparel and Fishing** were the top departments by total revenue
- Q9 identified departments with statistically above-average late rates — actionable for process improvement targeting

---

## Files in this Folder

| File | Description |
|------|-------------|
| `01_create_table.sql` | PostgreSQL CREATE TABLE with all 46 columns and correct data types — run this first |
| `02_analysis_queries.sql` | 10 analytical queries with inline comments explaining logic and business context |
| `README.md` | This file |

---

## Related Project Files

| Asset | Link |
|-------|------|
| Excel Dashboard | [Supply_Chain_Dashboard_AK.xlsx](../Supply_Chain_Dashboard_AK.xlsx) |
| Tableau Public Dashboard | [View Live →](https://public.tableau.com/app/profile/abhijit.k1907/viz/Supply_Chain_Tableau_AK/SupplychainDashboard) |
| Dashboard Preview | [dashboard_preview.png](../dashboard_preview.png) |
| Schema Diagram | [schema_diagram.png](../schema_diagram.png) |

---

*Dataset source: DataCo Global Supply Chain Dataset (Kaggle)*
