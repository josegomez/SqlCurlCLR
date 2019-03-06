--This Header uses manager:manager account
declare @header nvarchar(200) = N'Authorization: Basic ' + (select CAST('manager:manager' as varbinary(max)) FOR XML PATH(''), BINARY BASE64);
declare @headerType nvarchar(200) = N'Content-Type: application/json';
declare @allHeaders nvarchar(1000) = @header+'~'+@headerType; --Note that headers are separated by a tilde


--Obviously these values need to change to match your Epicor instance
declare @body nvarchar(4000) = N' {
  "GLJrnGrp_ActiveUserID": "manager",
  "GLJrnGrp_BookID": "MAIN",
  "GLJrnGrp_BookMode": "S",
  "GLJrnGrp_CloseFiscalPeriod": 0,
  "GLJrnGrp_COACode": "MAIN",
  "GLJrnGrp_Company": "C001",
  "GLJrnGrp_CreatedBy": "manager",
  "GLJrnGrp_CurrencyCode": "USD",
  "GLJrnGrp_FiscalCalendarID": "MAIN",
  "GLJrnGrp_FiscalPeriod": 3,
  "GLJrnGrp_FiscalPeriodType": "O",
  "GLJrnGrp_FiscalYear": 2019,
  "GLJrnGrp_FiscalYearSuffix": "",
  "GLJrnGrp_GroupID": "Larry",
  "GLJrnGrp_JEDate": "2019-03-06",
  "GLJrnGrp_JournalCode": "GJ",
  "GLJrnGrp_Posted": false,
  "GLJrnGrp_PostErrorLog": "",
  "GLJrnGrp_RateGrpCode": "MAIN",
  "GLJrnGrp_SysRowID": "00000000-0000-0000-0000-000000000000",
  "RowMod": "A",
  "SysRowID": "00000000-0000-0000-0000-000000000000",
  "RowIdent": "00000000-0000-0000-0000-000000000000"
}';

declare @endPoint nvarchar(1000) = N'https://YourServerURL/YourEpicorInstance/api/v1/BaqSvc/CreateGLJournalEntryGroup/';

exec curl.XPATCH @H = @allHeaders, @d =@body, @url = @endPoint;