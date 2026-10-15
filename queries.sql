#Top Customers by Total Spending (SUM, GROUP BY, ORDER BY)
SELECT 
    customer_name, 
    SUM(total_price) AS total_spent, 
    COUNT(order_id) AS total_orders
FROM sales
GROUP BY customer_name
ORDER BY total_spent DESC
LIMIT 5;


#Average Order Value & Key Metrics (AVG, SUM, COUNT)
SELECT 
    COUNT(order_id) AS total_orders,
    SUM(total_price) AS total_revenue,
    AVG(total_price) AS average_order_value
FROM sales;


#Sales Breakdown by Category & Region (GROUP BY)
SELECT 
    category, 
    region, 
    COUNT(order_id) AS total_orders, 
    SUM(total_price) AS total_sales, 
    AVG(total_price) AS avg_sales
FROM sales
GROUP BY category, region
ORDER BY total_sales DESC;

#Order Categorization Tier (CASE Statement)
SELECT 
    CASE 
        WHEN total_price >= 10000 THEN 'High Value Order'
        WHEN total_price >= 5000 THEN 'Medium Value Order'
        ELSE 'Low Value Order'
    END AS order_tier,
    COUNT(order_id) AS order_count,
    SUM(total_price) AS total_revenue
FROM sales
GROUP BY order_tier
ORDER BY total_revenue DESC;
