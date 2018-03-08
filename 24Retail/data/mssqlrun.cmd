@echo off

SET "DEMOPATH=%~1"
SET "pVarLOGFILE=%~2"
SET "SQLINSTANCE=%~3"
SET "SQLUSER=%~4"
SET "SQLPASS=%~5"

ECHO SECTION: MSSQLRUN.cmd >> %pVarLOGFILE% 2>&1
ECHO **** Show Parameter variables >> %pVarLOGFILE% 2>&1
ECHO *DEMOPATH: "%DEMOPATH%" >> %pVarLOGFILE% 2>&1
ECHO *pVarLOGFILE: "%pVarLOGFILE%" >> %pVarLOGFILE% 2>&1
ECHO *SQLINSTANCE: "%SQLINSTANCE%" >> %pVarLOGFILE% 2>&1
ECHO *SQLUSER: "%SQLUSER%" >> %pVarLOGFILE% 2>&1
ECHO *SQLPASS: "%SQLPASS%" >> %pVarLOGFILE% 2>&1


set DBName=
set DBNameMDF=
set DBNameLDF=

SET DropSQL=IF EXISTS (SELECT * FROM sys.databases where name = '%DBName%') 
SET DropSQL=%DropSQL%DROP DATABASE [%DBName%]

echo %DropSQL% >> %pVarLOGFILE% 2>&1
call sqlcmd -S "%SQLINSTANCE%" -U "%SQLUSER%" -P "%SQLPASS%" -I -Q "%DropSQL%"

set NewSQL=CREATE DATABASE [%DBName%] ON 
set NewSQL=%NewSQL%( FILENAME = '%DEMOPATH%\data\%DBNameMDF%' ), 
set NewSQL=%NewSQL%( FILENAME = '%DEMOPATH%\data\%DBNameLDF%' )
set NewSQL=%NewSQL% FOR ATTACH ;

echo %NewSQL% >> %pVarLOGFILE% 2>&1
call sqlcmd -S "%SQLINSTANCE%" -U "%SQLUSER%" -P "%SQLPASS%" -I -Q "%NewSQL%"

set DBName=
set DBNameMDF=
set DBNameLDF=

SET DropSQL=IF EXISTS (SELECT * FROM sys.databases where name = '%DBName%') 
SET DropSQL=%DropSQL%DROP DATABASE [%DBName%]

echo %DropSQL% >> %pVarLOGFILE% 2>&1
call sqlcmd -S "%SQLINSTANCE%" -U "%SQLUSER%" -P "%SQLPASS%" -I -Q "%DropSQL%"

SET NewSQL=IF NOT EXISTS (
SET NewSQL=%NewSQL%SELECT * FROM sys.databases where name = '%DBName%') 
set NewSQL=%NewSQL%CREATE DATABASE [%DBName%] ON 
set NewSQL=%NewSQL%( FILENAME = '%DEMOPATH%\Data\%DBNameMDF%' ), 
set NewSQL=%NewSQL%( FILENAME = '%DEMOPATH%\Data\%DBNameLDF%' )
set NewSQL=%NewSQL% FOR ATTACH ;
echo %NewSQL% >> %pVarLOGFILE% 2>&1

call sqlcmd -S "%SQLINSTANCE%" -U "%SQLUSER%" -P "%SQLPASS%" -I -Q "%NewSQL%"

set DBName=
set DBNameMDF=
set DBNameLDF=

SET DropSQL=IF EXISTS (SELECT * FROM sys.databases where name = '%DBName%') 
SET DropSQL=%DropSQL%DROP DATABASE [%DBName%]

echo %DropSQL% >> %pVarLOGFILE% 2>&1
call sqlcmd -S "%SQLINSTANCE%" -U "%SQLUSER%" -P "%SQLPASS%" -I -Q "%DropSQL%"

SET NewSQL=IF NOT EXISTS (
SET NewSQL=%NewSQL%SELECT * FROM sys.databases where name = '%DBName%') 
set NewSQL=%NewSQL%CREATE DATABASE [%DBName%] ON 
set NewSQL=%NewSQL%( FILENAME = '%DEMOPATH%\Data\%DBNameMDF%' ), 
set NewSQL=%NewSQL%( FILENAME = '%DEMOPATH%\Data\%DBNameLDF%' )
set NewSQL=%NewSQL% FOR ATTACH ;

echo %NewSQL% >> %pVarLOGFILE% 2>&1
call sqlcmd -S "%SQLINSTANCE%" -U "%SQLUSER%" -P "%SQLPASS%" -I -Q "%NewSQL%"

ECHO **** Database Attachment Complete
ECHO **** Database Attachment Complete >> %pVarLOGFILE% 2>&1
rem pause
