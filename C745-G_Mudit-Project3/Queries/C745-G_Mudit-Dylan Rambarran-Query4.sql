-- =============================================
-- Author:		Dylan Rambarran
-- Description:	Show which rooms the instructors are teaching in
-- =============================================
USE QueensCollegeSchedulSpring2019;

SELECT CONCAT (
		InstructorFirstName
		,' '
		,InstructorLastName
		) AS InstructorFullName
	,CONCAT (
		BuildingAbbreviation
		,' '
		,RoomCode
		) AS RoomNumber
FROM Cuny.Class AS cl
INNER JOIN Cuny.Instructor AS i ON cl.InstructorId = i.InstructorId
INNER JOIN Cuny.Room AS r ON cl.RoomId = r.RoomId
INNER JOIN Cuny.Building AS b ON b.BuildingId = r.BuildingId;