@echo off

set toolsForInstDir=%CD%\toolsForInstallation
set thisDir=%CD%
cd "%GTASAroot%\models"
"%toolsForInstDir%\fastman92ImgConsole32.exe" -script "%CD%\SAxVCxLC_source\base\models\create_img_archives.txt"
cd "%thisDir%"

SET /P a=Press a key to quit...