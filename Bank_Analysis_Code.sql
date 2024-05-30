/*1. Total Loan Amount*/
select 
year(issue_d) as year, 
sum(loan_amnt) as "Loan Amount"
from 
finance_1_cleaned
group by year
order by year;

/* Average Loan Amount*/
select 
year(issue_d) as year, 
round(avg(loan_amnt),2) as "Loan Amount"
from 
finance_1_cleaned
group by year
order by year;

/* Range of loan amounts*/
SELECT 
    YEAR(issue_d) AS year,
    MAX(loan_amnt) AS max_amount,
    MIN(loan_amnt) AS min_amount
FROM
    finance_1_cleaned
GROUP BY year
order by year;

/* purpose of loan*/
SELECT DISTINCT
    YEAR(issue_d) AS year,
    purpose,
    SUM(loan_amnt) AS loan_amount
FROM
    finance_1_cleaned
GROUP BY purpose , year
ORDER BY year;

/*2.Grade and sub grade wise revol_bal*/
SELECT 
    f1.grade, f1.sub_grade, sum(f2.revol_bal) as revol_bal
FROM
    finance_1_cleaned f1
        JOIN
    finance_2 f2 ON f1.id = f2.id
GROUP BY grade , sub_grade
order by grade;

/*3.Total Payment for Verified Status Vs Total Payment for Non Verified Status*/

SELECT 
    f1.verification_status, round(SUM(total_pymnt),2) AS Payment
FROM
    finance_1_cleaned f1
        JOIN
    finance_2 f2 ON f1.id = f2.id
WHERE
    f1.verification_status IN ('verified' , 'not verified')
GROUP BY verification_status;



/*4.State wise and month wise loan status*/

SELECT 
    addr_state, MONTHNAME(issue_d) AS Month, loan_status
FROM
    finance_1_cleaned
GROUP BY addr_state , month , loan_status
ORDER BY addr_state;

/*5. Home ownership Vs last payment date stats*/

SELECT 
    f1.home_ownership, f2.last_pymnt_d
FROM
    finance_1_cleaned f1
        JOIN
    finance_2 f2 ON f1.id = f2.id
    group by f2.last_pymnt_d,f1.home_ownership
ORDER BY f2.last_pymnt_d;


