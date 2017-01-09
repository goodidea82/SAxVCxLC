@echo off
echo -----------------------
echo This is MTA.bat.
echo XCopy option: %1
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

echo ERROR: MTA.bat is not implemented yet.
SET /P a=Press a key...