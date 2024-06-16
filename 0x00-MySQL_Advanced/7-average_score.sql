-- Drop any existing procedure to start fresh
DROP PROCEDURE IF EXISTS `ComputeAverageScoreForUser`;

-- Create the procedure
DELIMITER //

CREATE PROCEDURE `ComputeAverageScoreForUser`(
    IN `user_id` INT
)
BEGIN
    DECLARE avg_score DECIMAL(10, 2); -- Adjust precision and scale based on your needs
    
    -- Compute average score for the given user_id
    SELECT AVG(score) INTO avg_score FROM corrections WHERE user_id = user_id;
    
    -- Update the users table with the computed average score
    UPDATE users SET average_score = avg_score WHERE id = user_id;
END //

DELIMITER ;
