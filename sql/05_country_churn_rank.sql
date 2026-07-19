SELECT "Geography", churn_rate_pct,
       RANK() OVER (ORDER BY churn_rate_pct DESC) AS churn_rank
FROM (
  SELECT "Geography", ROUND(100.0*SUM("Exited")/COUNT(*),2) AS churn_rate_pct
  FROM customers 
  GROUP BY "Geography"
) 