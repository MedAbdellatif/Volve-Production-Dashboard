/*


Create Well lookup table in SQL Queries


*/

SELECT DISTINCT
WELL_BORE_CODE,
NPD_WELL_BORE_NAME,
NPD_WELL_BORE_CODE,
NPD_FIELD_CODE,
NPD_FIELD_NAME,
NPD_FACILITY_CODE,
NPD_FACILITY_NAME

INTO
Well_Lookup

FROM DailyProduction


