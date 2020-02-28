-- ====================================================================================
-- Author:    Mudit Prashar
-- Description: Shows the name of the Instructors who teach Online classes and 
--				the number of total students enrolled
-- ====================================================================================

SELECT c.[ClassId]
      ,CONCAT(I.INstructorFirstName, ' ', I.InstructorLastNAme) as Instructor
      ,IM.[InstructionMode]
      ,c.[TotalEnrollment]

From Cuny.Class as c
INNER JOIN Cuny.InstructionMode as IM
on Im.InstructionModeId = c.InstructionModeId
INNER JOIN Cuny.Instructor as I 
on I.InstructorId = c.InstructorId
WHERE IM.InstructionMode = 'Web-Enhanced'