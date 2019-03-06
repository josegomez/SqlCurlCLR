﻿sp_configure 'clr enabled', 1
GO
reconfigure
GO

ALTER DATABASE Epicor10FReportsBK SET TRUSTWORTHY ON --Set your Databsae here (NOT YOUR EPICOR DB)

CREATE ASSEMBLY SqlClrCurl
FROM 'E:\Epicor\Scripts\SqlClrCurl.dll' --Change this to your DLL Path
WITH PERMISSION_SET = UNSAFE;


EXEC sp_changedbowner 'sa'



CREATE SCHEMA CURL;
GO

--Create the function/procedure
CREATE FUNCTION CURL.XGET (@H NVARCHAR(MAX), @url NVARCHAR(4000))
RETURNS NVARCHAR(MAX)
AS EXTERNAL NAME SqlClrCurl.Curl.Get;
GO

CREATE PROCEDURE CURL.XPOST (@H NVARCHAR(MAX), @d NVARCHAR(MAX), @url NVARCHAR(4000))
AS EXTERNAL NAME SqlClrCurl.Curl.Post;
GO

CREATE PROCEDURE CURL.XPATCH (@H NVARCHAR(MAX), @d NVARCHAR(MAX), @url NVARCHAR(4000))
AS EXTERNAL NAME SqlClrCurl.Curl.Patch;
GO
CREATE PROCEDURE CURL.IGNORESSL
AS EXTERNAL NAME SqlClrCurl.Curl.InitiateSSLTrust
GO


