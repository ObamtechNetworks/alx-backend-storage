-- Step 8: Create stored procedure to compute average weighted score
DELIMITER //

CREATE PROCEDURE ComputeAverageWeightedScoreForUser(IN input_user_id INT)
BEGIN
    DECLARE total_weighted_score FLOAT DEFAULT 0;
    DECLARE total_weight INT DEFAULT 0;
    DECLARE average_weighted_score FLOAT DEFAULT 0;
    
    -- Calculate the total weighted score and the total weight
    SELECT 
        SUM(c.score * p.weight) INTO total_weighted_score,
        SUM(p.weight) INTO total_weight
    FROM corrections c
    JOIN projects p ON c.project_id = p.id
    WHERE c.user_id = input_user_id;

    -- Avoid division by zero
    IF total_weight > 0 THEN
        SET average_weighted_score = total_weighted_score / total_weight;
    ELSE
        SET average_weighted_score = 0;
    END IF;

    -- Update the user's average score
    UPDATE users
    SET average_score = average_weighted_score
    WHERE id = input_user_id;
END //

DELIMITER ;