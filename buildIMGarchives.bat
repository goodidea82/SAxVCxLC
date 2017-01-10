@echo off

REM The buildIMGarchives creates .img files in the folder SAxVCxLC_source\base\models from the files in the folders ending with _img_src. 
REM The file is located here, so that developers of SAxVCxLC can easily update an .img archive and install it using copyOnlyNewerFiles.bat.
REM GitHub does not allow to upload the full img files. Also the idea of GitHub is to work with smaller files, so that individual files can be easily updated and tracked without causing much data traffic and storage.
set toolsForInstDir=%CD%\toolsForInstallation
set thisDir=%CD%

call :conditionallyUpdateIMG colls
call :conditionallyUpdateIMG liberty
call :conditionallyUpdateIMG newADD
call :conditionallyUpdateIMG paths
call :conditionallyUpdateIMG radar24000
call :conditionallyUpdateIMG vclcVeh
call :conditionallyUpdateIMG vice

REM SET /P a=Press enter to quit...

exit /b

REM ---------------------------------
:conditionallyUpdateIMG
REM Check if img archive needs to be updated.
set archiveName=%1
set imgDir=%thisDir%\SAxVCxLC_source\base\models

if not exist "%imgDir%\%archiveName%.img" (
	echo %archiveName%.img does not exist yet. Will create it.
	goto :updateIMG
)

REM If the archive already exists, then tind the newest file in the _img_src folder and the .img archive itself. The newest file will be returned.
REM See: http://ss64.com/nt/dir.html  
for /f "tokens=*" %%a in ('dir "%imgDir%\%archiveName%_img_src" /S /T:W /b /o:d') do set newestInDir=%%a
echo Newest file:%newestInDir%
REM Get the time stamps
FOR %%i IN (%newestInDir%) DO SET DATE1=%%~ti
echo DATE1=%DATE1%
FOR %%i IN ("%imgDir%\%archiveName%.img") DO SET DATE2=%%~ti
echo DATE2=%DATE2%
REM If the newest file is the .img archive (newer than any file in the _img_src folder), then updating is not needed.
if "%DATE1%" LEQ "%DATE2%" (
	echo %archiveName%.img is up-to-date ^(Warning: timestamp uses minutes for comparison^)
	exit /b
) else (
	echo %archiveName%.img is not up-to-date and will be updated...
)

:updateIMG
REM Take a look at the file SAxVCxLC_source\base\models\create_img_archives.txt to see which archives are create and from which source files.
if not exist "%imgDir%\create_img_archive_%archiveName%.txt" (
	echo ERROR: The tile is missing: "%imgDir%\create_img_archive_%archiveName%.txt"
	echo %archiveName%.img will not be created.
	SET /P a=Press enter to continue...
	exit /b
)
if exist "%imgDir%\%archiveName%.img" (
	del "%imgDir%\%archiveName%.img"
)
"%toolsForInstDir%\fastman92ImgConsole32.exe" -script "%imgDir%\create_img_archive_%archiveName%.txt"

exit /b

