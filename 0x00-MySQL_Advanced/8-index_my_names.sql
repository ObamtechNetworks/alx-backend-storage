-- Create the index idx_name_first on the first letter of name column in the names table

-- Ensure the names table is created first (assuming it's already imported from names.sql.zip)
-- CREATE TABLE names (
--   id INT PRIMARY KEY,
--   name VARCHAR(100)
-- );

ALTER TABLE names
ADD COLUMN first_letter CHAR(1) GENERATED ALWAYS AS (LEFT(name, 1)) STORED;

-- Create the index
CREATE INDEX idx_name_first ON names (first_letter);
