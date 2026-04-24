CREATE DATABASE bank_marketing;
USE bank_marketing;
USE bank_marketing;

CREATE TABLE bank_customers (
    age INT,
    job VARCHAR(20),
    marital VARCHAR(10),
    education VARCHAR(25),
    `default` VARCHAR(10),
    housing VARCHAR(10),
    loan VARCHAR(10),
    contact VARCHAR(10),
    month VARCHAR(5),
    day_of_week VARCHAR(5),
    duration INT,
    campaign INT,
    pdays INT,
    previous INT,
    poutcome VARCHAR(15),
    emp_var_rate FLOAT,
    cons_price_idx FLOAT,
    cons_conf_idx FLOAT,
    euribor3m FLOAT,
    nr_employed FLOAT,
    y VARCHAR(5)
);

USE bank_marketing;
SELECT COUNT(*) FROM bank_customers;

SELECT * FROM bank_customers LIMIT 5;

SELECT 
    SUM(CASE WHEN age IS NULL THEN 1 ELSE 0 END) AS null_age,
    SUM(CASE WHEN job IS NULL THEN 1 ELSE 0 END) AS null_job,
    SUM(CASE WHEN y IS NULL THEN 1 ELSE 0 END) AS null_y,
    SUM(CASE WHEN contact IS NULL THEN 1 ELSE 0 END) AS null_contact,
    SUM(CASE WHEN month IS NULL THEN 1 ELSE 0 END) AS null_month
FROM bank_customers;

SELECT job, COUNT(*) 
FROM bank_customers 
WHERE job = 'unknown'
GROUP BY job;bank_customersbank_customersbank_customers

SELECT y, COUNT(*) 
FROM bank_customers 
GROUP BY y;

SELECT y, COUNT(*) AS total
FROM bank_customers
GROUP BY y;

SELECT 
    COUNT(*) AS total_contacts,

    SUM(CASE 
        WHEN y = 'yes' THEN 1 
        ELSE 0 
    END) AS converted_customers,

    SUM(CASE 
        WHEN y = 'no' THEN 1 
        ELSE 0 
    END) AS non_converted_customers,

    ROUND(
        SUM(CASE WHEN y = 'yes' THEN 1 ELSE 0 END) 
        / COUNT(*) * 100, 2
    ) AS conversion_rate,

    ROUND(
        100 - (
            SUM(CASE WHEN y = 'yes' THEN 1 ELSE 0 END) 
            / COUNT(*) * 100
        ), 2
    ) AS drop_off_rate

FROM bank_customers;

SELECT 
    contact,

    COUNT(*) AS total_customers,

    SUM(CASE 
        WHEN y = 'yes' THEN 1 
        ELSE 0 
    END) AS converted_customers,

    ROUND(
        SUM(CASE WHEN y = 'yes' THEN 1 ELSE 0 END) 
        / COUNT(*) * 100, 2
    ) AS conversion_rate

FROM bank_customers

GROUP BY contact

ORDER BY conversion_rate DESC;

SELECT 
    month,

    COUNT(*) AS total_customers,

    SUM(CASE 
        WHEN y = 'yes' THEN 1 
        ELSE 0 
    END) AS converted_customers,

    ROUND(
        SUM(CASE WHEN y = 'yes' THEN 1 ELSE 0 END) 
        / COUNT(*) * 100, 2
    ) AS conversion_rate

FROM bank_customers

GROUP BY month

ORDER BY conversion_rate DESC;

SELECT 
    job,

    COUNT(*) AS total_customers,

    SUM(CASE 
        WHEN y = 'yes' THEN 1 
        ELSE 0 
    END) AS converted_customers,

    ROUND(
        SUM(CASE WHEN y = 'yes' THEN 1 ELSE 0 END) 
        / COUNT(*) * 100, 2
    ) AS conversion_rate

FROM bank_customers

GROUP BY job

ORDER BY conversion_rate DESC;

SELECT 
    campaign,

    COUNT(*) AS total_customers,

    SUM(CASE 
        WHEN y = 'yes' THEN 1 
        ELSE 0 
    END) AS converted_customers,

    ROUND(
        SUM(CASE WHEN y = 'yes' THEN 1 ELSE 0 END) 
        / COUNT(*) * 100, 2
    ) AS conversion_rate

FROM bank_customers

GROUP BY campaign

ORDER BY campaign ASC

LIMIT 10;