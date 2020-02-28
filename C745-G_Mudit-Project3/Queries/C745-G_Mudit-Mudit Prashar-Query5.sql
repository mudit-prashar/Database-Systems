-- ====================================================================================
-- Author:    Mudit Prashar
-- Description:  Shows the Course Information 
-- ====================================================================================

SELECT a.[CourseId]
	,cd.[CourseDescription]
	,d.[DepartmentAbbreviation]
	,a.[CourseLevel]
	,a.[CourseHours]
	,a.[CourseCredit]
FROM Cuny.Course AS a
INNER JOIN Cuny.CourseDescription AS cd ON cd.CourseDescriptionId = a.CourseDescriptionId
INNER JOIN Cuny.Department AS d ON d.DepartmentId = a.DepartmentId