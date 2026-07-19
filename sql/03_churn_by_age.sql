SELECT
  CASE
    WHEN "Age" < 30 THEN '<30'
    WHEN "Age" BETWEEN 30 AND 40 THEN '30-40'
    WHEN "Age" BETWEEN 41 AND 50 THEN '41-50'
    ELSE '50+'
  END AS age_bucket,
  COUNT(*) AS total, 
  SUM("Exited") AS churned,
  ROUND(100.0 * SUM("Exited")/COUNT(*), 2) AS churn_rate_pct
FROM customers
GROUP BY age_bucket
ORDER BY age_bucket;