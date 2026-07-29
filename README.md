# Bright_Coffe_Shop

## 📌 Overview

Bright Coffee Shop has appointed a new CEO focused on growing revenue and improving product performance. As a Junior Data Analyst, this project extracts actionable insights from historical transaction data and presents them to support the CEO's decision-making.

## 🎯 Objective

- Which products generate the most revenue?
- What time of day does the store perform best?
- What are the sales trends across products and time intervals?
- What recommendations can improve sales performance?

## 🗂️ Project Structure

```
├── 01-planning/
│   └── data-flow-architecture-diagram.miro   # Data flow & architecture plan
├── 02-data-processing/
│   ├── bright_coffee_shop_sales.csv           # Raw data (converted from Excel)
│   └── transformations.sql                    # SQL transformation scripts
├── 03-analysis/
│   └── bright_coffee_shop_analysis.xlsx       # Processed data, pivot tables & charts
├── 04-presentation/
│   ├── methodology.pptx / .docx               # Approach overview
│   └── presentation.pptx                      # Key insights & recommendations
└── README.md
```

## 🛠️ Tools Used

| Category | Tool(s) |
|---|---|
| Project Planning | Miro |
| Coding / Data Processing | Databricks, SQL |
| Data Visualization | Microsoft Excel |
| Presentation & Reporting | Microsoft PowerPoint |

## 🔄 Workflow

### 1. Planning & Architecture (Miro)
- Designed a data flow diagram covering: data source → ETL pipeline → storage (Databricks) → analysis & presentation.
- Defined key insights to deliver: sales by product category and time interval, high/low-performing products, total revenue.
- Outlined core calculations:
  - `Total Amount = unit_price * transaction_qty`
  - Grouping by 30-minute time intervals
  - Total units sold by product type/detail

### 2. Data Processing (Databricks)
- Converted the provided Excel dataset to CSV and loaded it into Databricks.
- Transformations performed:
  - Created a `transaction_time_bucket` column to group transactions into 30-minute intervals.
  - Cleaned and cast `unit_price` correctly (e.g., converting comma decimals like `'3,1'` → `3.1`).
  - Computed `total_amount = unit_price * transaction_qty`.
  - Used SQL to group and aggregate by product type and time bucket.

### 3. Data Analysis (Excel)
- Exported the processed table from Databricks into Excel.
- Built pivot tables and dashboards showing:
  - Total revenue per product type
  - Peak sales time intervals
  - Quantity sold by product category
  - Best-selling product types/details
- Added charts and graphs to visualize the story.

### 4. Presentation to the CEO
- **Methodology document:** overview of the analytical approach.
- **Presentation:** key insights backed by visuals, plus recommendations:
  - Run marketing campaigns during slow time slots
  - Stock more of the best-selling items
  - Promote underperforming products
- **Next steps:**
  - Automate daily sales reporting
  - Track performance across multiple locations
  - Implement loyalty programs based on peak customer time slots

## 📤 Submission Contents

- ✅ Miro Plan / Architecture Diagram
- ✅ Processed dataset (Excel/Google Sheets) with pivot tables & charts
- ✅ PowerPoint presentation
- ✅ SQL file with transformation & analysis code
