-- Check for missing values (Nulls)
-- Result: 0 nulls found in CreditScore and Age
SELECT 
    COUNT(*) FILTER (WHERE "CreditScore" IS NULL) AS null_credit_score,       
    COUNT(*) FILTER (WHERE "Age" IS NULL) AS null_age
FROM customers;

-- Check for duplicate customers
-- Result: 0 duplicates found
SELECT "CustomerId", COUNT(*) 
FROM customers 
GROUP BY "CustomerId" 
HAVING COUNT(*) > 1;

-- Sanity check data ranges
-- Result: Age range 18-92, Balance range 0-250k. Data is logically sound.
SELECT 
    MIN("Age") AS min_age, 
    MAX("Age") AS max_age, 
    MIN("Balance") AS min_balance, 
    MAX("Balance") AS max_balance 
FROM customers;