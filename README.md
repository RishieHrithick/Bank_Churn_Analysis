# Customer Analytics & Churn Dashboard 🏦

**Overview:**
This project analyzes a 10,000-record dataset of bank customers to identify the primary drivers of customer churn. By moving beyond basic exploratory analysis to build predictive machine learning models and simulate A/B testing environments, this project provides statistically backed, actionable retention strategies to protect top-line revenue.

**Tech Stack:**
* **Database:** PostgreSQL (Supabase)
* **Data Analysis & ML:** Python, Pandas, Scikit-Learn, Statsmodels, SciPy
* **Visualization:** Matplotlib, Seaborn
* **Tools:** Git, VS Code, Jupyter Notebooks

---

## 📂 Project Structure
* `/sql` - Contains all SQL scripts used for data cleaning, aggregation, and feature extraction.
* `/notebooks` - Python EDA, machine learning models (Random Forest), and A/B test simulations.
* `/dashboard` - Visualizations and final Tableau dashboard link.

---

## Phase 1: Data Quality & Setup
Before analyzing the data, a rigorous data quality check was performed using PostgreSQL to ensure integrity.
* **Missing Values:** No null values were found in critical columns like `CreditScore` or `Age`.
* **Duplicates:** Checked against `CustomerId`; 0 duplicate records identified.
* **Sanity Checks:** Verified that numerical ranges (e.g., Age 18-92, Balance >= 0) were logical and valid for a banking context.

---

## Phase 2: Key SQL Insights
The initial exploratory analysis was conducted entirely in SQL, uncovering several immediate behavioral trends:
* **Baseline Churn:** The overall customer churn rate is **20.37%**.
* **Product Holding Risk:** There is a massive retention benefit in cross-selling. Customers with 1 product churn at 27.71%, but this drops to just 7.58% for 2-product holders. However, a critical anomaly exists: customers holding 3 or 4 products experience catastrophic churn (82% and 100% respectively), indicating a severe issue with upper-tier product offerings or customer experience.
* **Demographic Variance:** The churn rate fluctuates significantly by geography, with **Germany** showing the highest exit rate at **32.44%**.
* **High-Value Flight Risks:** Identified **2356** high-value customers (Balance > $100,000) who are inactive and have exited, representing **$312,265,430.72** in lost capital.

*(Detailed queries for these metrics can be found in the `/sql` directory).*

---

## Phase 3: Exploratory Data Analysis (Python)
Transitioning into Python, seaborn and matplotlib were utilized to visualize the distributions and correlations of the dataset, directly validating the SQL findings.
* **Correlation Heatmapping:** Confirmed that `Age` and `Balance` hold positive correlations with churn, while `IsActiveMember` serves as a protective factor.
* **Distribution Analysis:** Boxplots and histograms revealed that churn is heavily concentrated among customers aged 45-60 and those with significant bank balances, indicating the bank is losing its most profitable demographic.

---

## Phase 4: Predictive Modeling (Machine Learning)
To transition from descriptive to predictive analytics, classification models were built to identify customers at high risk of exiting.
* **Model Selection:** Trained both a baseline Logistic Regression and a Random Forest Classifier.
* **Handling Imbalance:** Because the dataset only contains 20% churned customers, accuracy is a misleading metric. The models were evaluated and optimized based on **Recall** and **ROC-AUC** to ensure high-risk customers were not missed.
* **Feature Importance:** Extracted the decision tree pathways from the Random Forest model, which mathematically proved that `Age` and `NumOfProducts` are the heaviest drivers of churn, perfectly aligning with the Phase 2 SQL analysis.

---

## Phase 5: A/B Test Simulation & Business Strategy
Predicting churn is only valuable if the business can prevent it. To test the viability of a retention campaign, a simulated A/B test was designed targeting the high-risk cohort identified by the Random Forest model.
* **The Simulation:** High-risk customers were randomly split 50/50 into a Control group and a Treatment group. The Treatment group was given a simulated "fee waiver" assumed to have a 25% retention effect.
* **Statistical Significance (Z-Test):** The resulting Two-Proportion Z-Test yielded a p-value of **0.0796**, meaning the drop in churn was **not statistically significant** at the standard 95% confidence level.
* **Confidence Interval:** The 95% CI for the effect size ranged from **[-1.18%, 22.23%]**. Because the interval crosses zero, the math dictates the campaign cannot be validated.
* **Power Analysis & MDE:** A power analysis revealed a Minimum Detectable Effect (Cohen's h) of **0.3617**.
* **Business Conclusion:** The simulation successfully prevented a costly **Type I Error**. By calculating the MDE, it was proven that the sample size of high-risk customers is too small to detect subtle campaign effects. The recommendation to the business is to hold off on launching expensive, minor retention offers and instead design highly aggressive campaigns capable of clearing the high statistical threshold required for validation.