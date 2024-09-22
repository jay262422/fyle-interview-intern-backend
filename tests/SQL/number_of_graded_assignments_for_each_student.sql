SELECT 
    student_id, 
    COUNT(*) AS graded_assignments_count
FROM assignments
WHERE `state` = 'GRADED'  -- Use backticks for column names that conflict with SQL keywords
GROUP BY student_id;
