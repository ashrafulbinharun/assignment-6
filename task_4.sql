
-- task_4
SELECT
  c.`name` AS `customer_name`,
  SUM(o.`total_amount`) AS `total_purchase_amount`
FROM `Orders` o
LEFT JOIN `Customers` c ON o.`cust_id` = c.`customer_id`
GROUP BY c.`customer_id`
ORDER BY `total_purchase_amount` DESC
LIMIT 5;