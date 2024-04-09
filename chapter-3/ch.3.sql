SELECT
    order_id, 
AVG(quantity) AS average_quantity
FROM 
    (
    SELECT order_id, quantity
    FROM order_details
    WHERE quantity > 10
    ) 
    AS filtered_orders
GROUP BY
    order_id;
