create database if not exists bankdb;
use bankdb;

select * from transactions
limit 10;


-- 1) percentage of frauds
-- Ans - total transactions executed is 2,00,000 and 10,088 frauds occur so the total percentage of frauds is 5.04% 

select sum(is_fraud) as total_frauds,
count(*) as total_transactions,
round(sum(is_fraud) /count(*) * 100,2) as fraud_percentage
from transactions;


-- 2) Which state has recorded the highest number of fraudulent transactions?
-- Ans: Lakshadweep recorded the highest number of frauds (332 out of 5,954 transactions, 5.58%). Tamil Nadu has the highest fraud rate (5.62%). 
--      State fraud rates range between roughly 4.5% and 5.6%, around the overall 5.04%, so no state is significantly riskier than others.

select state, sum(is_fraud) as total_frauds,
count(*) as total_transactions,
round((sum(is_fraud)/count(*) * 100), 2) as fraud_percentage
from transactions
group by state
order by total_frauds desc;


-- 3) Which account type is most affected by fraud?
-- Ans : Business accounts are the most affected (3,436 frauds, 5.17%), followed by Savings (5.03%) and Checking (4.94%). 
--       Rates are close to the overall 5.04%, so account type is not a strong indicator of fraud.

select account_type, 
sum(is_fraud) as total_frauds, 
round(sum(is_fraud)/count(*) * 100, 2) as fraud_percentage
from transactions
group by account_type
order by sum(is_fraud) desc;

-- 4) Which device is most commonly used in fraudulent transactions?
-- Ans: Desktop is the most commonly used device in fraudulent transactions (2,544 frauds, 5.10%), followed by POS (2,533; 5.05%), ATM (2,518; 5.03%) and Mobile (2,493; 4.99%).
--      All devices have nearly equal transaction volumes and fraud rates close to the overall 5.04%, so device type is not a strong indicator of fraud.

select device_type,
    sum(is_fraud) as total_frauds,
    round(sum(is_fraud)/count(*) * 100, 2) as fraud_percentage,
    count(*) as total_transactions
from transactions
group by device_type
order by total_frauds desc;

-- 5) What is the total amount lost to fraudulent transactions?
-- Ans: The total amount lost to fraudulent transactions is Rs. 4,97,115,709.84 (Approx 50 crores) across 10,088 fraudulent transactions.

select round(sum(transaction_amount),2) as total_fraud_amount
from transactions
where is_fraud = 1;

-- 6) Which age group is most affected by fraud?
-- Ans: Adults have the highest number of frauds (5,710 out of 113,232 transactions), but this is because they make up the largest share of transactions. 
--      In terms of fraud rate, Youngsters are slightly higher (5.10%), followed by Adults (5.04%) and Senior citizens (4.98%). All rates are close to the overall 5.04%, 
--      so age is not a strong indicator of fraud.

with age_groups as ( select is_fraud, case
  when age > 60 then 'Senior citizens'
  when age > 30 then 'Adults'
  when age >= 18 then 'Youngsters'
  else 'Under 18'
  end as age_category
  from transactions)
  
select age_category,
count(*) AS total_transactions,
sum(is_fraud) AS total_frauds,
round(100.0 * sum(is_fraud) / count(*), 2) AS fraud_percentage
from age_groups
group by age_category
order by total_frauds desc;

-- CONCLUSION
-- 1. Out of 200,000 transactions, 10,088 (5.04%) are fraudulent, so the data is imbalanced.
-- 2. Fraud is spread evenly across states (4.5% to 5.6%); no state is significantly riskier.
-- 3. Business accounts (5.17%) and Desktop devices (5.10%) show slightly higher fraud rates, but the differences are too small to call them strong indicators.
-- 4. Age is not a strong factor; fraud rates are 4.98% to 5.10% across all age groups.
-- 5. Total fraud loss is about Rs. 49.7 crore, so even a 5% fraud rate has a large financial impact.
-- 6. No single segment stands out, which suggests the dataset is synthetic with uniformly distributed fraud.