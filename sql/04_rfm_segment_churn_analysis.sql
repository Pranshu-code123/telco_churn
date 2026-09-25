SELECT
    loyalty_tier,
    engagement_tier,
    monetary_tier,
    COUNT(*) AS total_customers,
    SUM(churned) AS churned_customers,
    ROUND(AVG(churned) * 100, 1) AS churn_rate_pct
FROM customer_rfm
GROUP BY loyalty_tier, engagement_tier, monetary_tier
ORDER BY churn_rate_pct DESC;