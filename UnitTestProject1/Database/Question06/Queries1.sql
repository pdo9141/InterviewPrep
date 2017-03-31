USE TestDB
--CREATE TABLE Rejects (
--	Id INT,
--	Name nvarchar(50),
--	Code nvarchar(50)
--)
--GO

--CREATE TABLE RejectDetails
--(
--	Id INT,
--	RejectId INT,
--	Name nvarchar(50),
--	Code nvarchar(50)
--)
--GO

--INSERT INTO Rejects VALUES (1, 'Reject One', 'ABC')
--INSERT INTO Rejects VALUES (2, 'Reject Two', 'DEF')
--INSERT INTO Rejects VALUES (3, 'Reject Three', 'GHI')

--INSERT INTO RejectDetails VALUES (1, 1, 'Reject Detail One', 'D1')
--INSERT INTO RejectDetails VALUES (2, 1, 'Reject Detail Two', 'D2')
--INSERT INTO RejectDetails VALUES (3, 2, 'Reject Detail Three', 'D3')
--INSERT INTO RejectDetails VALUES (4, 2, 'Reject Detail Four', 'D4')
--INSERT INTO RejectDetails VALUES (5, 2, 'Reject Detail Five', 'D5')
--INSERT INTO RejectDetails VALUES (6, 3, 'Reject Detail Six', 'D6')
--GO

SELECT RejectId, RejectName, RejectDetailId1, RejectDetailId2, RejectDetailId3, RejectDetailId4, RejectDetailId5 
FROM
(
	SELECT 
		r.Id AS RejectId, 
		r.Name AS RejectName, 
		rd.Name AS RejectDetailName, 
		'RejectDetailId' + CAST(ROW_NUMBER() OVER(PARTITION BY r.Id ORDER BY r.Id) AS VARCHAR(10)) ColumnSequence
	FROM Rejects r WITH (NOLOCK)
	INNER JOIN RejectDetails rd WITH (NOLOCK) ON rd.RejectId = r.Id
) Temp
PIVOT
(
	MAX(RejectDetailName)
	FOR ColumnSequence IN (RejectDetailId1, RejectDetailId2, RejectDetailId3, RejectDetailId4, RejectDetailId5)
) Piv

