Borrowed / Clone this mostly from
https://github.com/Microsoft/sql-server-samples

Added some enhancements for Patching.

Say you wanted to Invoke a Certain API (EPICOR) from SQL

1) Download and build this library and place it somewhere in your Server

2) Follow the attached SQL script [SqlSetup.sql](SqlSetup.sql)

3) Follow the Example script [SampleEpicorRESTCall.sql](SampleEpicorRESTCall.sql) to make the call
#Note that headers are separated via tilde when passed in from SQL