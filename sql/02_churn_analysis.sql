-- Churn rate by contract type
SELECT
    contract,
    COUNT(*) AS total_customers,
    SUM(churned) AS churned_customers,
    ROUND(AVG(churned) * 100, 1) AS churn_rate_pct
FROM customers
GROUP BY contract
ORDER BY churn_rate_pct DESC;

-- Churn rate by tenure bucket
SELECT
    CASE
        WHEN tenure_months <= 12 THEN '0-12 months'
        WHEN tenure_months <= 24 THEN '13-24 months'
        WHEN tenure_months <= 48 THEN '25-48 months'
        ELSE '49+ months'
    END AS tenure_bucket,
    COUNT(*) AS total_customers,
    SUM(churned) AS churned_customers,
    ROUND(AVG(churned) * 100, 1) AS churn_rate_pct
FROM customers
GROUP BY tenure_bucket
ORDER BY MIN(tenure_months);

-- Churn rate by payment method
SELECT
    payment_method,
    COUNT(*) AS total_customers,
    SUM(churned) AS churned_customers,
    ROUND(AVG(churned) * 100, 1) AS churn_rate_pct
FROM customers
GROUP BY payment_method
ORDER BY churn_rate_pct DESC;

-- Churn rate by internet service type
SELECT
    internet_service,
    COUNT(*) AS total_customers,
    SUM(churned) AS churned_customers,
    ROUND(AVG(churned) * 100, 1) AS churn_rate_pct
FROM customers
GROUP BY internet_service
ORDER BY churn_rate_pct DESC;