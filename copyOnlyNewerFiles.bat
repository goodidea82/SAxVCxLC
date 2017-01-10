@echo off


echo This script installs only files that are newer in SAxVCxLC_source than in GTASAroot. Purpose is faster developement of SAxVCxLC.
echo ---------------------

if exist InstallSettings.bat (
	call InstallSettings.bat
) else (
	echo InstallSettings.bat not found. Run Install.bat first.
	SET /P a=Press a key...
	EXIT
)

REM --------------------------------------
call :Trim GTASAroot %GTASAroot%
if "%GTASAroot%"=="" (
	echo GTASAroot is not set in InstallSettings.bat 
	SET /P a=Press a key...
	exit
)

if not exist %GTASAroot%\GTA_SA.exe (
	echo.
	echo %GTASAroot%\GTA_SA.exe DOES NOT EXIST. The path in InstallSettings.bat is probably wrong or not set. Run Install.bat again to create InstallSettings.bat.
	echo.
	SET /P a=Press a key...
	exit
)



call :Trim Variant %Variant%
if "%Variant%"=="" (
    echo Variant is not set in InstallSettings.bat
	SET /P a=Press a key...
	exit
)

call :Trim useModLoader %useModLoader%
if "%useModLoader%"=="" (
    echo useModLoader is not set in InstallSettings.bat
	SET /P a=Press a key...
	exit
)

echo Path to GTA SA root:%GTASAroot%
echo Variant=%Variant%
if "%useModLoader%"=="1" (
	echo Use ModLoader=yes
) else (
	echo Use ModLoader=no
)

REM --------------------------------------
REM S= Use this option to copy directories, subdirectories, and the files contained within them, in addition to the files in the root of source. Empty folders will not be recreated.
REM I= Use this option to show a list of the files and folders to copied... but no copying is actually done. The /l option is useful if you're building a complicated xcopy command with several options and you'd like to see how it would function hypothetically.
REM Y= Use this option to stop the xcopy command from prompting you about overwriting files from source that already exist in destination.
REM D=  Use the xcopy command with /d option and a specific date, in MM-DD-YYYY format, to copy files changed on or after that date. You can also use this option without specifying a specific date to copy only those files in source that are newer than the same files that already exist in destination. This is helpful when using the xcopy command to perform regular file backups.
set xcpyOpt=/YD

REM --------------------------------------

REM Start Installation


if "%Variant%"=="1" (call toolsForInstallation\Standard.bat %xcpyOpt% %useModLoader% "%GTASAroot%")
if "%Variant%"=="2" (call toolsForInstallation\Basic.bat %xcpyOpt% %useModLoader% "%GTASAroot%")
if "%Variant%"=="3" (call toolsForInstallation\MTA.bat %xcpyOpt% %useModLoader% "%GTASAroot%")

echo Warning: timestamp uses minutes for comparison. You have to wait at least a minute before updating a file.
SET /P a=Press a key...
EXIT

REM --------------------------------------
:Trim
SetLocal EnableDelayedExpansion
set Params=%*
for /f "tokens=1*" %%a in ("!Params!") do EndLocal & set %1=%%b
exit /b
