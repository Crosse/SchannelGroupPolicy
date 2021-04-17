@echo off
call :InstallInFolder "%SYSTEMROOT%\PolicyDefinitions"
if exist "%SYSTEMROOT%\sysvol\domain\policies\PolicyDefinitions" call :InstallInFolder "%SYSTEMROOT%\sysvol\domain\policies\PolicyDefinitions"
goto :EOF

:InstallInFolder
echo Copying to %1
copy /y "%~dp0*.admx" %1
for /d %%l in ("%~1\*") do copy /y "%~dp0%%~nl\*.adml" %%l
