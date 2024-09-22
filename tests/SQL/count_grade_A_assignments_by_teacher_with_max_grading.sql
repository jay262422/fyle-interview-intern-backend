-- Write query to find the number of grade A's given by the teacher who has graded the most assignments
WITH teacher_grading_count AS (
    SELECT 
        teacher_id, 
        COUNT(*) AS total_assignments_graded
    FROM assignments
    WHERE grade IS NOT NULL  -- Only consider graded assignments
    GROUP BY teacher_id
    ORDER BY total_assignments_graded DESC
    LIMIT 1  -- Get the teacher with the most graded assignments
)

SELECT COUNT(*) AS grade_A_count
FROM assignments
WHERE teacher_id = (SELECT teacher_id FROM teacher_grading_count)
  AND grade = 'A';  -- Count only assignments with grade 'A'
