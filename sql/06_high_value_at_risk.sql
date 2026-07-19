WITH risk_flagged AS (
  SELECT *,
    CASE WHEN "IsActiveMember" = 0 AND "Balance" > 100000 THEN 1 ELSE 0 END AS high_value_at_risk
  FROM customers
)
SELECT COUNT(*) AS at_risk_customers, 
       SUM("Balance") AS total_balance_at_risk
FROM risk_flagged
WHERE high_value_at_risk = 1;