CREATE VIEW customer_rfm AS
SELECT
    customer_id,
    tenure_months,
    monthly_charges,
    contract,
    payment_method,
    internet_service,
    churned,

    CASE
        WHEN tenure_months <= 12 THEN 'Low'
        WHEN tenure_months <= 48 THEN 'Medium'
        ELSE 'High'
    END AS loyalty_tier,

    CASE
        WHEN (CASE WHEN online_security = 'Yes' THEN 1 ELSE 0 END +
              CASE WHEN online_backup = 'Yes' THEN 1 ELSE 0 END +
              CASE WHEN device_protection = 'Yes' THEN 1 ELSE 0 END +
              CASE WHEN tech_support = 'Yes' THEN 1 ELSE 0 END +
              CASE WHEN streaming_tv = 'Yes' THEN 1 ELSE 0 END +
              CASE WHEN streaming_movies = 'Yes' THEN 1 ELSE 0 END) <= 1 THEN 'Low'
        WHEN (CASE WHEN online_security = 'Yes' THEN 1 ELSE 0 END +
              CASE WHEN online_backup = 'Yes' THEN 1 ELSE 0 END +
              CASE WHEN device_protection = 'Yes' THEN 1 ELSE 0 END +
              CASE WHEN tech_support = 'Yes' THEN 1 ELSE 0 END +
              CASE WHEN streaming_tv = 'Yes' THEN 1 ELSE 0 END +
              CASE WHEN streaming_movies = 'Yes' THEN 1 ELSE 0 END) <= 3 THEN 'Medium'
        ELSE 'High'
    END AS engagement_tier,

    CASE
        WHEN monthly_charges <= 35 THEN 'Low'
        WHEN monthly_charges <= 75 THEN 'Medium'
        ELSE 'High'
    END AS monetary_tier

FROM customers;