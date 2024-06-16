-- Drop any existing procedure to start fresh
DROP PROCEDURE IF EXISTS `ComputeAverageScoreForUser`;

-- Create the procedure
DELIMITER //

CREATE PROCEDURE ComputeAverageScoreForUser(
  IN user_id INT
)
BEGIN
  DECLARE total_score FLOAT;
  DECLARE num_corrections INT;

  -- Calculate total score and number of corrections for the user
  SELECT SUM(score), COUNT(*)
  INTO total_score, num_corrections
  FROM corrections
  WHERE user_id = user_id;

  -- Update user's average score (handle division by zero)
  IF num_corrections > 0 THEN
    UPDATE users
    SET average_score = total_score / num_corrections
    WHERE id = user_id;
  ELSE
    UPDATE users
    SET average_score = 0.0
    WHERE id = user_id;
  END IF;
END //

DELIMITER ;

