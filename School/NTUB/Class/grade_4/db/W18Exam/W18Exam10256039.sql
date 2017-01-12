USE [NTUB_DB]
GO


-- �Ĥ@�D
SELECT
	[stdID] AS StudentID,
	[stdName] AS 'Student Name',
	�׽Ҭ�ؼ� = (
		SELECT COUNT(*)
		FROM [dbo].[studentCourse]
		WHERE [studentCourse].[studentID] = [StudentData].[stdID]
	)
FROM [dbo].[StudentData]
ORDER BY 1


-- �ĤG�D
CREATE PROCEDURE SP_Q1_10256039
	@std_id char(4)
AS
	SELECT
		[stdID] AS StudentID,
		[stdName] AS 'Student Name',
		�׽Ҭ�ؼ� = (
			SELECT COUNT(*)
			FROM [dbo].[studentCourse]
			WHERE [studentCourse].[studentID] = [StudentData].[stdID]
		)
	FROM [dbo].[StudentData]
	WHERE [StudentData].[stdID] = @std_id
	ORDER BY 1
GO

-- procedure test
EXEC SP_Q1_10256039 '001'
EXEC SP_Q1_10256039 '031'
EXEC SP_Q1_10256039 '081'


-- �ĤT�D
SELECT
	[courseBasicData].[courseID] AS �Ҹ�,
	[courseName] AS �ҦW,
	MAX([midScore]) AS �����̰�,
	MIN([midScore]) AS �����̧C,
	AVG([midScore]) AS ��������
FROM 
	[dbo].[studentCourse] JOIN [dbo].[courseBasicData]
	ON [studentCourse].[courseID] = [courseBasicData].[courseID]
GROUP BY [courseBasicData].[courseID], [courseName]
ORDER BY [courseBasicData].[courseID]


-- �ĥ|�D
CREATE PROCEDURE SP_Q3_10256039
	@courseID nvarchar(10)
AS
	SELECT
		[courseBasicData].[courseID] AS �Ҹ�,
		[courseName] AS �ҦW,
		MAX([midScore]) AS �����̰�,
		MIN([midScore]) AS �����̧C,
		AVG([midScore]) AS ��������
	FROM 
		[dbo].[studentCourse] JOIN [dbo].[courseBasicData]
		ON [studentCourse].[courseID] = [courseBasicData].[courseID]
	WHERE [studentCourse].[courseID] = @courseID
	GROUP BY [courseBasicData].[courseID], [courseName]
	ORDER BY [courseBasicData].[courseID]
GO

-- procedure test
EXEC SP_Q3_10256039 '50311011'
EXEC SP_Q3_10256039 '50336431'
EXEC SP_Q3_10256039 '50346700'