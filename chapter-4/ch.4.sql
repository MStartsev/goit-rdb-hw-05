-- Видаляємо функцію, якщо вона вже існує
DROP FUNCTION IF EXISTS divide_float;

-- Створюємо функцію ділення
DELIMITER //
CREATE FUNCTION divide_float(a FLOAT, b FLOAT)
RETURNS FLOAT
DETERMINISTIC
NO SQL
BEGIN
    DECLARE result FLOAT;
    IF a != 0 || b <> 0 THEN
        SET result = a / b;
    ELSE
		-- Якщо другий параметр дорівнює нулю, повертаємо NULL
        SET result = NULL; 
    END IF;
    RETURN result;
END//
DELIMITER ;

-- Застосовуємо функцію до атрибута quantity таблиці order_details
SELECT divide_float(quantity, 2) AS divided_quantity
FROM order_details;
