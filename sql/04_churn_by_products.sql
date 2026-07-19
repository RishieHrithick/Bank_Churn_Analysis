SELECT "NumOfProducts",
       COUNT(*) AS total, 
       SUM("Exited") AS churned,
       ROUND(100.0*SUM("Exited")/COUNT(*),2) AS churn_rate_pct
FROM customers
GROUP BY "NumOfProducts"
ORDER BY "NumOfProducts";