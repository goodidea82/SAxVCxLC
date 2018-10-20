@echo off
echo -----------------------
echo This is MTA.bat.
echo XCopy option: %1
echo Use ModLoader: %2
echo GTASAroot: %3
echo(
set XCPYOptions=%1
set useModLoader=%2
set fromDir=%CD%\SAxVCxLC_source
set toDir=%3
set toDir=%toDir:"=%
echo fromDir=%fromDir%
echo toDir=%toDir%

REM The installation script uses xcopy to install files. Some files that should not be copied are specified in xcopy_exclude.txt. 
REM xcopy requires that the full path is provided to xcopy_exclude and that no spaces are used in the path. See here: http://stackoverflow.com/questions/1333589/how-do-i-transform-the-working-directory-into-a-8-3-short-file-name-using-batch
REM for %%A in ("%CD%\toolsForInstallation\xcopy_exclude.txt") do set exclude=%%~sA
call :setExclude "%CD%\toolsForInstallation\xcopy_exclude.txt"
set exclude=/EXCLUDE:%exclude%


echo ERROR: MTA.bat is not implemented yet.
SET /P a=Press a key...
exit /b

:setExclude
	set exclude=%~s1
	if not exist "%exclude%" (
		echo -------------------------
		echo ERROR Problem 6. Initialising the exclude-path failed. Exclude=
		echo %exclude%
		goto :exitWithError
	)	
exit /b

:exitWithError
	echo This message comes from toolsForInstallation\MTA.bat
	echo(
	echo Please take a screenshot of this window and inform the developers of SAxVCxLC on www.gtaforums.com about this problem.
	SET /P a=Press enter to exit...
exit

