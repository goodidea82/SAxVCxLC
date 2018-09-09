@echo off


REM %~dp0 refers to the full path to the batch file's directory (static)
REM When running as administrator, the directory gets lost and we have to change back to the SAxVCxLC directory.
set prevDir=%CD%
cd %~dp0

echo This script updates SAxVCxLC from GitHub, and then calls copyOnlyNewerFiles.bat so that your gta ^+ SAxVCxLC INSTALLATION gets updated. The script works only if you have installed a GIT client and SAxVCxLC was cloned ^(downloaded^) using the GIT client and not downloaded as a zip file.

echo ---------------------

REM Check if git is installed
where git.exe
IF %ERRORLEVEL% NEQ 0 (
	echo ERROR: git.exe not found. You must install a git client first.
	echo You can download it here: https://git-scm.com/download/win
	SET /P a=Press a key to exit...
	exit /b
)

if not exist .git (
	echo The folder .git was not found. You have probably downloaded SAxVCxLC as a ZIP-file instead of using the GIT client. Delete this zip-file and use GIT to download SAxVCxLC from GitHub again:
	echo 1. Create a folder where you want to clone ^(download^) SAxVCxLC
	echo 2. Run git-bash.exe and do the following commands in git-bash.exe
	echo 3.   cd "PATH TO THE FOLDER FROM STEP 1"
	echo 4.   git clone "https://github.com/goodidea82/SAxVCxLC.git"
	echo 5. Go to that folder and run Install.bat again on a fresh copy of GTA.
	echo The Readme contains more detailed information and a link to an example on www.gtaforums.com
	SET /P a=Press a key to exit...
	exit /b	
)

if not exist InstallSettings.bat (
	echo InstallSettings.bat not found. Run Install.bat first to install SAxVCxLC.
	SET /P a=Press a key...
	EXIT /b
)

echo Calling git.exe pull ...
REM update from git
call git.exe pull

echo -----------------
echo Calling copyOnlyNewerFiles.bat ...
call copyOnlyNewerFiles.bat
