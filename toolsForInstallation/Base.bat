@echo off
echo -----------------------
echo This is Base.bat
echo XCopy options: %1
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

REM The installation script uses xcopy to install files. Some files that should not be copied are specified in xcopy_exclude.txt. For example folders of the form "_img_src" and ".7z" files.
REM xcopy requires that the full path is provided to xcopy_exclude and that no spaces are used in the path. See here: http://stackoverflow.com/questions/1333589/how-do-i-transform-the-working-directory-into-a-8-3-short-file-name-using-batch
REM for %%A in ("%CD%\toolsForInstallation\xcopy_exclude.txt") do set exclude=%%~sA
call :setExclude "%CD%\toolsForInstallation\xcopy_exclude.txt"
set exclude=/EXCLUDE:%exclude%

REM Some xcopy options.
REM S= Use this option to copy directories, subdirectories, and the files contained within them, in addition to the files in the root of source. Empty folders will not be recreated.
REM I= Use this option to show a list of the files and folders to copied... but no copying is actually done. The /l option is useful if you're building a complicated xcopy command with several options and you'd like to see how it would function hypothetically.
REM Y= Use this option to stop the xcopy command from prompting you about overwriting files from source that already exist in destination.
REM D=  Use the xcopy command with /d option and a specific date, in MM-DD-YYYY format, to copy files changed on or after that date. You can also use this option without specifying a specific date to copy only those files in source that are newer than the same files that already exist in destination. This is helpful when using the xcopy command to perform regular file backups.
xcopy /SI %XCPYOptions% %exclude% "%fromDir%\base_root\*" "%toDir%\*"

if not "%ERRORLEVEL%"=="0" (
	echo --------------------------------------------
	echo ERROR xcopy /SI %XCPYOptions% %exclude% "%fromDir%\base_root\*" "%toDir%\*"
	echo In Base.bat 1 the error code of xcopy was: %ERRORLEVEL%
	echo(
	echo Create a SCREENSHOT of this window and contact the developers on www.gtaforums.com
	SET /P a=Press enter ...
	EXIT
)


REM The buildIMGarchives creates .img files in the folder SAxVCxLC_source\base\models from the files in the folders ending with _img_src. 
REM GitHub does not allow to upload the full img files. Also the idea of GitHub is to work with smaller files, so that individual files can be easily updated and tracked without causing much data traffic and storage.
REM Attention buildIMGarchives.bat requires that some files were already copied from base_root
call buildIMGarchives.bat

if "%useModLoader%"=="1" (
	REM Prepare directories
	mkdir "%toDir%\modloader"
	mkdir "%toDir%\modloader\SAxVCxLC"
	mkdir "%toDir%\modloader\SAxVCxLC\models"
	mkdir "%toDir%\modloader\SAxVCxLC\data"
	REM Copy files and folders
	xcopy /SI %XCPYOptions% %exclude% "%fromDir%\base\*" "%toDir%\modloader\SAxVCxLC\*"
) else (
	xcopy /SI %XCPYOptions% %exclude% "%fromDir%\base\*" "%toDir%\*"
)

if not "%ERRORLEVEL%"=="0" (
	echo --------------------------------------------
	echo ERROR xcopy /SI %XCPYOptions% %exclude% "%fromDir%\base_root\*" "%toDir%\*"
	echo In Base.bat 2 the error code of xcopy was: %ERRORLEVEL%
	echo(
	echo Create a SCREENSHOT of this window and contact the developers on www.gtaforums.com
	SET /P a=Press enter ...
	EXIT
)

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
	echo This message comes from toolsForInstallation\Base.bat
	echo(
	echo Please take a screenshot of this window and inform the developers of SAxVCxLC on www.gtaforums.com about this problem.
	SET /P a=Press enter to exit...
exit


REM SET /P a=Press enter...
