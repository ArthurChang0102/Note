USE [NTUB_DB]
GO


-- �Ĥ@�D
SELECT
	[smtr] AS �}�ҾǴ��O,
	[courseID] AS �ҵ{�s��,
	[deptName] AS �}�Ҭ�t�O,
	[courseYear] AS �}�Ҧ~��,
	[courseClass] AS �}�үZ��,
	[teacherID] AS �½ұЮv,
	[courseCredit] AS �Ǥ���
FROM [dbo].[courseData], [dbo].[DepartmentData]
WHERE [courseDept] = [deptNo]
ORDER BY [courseDept]


-- �ĤG�D
CREATE VIEW V1_2_10256039
AS
	SELECT
		[smtr] AS �}�ҾǴ��O,
		[courseID] AS �ҵ{�s��,
		[deptName] AS �}�Ҭ�t�O,
		[courseYear] AS �}�Ҧ~��,
		[courseClass] AS �}�үZ��,
		[teacherID] AS �½ұЮv,
		[courseCredit] AS �Ǥ���
	FROM [dbo].[courseData], [dbo].[DepartmentData]
	WHERE [courseDept] = [deptNo]
GO

-- TEST VIEW
SELECT * 
FROM V1_2_10256039, [dbo].[courseData]
ORDER BY [courseDept]


-- �ĤT�D
SELECT
	[deptNo] AS ��t�O,
	[teacherData].[teacherID],
	[teacherName],
	COUNT([courseID]) AS �ҵ{����,
	ISNULL(SUM([courseCredit]), 0) AS �Ǥ��`��
FROM 
	[dbo].[teacherData] LEFT JOIN [dbo].[courseData]
	ON [teacherData].[teacherID] = [courseData].[teacherID]
GROUP BY [deptNo], [teacherData].[teacherID], [teacherName]
ORDER BY 1


-- �ĥ|�D
CREATE VIEW V3_2_10256039
AS
	SELECT
		[deptNo] AS ��t�O,
		[teacherData].[teacherID],
		[teacherName],
		COUNT([courseID]) AS �ҵ{����,
		ISNULL(SUM([courseCredit]), 0) AS �Ǥ��`��
	FROM 
		[dbo].[teacherData] LEFT JOIN [dbo].[courseData]
		ON [teacherData].[teacherID] = [courseData].[teacherID]
	GROUP BY [deptNo], [teacherData].[teacherID], [teacherName]
GO

-- TEST VIEW
SELECT *
FROM V3_2_10256039
ORDER BY 1


-- �Ĥ��D
SELECT
	[smtr] AS �}�ҾǴ�,
	[courseData].[courseID] AS �ҵ{�s��,
	[courseName] AS �ҵ{�W��,
	[deptName] AS �}�Ҭ�t,
	[courseYear] AS �}�Ҧ~��,
	[courseClass] AS �}�үZ�O,
	[teacherName] AS �½ұЮv,
	[courseCredit] AS �Ǥ���
FROM [dbo].[courseData] 
	JOIN [dbo].[courseBasicData]
	ON [courseData].[courseID] = [courseBasicData].[courseID]
	JOIN [dbo].[DepartmentData]
	ON [courseData].[courseDept] = [DepartmentData].[deptNo]
	JOIN [dbo].[teacherData]
	ON [courseData].[teacherID] = [teacherData].[teacherID]
ORDER BY [courseData].[courseID]