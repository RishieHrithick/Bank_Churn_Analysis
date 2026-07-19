SELECT "Geography", "Gender",
       COUNT(*) AS total_customers,
       SUM("Exited") AS churned,
       ROUND(100.0 * SUM("Exited") / COUNT(*), 2) AS churn_rate_pct
FROM customers
GROUP BY "Geography", "Gender"
ORDER BY churn_rate_pct DESC;