@echo off
echo -----------------------
echo This is Base.bat
echo XCopy options: %1
echo Use ModLoader: %2
echo GTASAroot: %3
echo.
set XCPYOptions=%1
set useModLoader=%2
set fromDir=%CD%\SAxVCxLC_source
set toDir=%3
set toDir=%toDir:"=%
echo fromDir=%fromDir%
echo toDir=%toDir%
set exclude=/EXCLUDE:%CD%\toolsForInstallation\xcopy_exclude.txt

REM Some xcopy options.
REM S= Use this option to copy directories, subdirectories, and the files contained within them, in addition to the files in the root of source. Empty folders will not be recreated.
REM I= Use this option to show a list of the files and folders to copied... but no copying is actually done. The /l option is useful if you're building a complicated xcopy command with several options and you'd like to see how it would function hypothetically.
REM Y= Use this option to stop the xcopy command from prompting you about overwriting files from source that already exist in destination.
REM D=  Use the xcopy command with /d option and a specific date, in MM-DD-YYYY format, to copy files changed on or after that date. You can also use this option without specifying a specific date to copy only those files in source that are newer than the same files that already exist in destination. This is helpful when using the xcopy command to perform regular file backups.

if "%useModLoader%"=="1" (
	REM echo ModLoader version is not implemented yet. TODO update Standard.bat.
	echo Copy essential scripts
    mkdir "%toDir%\modloader\SAxVCxLC"
	mkdir "%toDir%\modloader\SAxVCxLC\models"
	mkdir "%toDir%\modloader\SAxVCxLC\data"
	 copy     %XCPYOptions% "%fromDir%\base\models\gta3_img_changes.txt" "%toDir%\models\gta3_img_changes.txt"	
	xcopy     %XCPYOptions% %exclude% "%fromDir%\base\*"        "%toDir%\*"
	xcopy /SI %XCPYOptions% %exclude% "%fromDir%\base\models\*" "%toDir%\modloader\SAxVCxLC\models\*"	
	xcopy /SI %XCPYOptions% %exclude% "%fromDir%\base\data\*"   "%toDir%\modloader\SAxVCxLC\data\*"	
) else (
	xcopy /SI %XCPYOptions% %exclude% "%fromDir%\base\*" "%toDir%\*"
)

REM SET /P a=Press a key...