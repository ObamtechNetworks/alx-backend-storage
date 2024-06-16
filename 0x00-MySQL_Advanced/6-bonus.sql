-- CREATING AND USING PROCEDURES IN SQL
--  A PROCEDURE THAT ADDS A NEW CORRECTION FOR A STUDENT

-- Drop any existing procedure
DROP PROCEDURE IF EXISTS `AddBonus`;

-- Create the procedure
DELIMITER //

CREATE PROCEDURE `AddBonus`(
    IN `user_id` INT,
    IN `project_name` VARCHAR(255),
    IN `score` INT
)
BEGIN
    DECLARE project_id INT;

    -- Check if project exists, and if not, create it
    SELECT id INTO project_id FROM projects WHERE name = project_name;
    
    IF project_id IS NULL THEN
        -- Project does not exist, so create it
        INSERT INTO projects (name) VALUES (project_name);
        SET project_id = LAST_INSERT_ID();
    END IF;

    -- Insert correction into corrections table
    INSERT INTO corrections (user_id, project_id, score) VALUES (user_id, project_id, score);
    
    -- Optional: If you want to update average_score in users table, uncomment the following
    -- UPDATE users SET average_score = (SELECT AVG(score) FROM corrections WHERE user_id = user_id) WHERE id = user_id;
END //

DELIMITER ;
