-- �ϥθ�Ʈw [�m��09]
USE �m��09
GO


/* ---------------- 1 ------------------- */

-- �ܽШ�

-- sql command
SELECT �m�W AS �ܽЦW��, �a�}
FROM ���u
UNION
SELECT �p���H, �a�}
FROM �Ȥ�
UNION
SELECT �p���H, �a�}
FROM �X�@�t��

-- store procedure
CREATE PROCEDURE InvitationList
AS
  SELECT �m�W AS �ܽЦW��, �a�}
  FROM ���u
  UNION
  SELECT �p���H, �a�}
  FROM �Ȥ�
  UNION
  SELECT �p���H, �a�}
  FROM �X�@�t��
GO

EXEC InvitationList

-- view
CREATE VIEW InvitationList_VIEW
AS
  SELECT �m�W AS �ܽЦW��, �a�}
  FROM ���u
  UNION
  SELECT �p���H, �a�}
  FROM �Ȥ�
  UNION
  SELECT �p���H, �a�}
  FROM �X�@�t��
GO

SELECT * FROM InvitationList_VIEW


/* ---------------- 2 ------------------- */

-- �q���`��

-- sql command
SELECT �q��s��, �U����, �Ȥ�W��,
       �`�ƶq = (
         SELECT SUM(�ƶq)
         FROM �q�ʶ���
         WHERE �q��.�q��s�� = �q�ʶ���.�q��s��
       )
FROM �q��, �Ȥ�
WHERE �q��.�Ȥ�s�� = �Ȥ�.�Ȥ�s��
ORDER BY 1

-- store procedure
CREATE PROCEDURE OrdersReport
AS
  SELECT �q��s��, �U����, �Ȥ�W��,
         �`�ƶq = (
           SELECT SUM(�ƶq)
           FROM �q�ʶ���
           WHERE �q��.�q��s�� = �q�ʶ���.�q��s��
         )
  FROM �q��, �Ȥ�
  WHERE �q��.�Ȥ�s�� = �Ȥ�.�Ȥ�s��
  ORDER BY 1
GO

EXEC OrdersReport

-- view
CREATE VIEW OrdersReport_VIEW
AS
  SELECT �q��s��, �U����, �Ȥ�W��,
         �`�ƶq = (
           SELECT SUM(�ƶq)
           FROM �q�ʶ���
           WHERE �q��.�q��s�� = �q�ʶ���.�q��s��
         )
  FROM �q��, �Ȥ�
  WHERE �q��.�Ȥ�s�� = �Ȥ�.�Ȥ�s��
GO

SELECT *
FROM OrdersReport_VIEW
ORDER BY 1


/* ---------------- 3 ------------------- */

-- �@�P���~

-- sql command
SELECT ���~�W�� AS �@�P���~
FROM �X�X���q
WHERE ���~�W�� IN (
  SELECT ���~�W��
  FROM �мФ��q
)

-- store procedure
CREATE PROCEDURE BothProduct
AS
  SELECT ���~�W�� AS �@�P���~
  FROM �X�X���q
  WHERE ���~�W�� IN (
    SELECT ���~�W��
    FROM �мФ��q
  )
GO

EXEC BothProduct

-- view
CREATE VIEW BothProduct_VIEW
AS
  SELECT ���~�W�� AS �@�P���~
  FROM �X�X���q
  WHERE ���~�W�� IN (
    SELECT ���~�W��
    FROM �мФ��q
  )
GO

SELECT * FROM BothProduct_VIEW


/* ---------------- 4 ------------------- */

-- ���y�P��q����

-- sql command
SELECT ���y�W��,
       ISNULL((
         SELECT SUM(�ƶq)
         FROM �q�ʶ���
         WHERE ���y�s�� = ���y.���y�s��), 0
       ) AS �P��ƶq
FROM ���y
ORDER BY 2 desc

-- store procedure
CREATE PROCEDURE BookSalesVolume
AS
  SELECT ���y�W��,
         ISNULL((
           SELECT SUM(�ƶq)
           FROM �q�ʶ���
           WHERE ���y�s�� = ���y.���y�s��), 0
         ) AS �P��ƶq
  FROM ���y
  ORDER BY 2 desc
GO

EXEC BookSalesVolume

-- view
CREATE VIEW BookSalesVolume_VIEW
AS
  SELECT ���y�W��,
         ISNULL((
           SELECT SUM(�ƶq)
           FROM �q�ʶ���
           WHERE ���y�s�� = ���y.���y�s��), 0
         ) AS �P��ƶq
  FROM ���y
GO

SELECT *
FROM BookSalesVolume_VIEW
ORDER BY 2 desc


/* ---------------- 5 ------------------- */

-- �⤽�q�ۦP���~������ (�ϥ� join)

-- sql command
SELECT �X.���~�W��,
       �X.���� AS �X�X���q���~����,
       ��.���� AS �мФ��q���~����
FROM �X�X���q AS �X JOIN �мФ��q AS �� ON �X.���~�W�� = ��.���~�W��

-- store procedure
CREATE PROCEDURE BookPriceComparison_JOIN
AS
  SELECT �X.���~�W��,
         �X.���� AS �X�X���q���~����,
         ��.���� AS �мФ��q���~����
  FROM �X�X���q AS �X JOIN �мФ��q AS �� ON �X.���~�W�� = ��.���~�W��
GO

EXEC BookPriceComparison_JOIN

-- view
CREATE VIEW BookPriceComparison_JOIN_VIEW
AS
  SELECT �X.���~�W��,
       �X.���� AS �X�X���q���~����,
       ��.���� AS �мФ��q���~����
  FROM �X�X���q AS �X JOIN �мФ��q AS �� ON �X.���~�W�� = ��.���~�W��
GO

SELECT * FROM BookPriceComparison_JOIN_VIEW


/* ---------------- 6 ------------------- */

-- �⤽�q�ۦP���~������ (�ϥ� where)

-- sql command
SELECT �X.���~�W��,
       �X.���� AS �X�X���q���~����,
       ��.���� AS �мФ��q���~����
FROM �X�X���q AS �X, �мФ��q AS ��
WHERE �X.���~�W�� = ��.���~�W��

-- store procedure
CREATE PROCEDURE BookPriceComparison_WHERE
AS
  SELECT �X.���~�W��,
         �X.���� AS �X�X���q���~����,
         ��.���� AS �мФ��q���~����
  FROM �X�X���q AS �X, �мФ��q AS ��
  WHERE �X.���~�W�� = ��.���~�W��
GO

EXEC BookPriceComparison_WHERE

-- view
CREATE VIEW BookPriceComparison_WHERE_VIEW
AS
  SELECT �X.���~�W��,
         �X.���� AS �X�X���q���~����,
         ��.���� AS �мФ��q���~����
  FROM �X�X���q AS �X, �мФ��q AS ��
  WHERE �X.���~�W�� = ��.���~�W��
GO

SELECT * FROM BookPriceComparison_WHERE_VIEW


/* ---------------- 7 ------------------- */

-- �p��U�Ȥ�X�f���ơA�æC�X�j�� 1 ��

-- sql command
SELECT �Ȥ�W��, COUNT(*) AS �X�f����
FROM �X�f�O��
GROUP BY �Ȥ�W��
HAVING COUNT(*) >= 1

-- store procedure
CREATE PROCEDURE ShipmentsTimes
AS
  SELECT �Ȥ�W��, COUNT(*) AS �X�f����
  FROM �X�f�O��
  GROUP BY �Ȥ�W��
  HAVING COUNT(*) >= 1
GO

EXEC ShipmentsTimes

-- view
CREATE VIEW ShipmentsTimes_VIEW
AS
  SELECT �Ȥ�W��, COUNT(*) AS �X�f����
  FROM �X�f�O��
  GROUP BY �Ȥ�W��
  HAVING COUNT(*) >= 1
GO

SELECT * FROM ShipmentsTimes_VIEW


/* ---------------- 8 ------------------- */

-- �C�X�Ȥ᪺�`�q�ʶq�A�H�ΨC���X�f�����ƶq

-- sql command
SELECT �Ȥ�W��,
       SUM(�ƶq) AS �`�ƶq,
       AVG(�ƶq) AS �����q
FROM �X�f�O��
GROUP BY �Ȥ�W��

-- store procedure
CREATE PROCEDURE ShipmentsSumAndAvg
AS
  SELECT �Ȥ�W��,
         SUM(�ƶq) AS �`�ƶq,
         AVG(�ƶq) AS �����q
  FROM �X�f�O��
  GROUP BY �Ȥ�W��
GO

EXEC ShipmentsSumAndAvg

-- view
CREATE VIEW ShipmentsSumAndAvg_VIEW
AS
  SELECT �Ȥ�W��,
         SUM(�ƶq) AS �`�ƶq,
         AVG(�ƶq) AS �����q
  FROM �X�f�O��
  GROUP BY �Ȥ�W��
GO

SELECT * FROM ShipmentsSumAndAvg_VIEW


/* ---------------- 9 ------------------- */

-- �C�X�Ҧ����W�ťD�ު����u�A����ܤW�ťD�ެO��

-- sql command
SELECT ���u.�m�W,
       ���u.¾��,
       ���x.�m�W AS �D��
FROM ���u LEFT JOIN ���u AS ���x ON  ���u.�D�޽s�� = ���x.�s��
WHERE ���x.�m�W IS NOT NULL
ORDER BY 3

-- store procedure
CREATE PROCEDURE SupervisorOfEmployee
AS
  SELECT ���u.�m�W,
         ���u.¾��,
         ���x.�m�W AS �D��
  FROM ���u LEFT JOIN ���u AS ���x ON  ���u.�D�޽s�� = ���x.�s��
  WHERE ���x.�m�W IS NOT NULL
  ORDER BY 3
GO

EXEC SupervisorOfEmployee

-- view
CREATE VIEW SupervisorOfEmployee_VIEW
AS
  SELECT ���u.�m�W,
         ���u.¾��,
         ���x.�m�W AS �D��
  FROM ���u LEFT JOIN ���u AS ���x ON  ���u.�D�޽s�� = ���x.�s��
  WHERE ���x.�m�W IS NOT NULL
GO

SELECT *
FROM SupervisorOfEmployee_VIEW
ORDER BY 3


/* ---------------- 10 ------------------- */

-- �C�X�e 3 �Q�����y

-- sql command
SELECT TOP 3 ROW_NUMBER() OVER(ORDER BY ���� DESC) AS ����ƦW,
       ���y�W��,
       ����,
       �X�����q
FROM ���y
ORDER BY ����ƦW

-- store procedure
CREATE PROCEDURE BookPriceRank
AS
  SELECT TOP 3 ROW_NUMBER() OVER(ORDER BY ���� DESC) AS ����ƦW,
         ���y�W��,
         ����,
         �X�����q
  FROM ���y
  ORDER BY ����ƦW
GO

EXEC BookPriceRank

-- view
CREATE VIEW BookPriceRank_VIEW
AS
  SELECT TOP 3 ROW_NUMBER() OVER(ORDER BY ���� DESC) AS ����ƦW,
         ���y�W��,
         ����,
         �X�����q
  FROM ���y
GO

SELECT *
FROM BookPriceRank_VIEW
ORDER BY ����ƦW
