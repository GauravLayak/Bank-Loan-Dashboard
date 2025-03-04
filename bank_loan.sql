-- CREATING TABLE --
DROP TABLE IF EXISTS bank_db;
CREATE TABLE bank_db (
id INT, 
address_state VARCHAR(20),
application_type VARCHAR(100),
emp_length TEXT,
emp_title VARCHAR(100),
grade VARCHAR(10),
home_ownership VARCHAR(100),
issue_date DATE,
last_credit_pull_date DATE,
last_payment_date DATE,
loan_status	VARCHAR(100),
next_payment_date DATE,
member_id INT,
purpose	VARCHAR(100),
sub_grade TEXT,
term TEXT,
verification_status	VARCHAR(100),
annual_income FLOAT,
dti	FLOAT,
installment	FLOAT,
int_rate FLOAT,
loan_amount	INT,
total_acc INT,
total_payment INT
);

SELECT COUNT(*) FROM bank_db;

--EXPLORATORY DATA ANALYSIS--

-- Find total loan application --
SELECT COUNT(id) AS total_loan_application
FROM bank_db;

-- find Month to Date Loan Applications --
SELECT COUNT(id) AS MTD_total_loan_application
FROM bank_db
WHERE EXTRACT(MONTH FROM issue_date) = 12
AND EXTRACT(YEAR FROM issue_date) = 2021;

-- Find Month on Month Loan Application --
SELECT COUNT(id) AS PMTD_total_loan_application
FROM bank_db
WHERE EXTRACT(MONTH FROM issue_date) = 11
AND EXTRACT(YEAR FROM issue_date) = 2021;

-- Find total funded Amount --
SELECT SUM(loan_amount) AS total_funded_amount
FROM bank_db;

-- Find total funded Amount of month to date
SELECT SUM(loan_amount) AS MTD_total_funded_amount FROM bank_db
WHERE EXTRACT(MONTH FROM issue_date) = 12
AND EXTRACT(YEAR FROM issue_date) = 2021;

-- find previous month total funded amount
SELECT SUM(loan_amount) AS PMTD_total_funded_amount FROM bank_db
WHERE EXTRACT(MONTH FROM issue_date) = 11
AND EXTRACT(YEAR FROM issue_date) = 2021;

-- find Total Amount Received --
SELECT SUM(total_payment) AS total_amount_received FROM bank_db;

-- find MTD total Amount received --
SELECT SUM(total_payment) AS MTD_total_amt_received FROM bank_db
WHERE EXTRACT(MONTH FROM issue_date) = 12
AND EXTRACT(YEAR FROM issue_date) = 2021;

-- find previous MTD total amount received --
SELECT SUM(total_payment) AS PMTD_total_amt_received FROM bank_db
WHERE EXTRACT(MONTH FROM issue_date) = 11
AND EXTRACT(YEAR FROM issue_date) = 2021;

-- find Average interest rate --
SELECT ROUND(AVG(int_rate)::numeric, 4) * 100 AS Avg_Int_rate FROM bank_db;

-- find current month avg interest rate 
SELECT ROUND(AVG(int_rate)::numeric, 4) * 100 AS MTD_Avg_Int_rate FROM bank_db
WHERE EXTRACT(MONTH FROM issue_date) = 12
AND EXTRACT(YEAR FROM issue_date) = 2021;

-- find previous month avg interest rate
SELECT ROUND(AVG(int_rate)::numeric, 4) * 100 AS PMTD_Avg_Int_rate FROM bank_db
WHERE EXTRACT(MONTH FROM issue_date) = 11
AND EXTRACT(YEAR FROM issue_date) = 2021;

-- Find Average Debt to Income Ratio
SELECT ROUND(AVG(dti)::NUMERIC, 4) * 100 AS Avg_DTI FROM bank_db;

-- find current Month avg DTI
SELECT ROUND(AVG(dti)::NUMERIC, 4) * 100 AS MTD_Avg_DTI FROM bank_db
WHERE EXTRACT(MONTH FROM issue_date) = 12
AND EXTRACT(YEAR FROM issue_date) = 2021;

-- find Previous month avg DTI
SELECT ROUND(AVG(dti)::NUMERIC, 4) * 100 AS PMTD_Avg_DTI FROM bank_db
WHERE EXTRACT(MONTH FROM issue_date) = 11
AND EXTRACT(YEAR FROM issue_date) = 2021;

-- find Good Loan Percentage
SELECT 
	(COUNT(CASE WHEN loan_status = 'Fully Paid' OR loan_status = 'Current' THEN id END) * 100)
	/
	COUNT(id) AS Good_Loan_percentage
FROM bank_db;

-- Find Good Loan Application
SELECT COUNT(*) AS Good_loan_Applications FROM bank_db
WHERE loan_status = 'Fully Paid' 
OR loan_status = 'Current';

-- Find Good Loan Funded Amount
SELECT SUM(loan_amount) AS Good_Loan_funded_Amt
FROM bank_db
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current';

-- Find Good Loan Total Received Amount
SELECT SUM(total_payment) AS Good_Loan_Total_Received_Amt
FROM bank_db
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current';

-- Find Total bad loan Percentage
SELECT 
	(COUNT(CASE WHEN loan_status = 'Charged Off' THEN id END) * 100.0)
	/
	COUNT(id) AS Bad_Loan_percentage
FROM bank_db;

-- Find Total Bad loan Applications
SELECT COUNT(id) AS Bad_Loan_Applications FROM bank_db
WHERE loan_status = 'Charged Off';

-- find Bad Loan Funded Amount
SELECT SUM(loan_amount) AS Bad_loan_funded_amt FROM bank_db
WHERE loan_status = 'Charged Off';

-- find bad loan Amount Received
SELECT SUM(Total_payment) AS bad_loan_amt_received FROM bank_db
WHERE loan_status = 'Charged Off';

-- Find loan status grid view
SELECT 
	loan_status,
	COUNT(id) AS total_applications,
	SUM(Total_payment) AS total_amt_received,
	SUM(loan_amount) AS total_funded_amt,
	AVG(int_rate * 100) AS interest_rate,
	AVG(dti * 100) AS DTI
FROM bank_db
GROUP BY loan_status;

-- find Month to date loan status grid view
SELECT 
	loan_status,
	SUM(total_payment) AS MTD_total_amt_received,
	SUM(loan_amount) AS MTD_total_funded_amt
FROM bank_db
WHERE EXTRACT(MONTH FROM issue_date) = 12
GROUP BY loan_status;

-- Find Month trends by Issue Date
SELECT 
	TO_CHAR(issue_date, 'Month') AS Month_name,
	COUNT(id) AS total_loan_applications,
	SUM(loan_amount) AS total_funded_amt,
	SUM(total_payment) AS total_received_amt
FROM bank_db
GROUP BY Month_name
ORDER BY MIN(issue_date);

-- Regional analysis by state
SELECT 
	address_state,
	COUNT(id) AS total_loan_applications,
	SUM(loan_amount) AS total_funded_amt,
	SUM(total_payment) AS total_received_amt
FROM bank_db
GROUP BY address_state
ORDER BY address_state;

-- Find Loan Terms Analysis
SELECT 
	term,
	COUNT(id) AS total_loan_applications,
	SUM(loan_amount) AS total_funded_amt,
	SUM(total_payment) AS total_received_amt
FROM bank_db
GROUP BY term
ORDER BY term DESC;

-- find Employee Length Analysis
SELECT 
	emp_length,
	COUNT(id) AS total_loan_applications,
	SUM(loan_amount) AS total_funded_amt,
	SUM(total_payment) AS total_received_amt
FROM bank_db
GROUP BY emp_length
ORDER BY emp_length DESC;

-- find purpose Analysis
SELECT 
	purpose,
	COUNT(id) AS total_loan_applications,
	SUM(loan_amount) AS total_funded_amt,
	SUM(total_payment) AS total_received_amt
FROM bank_db
GROUP BY purpose
ORDER BY total_loan_applications DESC;

-- find Home Ownerships Analysis
SELECT 
	home_ownership,
	COUNT(id) AS total_loan_applications,
	SUM(loan_amount) AS total_funded_amt,
	SUM(total_payment) AS total_received_amt
FROM bank_db
GROUP BY home_ownership
ORDER BY total_loan_applications DESC;































































	












































