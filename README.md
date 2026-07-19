# Customer Analytics & Churn Dashboard 🏦

**Overview:** 
This project analyzes a 10,000-record dataset of bank customers to identify the primary drivers of customer churn. By simulating an A/B testing environment, the project moves beyond basic exploratory analysis to provide statistically backed, actionable retention strategies.

**Current Status:** Phase 1 & 2 Completed (Data Quality & SQL Exploratory Analysis)

**Tech Stack:**
* **Database:** PostgreSQL (Supabase)
* **Data Analysis:** SQL
* **Tools:** Git, VS Code

---

## 📂 Project Structure

* `/sql` - Contains all SQL scripts used for data cleaning, aggregation, and feature extraction.
* *(Upcoming)* `/notebooks` - Python EDA, statistical testing, and predictive modeling.
* *(Upcoming)* `/dashboard` - Visualizations and final Tableau dashboard link.

---

## Phase 1: Data Quality & Setup
Before analyzing the data, a rigorous data quality check was performed using PostgreSQL to ensure integrity.
* **Missing Values:** No null values were found in critical columns like `CreditScore` or `Age`.
* **Duplicates:** Checked against `CustomerId`; 0 duplicate records identified.
* **Sanity Checks:** Verified that numerical ranges (e.g., Age 18-92, Balance >= 0) were logical and valid for a banking context.

---

## Phase 2: Key SQL Insights
The initial exploratory analysis was conducted entirely in SQL, uncovering several immediate behavioral trends:

* **Baseline Churn:** The overall customer churn rate is **[XX.X%]**.
* **Product Holding Risk:** Customers with only 1 product churn at a rate of **[XX.X%]**, showing a significant flight risk compared to multi-product holders.
* **Demographic Variance:** The churn rate fluctuates significantly by geography, with **[Country]** showing the highest exit rate at **[XX.X%]**.
* **High-Value Flight Risks:** Identified **[X]** high-value customers (Balance > $100,000) who are inactive and have exited, representing **$[X,XXX,XXX]** in lost capital. 

*(Detailed queries for these metrics can be found in the `/sql` directory).*