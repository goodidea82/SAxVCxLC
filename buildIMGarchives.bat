@echo off

REM The buildIMGarchives creates .img files in the folder SAxVCxLC_source\base\models from the files in the folders ending with _img_src. 
REM The file is located here, so that developers of SAxVCxLC can easily update an .img archive and install it using copyOnlyNewerFiles.bat.
REM GitHub does not allow to upload the full img files. Also the idea of GitHub is to work with smaller files, so that individual files can be easily updated and tracked without causing much data traffic and storage.
set toolsForInstDir=%CD%\toolsForInstallation
set thisDir=%CD%
REM Take a look at the file SAxVCxLC_source\base\models\create_img_archives.txt to see which archives are create and from which source files.
if not exist "%CD%\SAxVCxLC_source\base\models\create_img_archives.txt" (
	echo ERROR: The tile is missing: "%CD%\SAxVCxLC_source\base\models\create_img_archives.txt"
	echo IMG archives will not be created.
	SET /P a=Press enter to continue...
)
"%toolsForInstDir%\fastman92ImgConsole32.exe" -script "%CD%\SAxVCxLC_source\base\models\create_img_archives.txt"
