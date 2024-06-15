-- Create a trigger that decreases the quantity of an item after adding a new order

-- Drop trigger if exists to avoid any conflicts
DROP TRIGGER IF EXISTS decrease_item_quantity;

-- Create the trigger
DELIMITER //

CREATE TRIGGER decrease_item_quantity AFTER INSERT ON orders
FOR EACH ROW
BEGIN
    -- Decrease the quantity of the item in the items table
    UPDATE items
    SET quantity = quantity - NEW.number
    WHERE name = NEW.item_name;
END //

DELIMITER ;
