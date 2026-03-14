# Supply Chain Performance Dashboard

**Tools:** Excel | Tableau Public | PostgreSQL (SQL) | PivotTables | COUNTIFS | Data Visualization  
**Author:** Abhijeet S. Kapse | MBA, IIM Bodh Gaya (2025)  
**Dataset:** DataCo Global Supply Chain — 9,999 orders · 46 columns

---

## Project Overview

End-to-end supply chain analytics project analyzing 9,999 global orders across 5 markets.  
Built to demonstrate proficiency in Excel dashboarding, Tableau visualization, and SQL querying — the core toolkit for Operations Analyst and Business Analyst roles.

**Business questions answered:**
- What is the overall late delivery rate and which market is worst?
- Which shipping mode causes the most delays?
- Does discounting hurt profitability? By how much?
- Which departments drive the most revenue and profit?
- How does order volume trend month by month?

---

## Key Findings

| Metric | Value |
|--------|-------|
| Total Orders | 9,999 |
| Total Revenue | $1,989,705 |
| Total Profit | $211,948 |
| **Late Delivery Rate** | **53.7%** |
| Avg Shipping Delay | 0.53 days |
| Avg Order Value | $198.99 |

- **Europe** had the highest late delivery rate at **60.1%** across all markets
- **First Class** shipping: **99.65% late** — worst of all modes despite being premium
- **Standard Class** most reliable at 37.47% late
- Higher discount rates consistently correlated with lower profit margins across all 3 customer segments

---

## Excel Dashboard

File: `Supply_Chain_Dashboard_AK.xlsx`

**Features:**
- 6 PivotCharts with dynamic slicers (Market, Shipping Mode, Customer Segment, Department)
- KPI summary cards: Total Orders, Revenue, Profit, Late Delivery Rate, Avg Delay
- On-time delivery analysis by market and shipping mode
- Discount vs profit correlation by customer segment
- Monthly order volume trend

![Dashboard Preview](https://raw.githubusercontent.com/AbhijitKapse369/Supply_Chain_Dashboard_AK/main/dashboard_preview.png)

---

## Tableau Public Dashboard

**Live Dashboard →** [View on Tableau Public](https://public.tableau.com/app/profile/abhijit.k1907/viz/Supply_Chain_Tableau_AK/SupplychainDashboard)

**8 visualizations:**
- Late delivery rate by market (bar chart)
- Avg shipping delay by mode (bar chart)
- Monthly order volume and revenue trend (line chart)
- Order status breakdown (pie chart)
- Revenue by customer segment (bar chart)
- Late delivery geographic map (world map)
- Revenue by department (treemap)
- Profit vs discount rate by segment (scatter with trend lines)

---

## SQL Analysis

Folder: [`/sql`](./sql)

10 analytical queries written in PostgreSQL covering OTD%, market performance, department profitability, discount-profit correlation, and shipping mode analysis.

**SQL concepts used:** GROUP BY, AVG, SUM, COUNT, ROUND, HAVING, subqueries, JOIN, LIMIT, ORDER BY

See [`/sql/README.md`](./sql/README.md) for full query list and findings.

---

## Repository Structure

```
Supply_Chain_Dashboard_AK/
├── sql/
│   ├── 01_create_table.sql       # Table schema — run this first
│   ├── 02_analysis_queries.sql   # 10 analytical queries
│   ├── schema_diagram.png        # Column grouping diagram
│   └── README.md                 # SQL documentation
├── Supply_Chain_Dashboard_AK.xlsx  # Excel dashboard
├── dashboard_preview.png           # Excel dashboard screenshot
└── README.md                       # This file
```

---

## Skills Demonstrated

`Excel` `PivotTables` `VLOOKUP` `COUNTIFS` `Data Validation` `Dynamic Slicers`  
`Tableau Public` `Geographic Maps` `Treemap` `Scatter Plot` `Trend Lines`  
`PostgreSQL` `SQL` `GROUP BY` `HAVING` `Subqueries` `Aggregations`  
`Supply Chain Analytics` `OTD Metrics` `KPI Reporting` `Data Visualization`

---

*Dataset source: DataCo Global Supply Chain Dataset (Kaggle)*
