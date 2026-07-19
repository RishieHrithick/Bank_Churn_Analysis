SELECT
  ROUND(100.0 * SUM(CASE WHEN "Exited"=1 THEN 1 ELSE 0 END) / COUNT(*), 2) AS churn_rate_pct
FROM customers;
--overall churn rate : 20.37