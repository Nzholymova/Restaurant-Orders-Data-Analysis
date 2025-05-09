-- 1. Сколько заказов всего было сделано?
SELECT COUNT(DISTINCT order_id)
FROM [comprehensive-restaurant-orders-popular-items-high-value-transactions-patterns];

-- 2. Сколько блюд было заказано всего (включая повторы)?
SELECT COUNT(*) 
FROM [comprehensive-restaurant-orders-popular-items-high-value-transactions-patterns];

-- 3. Какой общий доход ресторана?
SELECT SUM(CAST(price as decimal)) AS total
FROM [comprehensive-restaurant-orders-popular-items-high-value-transactions-patterns];

-- 4. Какой средний чек за заказ?
SELECT order_id, ROUND(SUM(CAST(price AS decimal)), 2) AS total_price
FROM [comprehensive-restaurant-orders-popular-items-high-value-transactions-patterns]
GROUP BY order_id;

-- 5. Сколько разных блюд заказано?
SELECT COUNT(DISTINCT item_id) AS unique_dishes_ordered
FROM [comprehensive-restaurant-orders-popular-items-high-value-transactions-patterns];

-- 6. Какие 5 блюд заказывали чаще всего?
SELECT TOP 5 item_name, COUNT(*) AS numbers
FROM [comprehensive-restaurant-orders-popular-items-high-value-transactions-patterns]
GROUP BY item_name
ORDER BY numbers DESC;

-- 7. Какие блюда приносят больше всего выручки?
SELECT TOP 15 item_name, SUM(CAST(price as decimal)) AS total_revenue
FROM [comprehensive-restaurant-orders-popular-items-high-value-transactions-patterns]
GROUP BY item_name
ORDER BY total_revenue DESC;

-- 8. Самые популярные категории блюд
SELECT category, COUNT(*) AS number_dishes
FROM [comprehensive-restaurant-orders-popular-items-high-value-transactions-patterns]
GROUP BY category
ORDER BY number_dishes DESC;

-- 9. Средняя цена по категориям
SELECT category, ROUND(AVG(CAST(price AS decimal)), 2) as avg_category
FROM [comprehensive-restaurant-orders-popular-items-high-value-transactions-patterns]
GROUP BY category
ORDER BY avg_category DESC;

-- 10. Топ-5 самых дорогих заказов
SELECT TOP 5 order_id, SUM(CAST(price AS decimal)) AS total_price
FROM [comprehensive-restaurant-orders-popular-items-high-value-transactions-patterns]
GROUP BY order_id
ORDER BY total_price DESC;
