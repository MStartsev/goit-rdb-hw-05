-- Видаляємо функцію, якщо вона вже існує
DROP FUNCTION IF EXISTS divide_float;

-- Створюємо функцію ділення
DELIMITER //
CREATE FUNCTION 
    divide_float(a FLOAT, b FLOAT)
RETURNS FLOAT
DETERMINISTIC
NO SQL
BEGIN
   DECLARE result FLOAT;
    IF 
        (
            a = 0 
            OR 
            b = 0 
            OR 
            ISNULL(a OR b)
        ) 
        THEN
        -- Якщо один з параметрів дорівнює 0 || NULL , повертаємо 0
        SET result = 0; 
    ELSE
        SET result = a / b;
    END IF;
    RETURN result;
END//
DELIMITER ;

-- Застосовуємо функцію до атрибута quantity таблиці order_details
SELECT 
    id, 
    order_id, 
    product_id, 
    quantity, 
    divide_float(quantity, 10) AS divided_quantity
FROM order_details;
