-- =============================================
-- Author:		Thomas Jimenez
-- Description:	How many instructors are in each department?
-- =============================================

SELECT DISTINCT  CR.DepartmentId, COUNT(DISTINCT C.InstructorId) As InstructorCount
FROM [Cuny].[Class] AS C
	INNER JOIN [Cuny].[Course] AS CR
	ON C.CourseId = CR.CourseId
GROUP BY  CR.DepartmentId
ORDER BY InstructorCount