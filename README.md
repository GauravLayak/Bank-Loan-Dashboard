# Loan Dashboard: SQL + Power BI

## 📌 Project Overview
This project provides an in-depth analysis of **bank loan applications** using **SQL** for data processing and **Power BI** for visualization. The goal is to track key loan performance metrics, detect trends, and provide actionable insights for better decision-making in the lending sector.

## 🏆 Key Features
- **Interactive Power BI Dashboard** with multiple KPI visualizations.
- **SQL-based data processing** to extract, clean, and analyze loan data.
- **Business-focused insights** for risk assessment, loan performance, and customer segmentation.

---

## 📊 Dashboard Components
### **1️⃣ Summary Dashboard**
**Key Performance Indicators (KPIs):**
- **Total Loan Applications**: Tracks the number of loans received (MTD & MoM trends).
- **Total Funded Amount**: Monitors disbursed loans and MoM variations.
- **Average Interest Rate**: Assesses lending portfolio costs.
- **Average Debt-to-Income (DTI) Ratio**: Evaluates borrower financial health.

#### **Good vs. Bad Loan Analysis**
- **Good Loan Metrics**: Percentage, Applications, Funded Amount, and Received Amount.
- **Bad Loan Metrics**: Percentage, Applications, Funded Amount, and Received Amount.

### **2️⃣ Overview Dashboard**
**Visualizations for Data Exploration:**
- **Monthly Trends (Line Chart)** – Identifies seasonal lending patterns.
- **Regional Lending Analysis (Filled Map)** – Compares loan activities across states.
- **Loan Term Distribution (Donut Chart)** – Shows loan tenure preferences.
- **Employment Length (Bar Chart)** – Analyzes borrower job history impact.
- **Loan Purpose Breakdown (Bar Chart)** – Categorizes loan reasons.
- **Home Ownership (Tree Map)** – Examines loan distribution based on home ownership.

### **3️⃣ Detailed Dashboard**
**Grid View Metrics:**
- **Total Loan Applications**
- **Total Funded Amount**
- **Average Interest Rate & DTI Ratio**
- **Loan Status Breakdown**

![image alt](https://github.com/GauravLayak/Bank-Loan-Dashboard/blob/b910fd5c52b27e4a5300b45b5b0c31e2c53fb93b/Dashboard%20Overview.png)

---

## 🛠 Tech Stack
- **SQL**: Data extraction, cleaning, and transformation.
- **Power BI**: Data visualization and interactive dashboard creation.

## 🔥 Business Insights
1. **Interest Rate Trends** – High-interest loans correlate with high default rates.
2. **Regional Loan Performance** – Some states show higher borrowing behavior.
3. **Customer Segmentation** – Borrowers with longer employment history have lower risk.
4. **Loan Purpose Analysis** – Business loans have the highest repayment rates.

---

## 🚀 How to Run This Project
### **Step 1: Set Up the Database**
- Import `bank_loan.sql` into **PostgreSQL** or any preferred SQL environment.

### **Step 2: Run SQL Queries**
- Execute queries for data preprocessing and analysis.

### **Step 3: Load Data into Power BI**
- Connect Power BI to the processed dataset.
- Import relevant tables and create relationships.

### **Step 4: Build & Customize Visuals**
- Use the provided **DAX calculations** for KPIs.
- Customize filters and slicers to enhance interactivity.

---

## 📌 Repository Structure
```
📂 Loan_Dashboard_Project
│-- 📂 SQL_Queries      # SQL scripts for data extraction & transformation
│-- 📂 PowerBI_Report   # Power BI .pbix dashboard file
│-- 📂 Data             # financial_loan dataset (CSV format)
│-- README.md          # Project documentation
```

---

If you find this project useful, feel free to ⭐ the repo and contribute! 🚀

