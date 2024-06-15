-- Create a trigger that resets the attribute valid_email only when the email has been changed

-- Drop trigger if exists to avoid any conflicts
DROP TRIGGER IF EXISTS reset_valid_email_attr;

-- Create the trigger
DELIMITER //

CREATE TRIGGER reset_valid_email_attr BEFORE UPDATE ON users
FOR EACH ROW
BEGIN
    IF NEW.email <> OLD.email THEN
        SET NEW.valid_email = 0;
    END IF;
END //

DELIMITER ;
