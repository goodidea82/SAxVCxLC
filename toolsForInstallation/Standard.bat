@echo off

echo -----------------------
echo This is Standard.bat
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

REM The installation script uses xcopy to install files. Some files that should not be copied are specified in xcopy_exclude.txt.  For example folders of the form "_img_src" and ".7z" files.
REM xcopy requires that the full path is provided to xcopy_exclude and that no spaces are used in the path. See here: http://stackoverflow.com/questions/1333589/how-do-i-transform-the-working-directory-into-a-8-3-short-file-name-using-batch
for %%A in ("%CD%\toolsForInstallation\xcopy_exclude.txt") do set exclude=%%~sA
set exclude=/EXCLUDE:%exclude%

echo exclude=%exclude%

call toolsForInstallation\Music.bat %1 %2 %3

call toolsForInstallation\Base.bat %1 %2 %3

REM ------------------------------------------
REM Install files from SAxVCxLC_source\extras
REM If modloader is used then the extras are copied to GTASAroot\modloader\SAxVCxLC
REM Some xcopy options.
REM S= Use this option to copy directories, subdirectories, and the files contained within them, in addition to the files in the root of source. Empty folders will not be recreated.
REM I= Use this option to show a list of the files and folders to copied... but no copying is actually done. The /l option is useful if you're building a complicated xcopy command with several options and you'd like to see how it would function hypothetically.
REM Y= Use this option to stop the xcopy command from prompting you about overwriting files from source that already exist in destination.
REM D=  Use the xcopy command with /d option and a specific date, in MM-DD-YYYY format, to copy files changed on or after that date. You can also use this option without specifying a specific date to copy only those files in source that are newer than the same files that already exist in destination. This is helpful when using the xcopy command to perform regular file backups.

xcopy /SI %XCPYOptions% %exclude% "%fromDir%\extras_root\*" "%toDir%\*"

if not "%ERRORLEVEL%"=="0" (
	echo --------------------------------------------
	echo ERROR xcopy /SI %XCPYOptions% %exclude% "%fromDir%\base_root\*" "%toDir%\*"
	echo In Standard.bat 1, the error code of xcopy was: %ERRORLEVEL%
	echo(
	echo Create a SCREENSHOT of this window and contact the developers on www.gtaforums.com
	SET /P a=Press enter ...
	EXIT
)

if "%useModLoader%"=="1" (
	REM http://stackoverflow.com/questions/9102422/windows-batch-set-inside-if-not-working
	xcopy /SI %XCPYOptions% %exclude% "%fromDir%\extras\*" "%toDir%\modloader\SAxVCxLC\*"
) else (
	xcopy /SI %XCPYOptions% %exclude% "%fromDir%\extras\*" "%toDir%\*"
)

if not "%ERRORLEVEL%"=="0" (
	echo --------------------------------------------
	echo ERROR xcopy /SI %XCPYOptions% %exclude% "%fromDir%\base_root\*" "%toDir%\*"
	echo In Standard.bat 2, the error code of xcopy was: %ERRORLEVEL%
	echo(
	echo Create a SCREENSHOT of this window and contact the developers on www.gtaforums.com
	SET /P a=Press enter ...
	EXIT
)

REM SET /P a=Press enter...