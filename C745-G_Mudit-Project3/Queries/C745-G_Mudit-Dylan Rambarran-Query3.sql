-- =============================================
-- Author:		Dylan Rambarran
-- Description:	How may classes that are being taught that semester grouped by course and aggregating the total enrollment, total class limit and the percentage of enrollment.
-- =============================================
USE QueensCollegeSchedulSpring2019;

SELECT CourseDescription
	,cl.TotalEnrollment
	,cl.TotalEnrollmentLimit
	,CASE 
		WHEN (
				cl.TotalEnrollment > 1
				AND cl.TotalEnrollmentLimit > 1
				)
			THEN ((cl.TotalEnrollment * 100.0 / cl.TotalEnrollmentLimit))
		ELSE 0
		END AS Percentage
FROM Cuny.Class AS cl
INNER JOIN Cuny.Course AS c ON cl.CourseId = c.CourseId
INNER JOIN Cuny.CourseDescription AS cd ON c.CourseDescriptionId = cd.CourseDescriptionId
GROUP BY CourseDescription
	,cl.TotalEnrollment
	,cl.TotalEnrollmentLimit;