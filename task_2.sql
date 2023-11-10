
-- task_2
SELECT
  p.`name` AS `product_name`,
  oi.`quantity`,
  oi.`unit_price` * oi.`quantity` AS `total_amount`
FROM `Order_Items` oi
LEFT JOIN `Products` p ON oi.`package_id` = p.`product_id`
ORDER BY oi.`ord_id` ASC;
