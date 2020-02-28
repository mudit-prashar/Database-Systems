-- =============================================
-- Author:		Thomas Jimenez
-- Description:	Show all instructors who are teaching in classes in multiple departments
-- =============================================


SELECT DISTINCT  C.[InstructorId], COUNT(CR.DepartmentId) AS DepartmentCount
FROM [Cuny].[Class] AS C
	INNER JOIN [Cuny].[Course] AS CR
	ON C.CourseId = CR.CourseId
GROUP BY C.[InstructorId],CR.DepartmentId
HAVING COUNT(CR.DepartmentId) > 1
