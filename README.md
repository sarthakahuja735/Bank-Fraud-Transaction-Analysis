**Bank Fraud Transactions Analysis**

A data analytics project where I analyzed bank transaction data to understand where, when, and how fraud happens, and built an interactive Power BI dashboard to present the findings.


**About the Project**

Banks process thousands of transactions every day, and a small share of them are fraudulent. The challenge is that fraud is hidden inside a huge amount of normal data, so it is hard to see which devices, locations, categories, or time periods are the riskiest.
In this project I took a dataset of 200K customers and analyzed it using SQL, Python, and Power BI to find clear fraud patterns that a fraud or risk team could act on.

**Questions this project answers:**

1) What is the overall fraud rate, and how many customers were affected?
2) Which devices (ATM, card, kiosk, etc.) see the most fraud?
3) Which transaction types and merchant categories are most affected?
4) Which locations report the most fraud?
5) What does a typical victim look like (age)?
6) How does fraud change day by day over the month?
   
**Results**

Total Customers	200K
Victim Customers	10.09K
Fraud Rate	5.04%
Total Fraud Amount	497.12M
Top Fraud Location	Lakshadweep
Peak Fraud Hour	11:55 AM
Average Victim Age	44

**Key findings**

Self-service devices have the most fraud. ATM Booth Kiosk (1,082), Self-service Banking Machine (1,057), and ATM (1,033) are far ahead of Debit/Credit Card (455) and Smart Card (411).
Fraud is spread almost equally across transaction types (each around 19.5% to 20.5%): Transfer, Credit, Debit, Bill Payment, and Withdrawal.
Merchant categories are close to each other. 
Clothing (1,734) and Groceries (1,722) are highest, Entertainment (1,612) is lowest.
Fraud peaks around late morning (11:55 AM), so monitoring can be stronger during that window.
Victims are mostly middle-aged (average 44), but all adult age groups are affected.
Daily fraud stays between roughly 290 and 380 cases in January 2025 with no single extreme spike.

**Recommendations**

1) Add stronger verification (PIN + OTP, transaction limits) on ATM kiosks and self-service machines.
2) Increase real-time monitoring during peak fraud hours.
3) Run awareness campaigns for all age groups instead of targeting a single group.

**Tools Used**
SQL: Business queries
Python (pandas, matplotlib): Data Cleaning, exploratory data analysis
Power BI: dashboard, DAX measures, and filters

Dashboard

<img width="1146" height="638" alt="Dashboard 1" src="https://github.com/user-attachments/assets/a37a66c0-961a-4d51-b5aa-7e7075643d92" />

The dashboard includes a fraud trend line, top 5 devices, transaction type split, victim age, category-wise fraud, KPI cards, and a location filter to drill down by state.


**Limitations**
1) The data is synthetic, so patterns like "Lakshadweep as the top location" or almost equal splits across categories may come from random data generation and not from real behavior.
2) The analysis covers only one month (January 2025), so seasonality can't be studied.

Source: Kaggle

**Author**
Sarthak Ahuja | linkdin - www.linkedin.com/in/sarthakahuja735 
