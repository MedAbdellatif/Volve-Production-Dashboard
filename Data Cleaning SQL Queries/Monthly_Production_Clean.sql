/*


Cleaning Monthly Production  Data in SQL Queries


*/

--Rename Table


EXEC sp_rename '[dbo].[Monthly Production Data$]','MonthlyProduction'

Select * from MonthlyProduction
-------------------------------------------------------------------------------------
--Rename Columns


EXEC sp_rename 'MonthlyProduction.On Stream','On_Stream_Hrs', 'COLUMN'
EXEC sp_rename 'MonthlyProduction.Oil','Oil_Production_SM3', 'COLUMN'
EXEC sp_rename 'MonthlyProduction.Gas','Gas_Production_SM3', 'COLUMN'
EXEC sp_rename 'MonthlyProduction.Water','Water_Production_SM3', 'COLUMN'
EXEC sp_rename 'MonthlyProduction.GI','Gas_Injection_SM3', 'COLUMN'
EXEC sp_rename 'MonthlyProduction.WI','Water_Injection_SM3', 'COLUMN'

-------------------------------------------------------------------------------------
-- Delete Empty Row

DELETE top (1) From MonthlyProduction
Select DISTINCT [Wellbore name] from MonthlyProduction
