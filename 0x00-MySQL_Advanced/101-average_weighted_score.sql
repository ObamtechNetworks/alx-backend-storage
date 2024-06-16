-- CALCULATE AVERAGE WEIGHTED SCORE FOR ALL

DELIMITER //

CREATE PROCEDURE ComputeAverageWeightedScoreForUsers()
BEGIN
    -- Declare variables
    DECLARE done INT DEFAULT 0;
    DECLARE student_id INT;
    DECLARE avg_weighted_score FLOAT;

    -- Declare cursor for iterating over each student
    DECLARE student_cursor CURSOR FOR
        SELECT StudentID FROM Students;

    -- Declare handler for the end of the cursor
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    -- Open the cursor
    OPEN student_cursor;

    -- Loop through each student
    student_loop: LOOP
        FETCH student_cursor INTO student_id;
        IF done THEN
            LEAVE student_loop;
        END IF;

        -- Calculate the weighted average score for the current student
        SELECT SUM(Score * Weight) / SUM(Weight) INTO avg_weighted_score
        FROM Scores
        WHERE StudentID = student_id;

        -- Insert or update the average weighted score in the StudentAverageScores table
        INSERT INTO StudentAverageScores (StudentID, AverageWeightedScore)
        VALUES (student_id, avg_weighted_score)
        ON DUPLICATE KEY UPDATE AverageWeightedScore = avg_weighted_score;
    END LOOP;

    -- Close the cursor
    CLOSE student_cursor;
END //

DELIMITER ;
