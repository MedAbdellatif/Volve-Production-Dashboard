*


Cleaning Data in SQL Queries


*/

-----------------------------------------------------------------------------------------
--Rename Table
EXEC sp_rename '[dbo].[Daily Production Data$]','DailyProduction'

SELECT * 
FROM DailyProduction


-----------------------------------------------------------------------------------------
--Standardize Date Format

Alter table DailyProduction
ALTER COLUMN DATEPRD DATE


-----------------------------------------------------------------------------------------

--Change 'WI' to 'Injector' and 'OP' TO 'Producer'
UPDATE DailyProduction
SET WELL_TYPE = CASE WELL_TYPE
WHEN 'WI' THEN 'Injector'
WHEN 'OP' THEN 'Producer'
ELSE 'OTHER' 
END 
-----------------------------------------------------------------------------------------

--Rename Columns


EXEC sp_rename 'DailyProduction.BORE_OIL_VOL','Oil_Production_SM3/D', 'COLUMN'
EXEC sp_rename 'DailyProduction.BORE_WAT_VOL','Water_Production_SM3/D', 'COLUMN'
EXEC sp_rename 'DailyProduction.BORE_GAS_VOL','Gas_Production_SM3/D', 'COLUMN'
EXEC sp_rename 'DailyProduction.BORE_WI_VOL','Water_Injection_SM3/D', 'COLUMN'

-------------------------------------------------------------------------------------------
-- Delete Rows

/* THE Well 15/9-F-5 is a Production well thus we need to delete all the rows that shows Well Type as Injector for this Well*/ 

DELETE from DailyProduction
WHERE NPD_WELL_BORE_NAME = '15/9-F-1 C' and WELL_TYPE = 'Injector'

--------------------------------------------------------------------------------------
-- DROP Unused Columns
/* A Well lookup TABLE was created to sumerises the Well Info thus no need to keep unsed Columns */

Alter table DailyProduction
DROP COLUMN 
WELL_BORE_CODE, 
NPD_WELL_BORE_CODE,
NPD_FIELD_NAME,
NPD_FIELD_CODE,
NPD_FACILITY_CODE,
NPD_FACILITY_NAME,
AVG_CHOKE_UOM

SELECT SUM([Oil_Production_SM3/D]) from DailyProduction
select COUNT (*) from DailyProduction
order by DATEPRD