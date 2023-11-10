
-- task_3
SELECT
  c.`name` AS `category_name`,
  SUM(oi.`unit_price` * oi.`quantity`) AS `total_revenue`
FROM `Order_Items` oi
LEFT JOIN `Products` p ON oi.`package_id` = p.`product_id`
LEFT JOIN `Categories` c ON p.`cat_id` = c.`category_id`
GROUP BY c.`category_id`
ORDER BY `total_revenue` DESC;
