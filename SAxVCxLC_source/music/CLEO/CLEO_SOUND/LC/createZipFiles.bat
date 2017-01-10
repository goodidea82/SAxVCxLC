@echo off

REM The mp3 files are zipped with, for example,
REM SAxVCxLC\toolsForInstallation\7z\7z.exe a -pSAxVCxLC EMOTI EMOTI.mp3
REM for /f %%f in ('dir /b "%CD%\*.mp3"') do echo %%f
REM for /f %%f in ('dir /b "%CD%\*.mp3"') do echo %%~nf
REM for /f %%f in ('dir /b "%CD%\*.mp3"') do (..\..\..\..\..\toolsForInstallation\7z\7z.exe a -pSAVCLC %%~nf.7z  %%f )
REN *.mp3 *.ppt
for /f %%f in ('dir /b "%CD%\*.ppt"') do (..\..\..\..\..\toolsForInstallation\7z\7z.exe a -pSAVCLC %%~nf.7z  %%f )
REN *.ppt *.mp3

REM The can be unzipped with
REM SAxVCxLC\toolsForInstallation\7z\7z.exe e -pSAxVCxLC *.7z

SET /P a=Press a key...