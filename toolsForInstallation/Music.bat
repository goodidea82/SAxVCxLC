@echo off

echo -----------------------
echo This is Music.bat
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


REM This is a test for downloading a file using wget.exe. This can be removed.
REM if not exist "%fromDir%\music\CLEO\CLEO_SOUND\Static.mp3" (
REM     if not exist "%fromDir%\music\CLEO\CLEO_SOUND\Static.7z" (
REM	        toolsForInstallation\wget.exe --no-check-certificate  "https://www.dropbox.com/s/wffa3f47mcqdn19/STATIC.7z?dl=1" -O Static.7z
REM	    timeout /t 1
REM     move Static.7z "%fromDir%\music\CLEO\CLEO_SOUND\Static.7z"
REM    )
REM )

REM Only mp3 files are downloaded which do not exist yet. You have to delete the mp3 files to force download. The mp3 files are encrypted as z7 files.
REM Remark: At the end of the URLs you must change dl=0 to dl=1
call :downloadExtractMP3 "https://www.dropbox.com/s/wffa3f47mcqdn19/STATIC.7z?dl=1" \CLEO_SOUND Static

call :downloadExtractMP3 "https://www.dropbox.com/s/vu9v44x10t72i7a/CHAT.7z?dl=1" \CLEO_SOUND\LC CHAT
REM goto :skipFiles

call :downloadExtractMP3 "https://www.dropbox.com/s/98qcmxehbe7v2x1/CLASS.7z?dl=1" \CLEO_SOUND\LC CLASS
call :downloadExtractMP3 "https://www.dropbox.com/s/o4tkov5ldfvluxn/FLASHB.7z?dl=1" \CLEO_SOUND\LC FLASHB
call :downloadExtractMP3 "https://www.dropbox.com/s/l4ni8lbv01y6tfy/GAME.7z?dl=1" \CLEO_SOUND\LC GAME
call :downloadExtractMP3 "https://www.dropbox.com/s/4shytqra30uxatf/HEAD.7z?dl=0" \CLEO_SOUND\LC HEAD
call :downloadExtractMP3 "https://www.dropbox.com/s/6v47788zio6wnnn/KJAH.7z?dl=0" \CLEO_SOUND\LC KJAH
call :downloadExtractMP3 "https://www.dropbox.com/s/6v9ryo2v072b3ln/LIPS.7z?dl=0" \CLEO_SOUND\LC LIPS
call :downloadExtractMP3 "https://www.dropbox.com/s/pzd5f0yj1y39m9d/MSX.7z?dl=0" \CLEO_SOUND\LC MSX
call :downloadExtractMP3 "https://www.dropbox.com/s/2l2uu3fxrxgasbq/RISE.7z?dl=0" \CLEO_SOUND\LC RISE

call :downloadExtractMP3 "https://www.dropbox.com/s/amzzlguux7xatix/EMOTI.7z?dl=0" \CLEO_SOUND\VC EMOTI
call :downloadExtractMP3 "https://www.dropbox.com/s/u2bnb8nzgerahm2/ESPANT.7z?dl=0" \CLEO_SOUND\VC ESPANT
call :downloadExtractMP3 "https://www.dropbox.com/s/f9ietzg4277ncv8/FEVER.7z?dl=0" \CLEO_SOUND\VC FEVER
call :downloadExtractMP3 "https://www.dropbox.com/s/ojxxpi3hb2bafql/FLASH.7z?dl=0" \CLEO_SOUND\VC FLASH
call :downloadExtractMP3 "https://www.dropbox.com/s/goyz4ov1hxcbjs2/KCHAT.7z?dl=0" \CLEO_SOUND\VC KCHAT
call :downloadExtractMP3 "https://www.dropbox.com/s/h88u1yxnzw98shw/VCPR.7z?dl=0" \CLEO_SOUND\VC VCPR
call :downloadExtractMP3 "https://www.dropbox.com/s/0us4wejxo8r1q7t/VROCK.7z?dl=0" \CLEO_SOUND\VC VROCK
call :downloadExtractMP3 "https://www.dropbox.com/s/6grrcl1sad1ojvv/WAVE.7z?dl=0" \CLEO_SOUND\VC WAVE
call :downloadExtractMP3 "https://www.dropbox.com/s/zppiojkfhbi943t/WILD.7z?dl=0" \CLEO_SOUND\VC WILD

REM Downloading from GoogleDrive did not work for me, despite trying these instructions: http://unix.stackexchange.com/questions/136371/how-to-download-a-folder-from-google-drive-using-terminal
REM call :downloadExtractMP3 "https://drive.google.com/uc?export=download&id=0Bys8vEqMtLu-REN2dlAxSEFrS0k" \CLEO_SOUND Static

:skipFiles

REM goto :finish

REM Some xcopy options.
REM S= Use this option to copy directories, subdirectories, and the files contained within them, in addition to the files in the root of source. Empty folders will not be recreated.
REM I= Use this option to show a list of the files and folders to copied... but no copying is actually done. The /l option is useful if you're building a complicated xcopy command with several options and you'd like to see how it would function hypothetically.
REM Y= Use this option to stop the xcopy command from prompting you about overwriting files from source that already exist in destination.
REM D=  Use the xcopy command with /d option and a specific date, in MM-DD-YYYY format, to copy files changed on or after that date. You can also use this option without specifying a specific date to copy only those files in source that are newer than the same files that already exist in destination. This is helpful when using the xcopy command to perform regular file backups.
if "%useModLoader%"=="1" (
	REM set toDir=%toDir%\modloader\SAxVCxLC  WARNING using set in if-branch does not work
	REM http://stackoverflow.com/questions/9102422/windows-batch-set-inside-if-not-working
	xcopy /SI %XCPYOptions% %exclude% "%fromDir%\music\*" "%toDir%\modloader\SAxVCxLC\*"	
) else (
	xcopy /SI %XCPYOptions% %exclude% "%fromDir%\music\*" "%toDir%\*"	
)

if not "%ERRORLEVEL%"=="0" (
	echo --------------------------------------------
	echo ERROR xcopy /SI %XCPYOptions% %exclude% "%fromDir%\base_root\*" "%toDir%\*"
	echo In Music.bat the error code of xcopy was: %ERRORLEVEL%
	echo Create a SCREENSHOT of this window and contact the developers on www.gtaforums.com
	echo(
	SET /P a=Press enter ...
	EXIT
)


REM cleanup
REM del SAxVCxLC_source\music\CLEO\CLEO_SOUND\*.mp3
REM del SAxVCxLC_source\music\CLEO\CLEO_SOUND\VC\*.mp3
REM del SAxVCxLC_source\music\CLEO\CLEO_SOUND\LC\*.mp3

:finish
REM SET /P a=Press enter...

exit /b

REM ===========================
REM This is a helper function that performs the download, extracts music files, and copies them to subfolders of SAxVCxLC_source\music\CLEO.
:downloadExtractMP3
set dwLink=%1
set folder=%2
set fileName=%3
set PW=-pSAVCLC

REM enabledelayedexpansion is needed so that "!ERRORLEVEL!" will be evaluated just in time.
setlocal enabledelayedexpansion

REM first check if the mp3 file already exists in the music folder
if not exist "%fromDir%\music\CLEO%folder%\%fileName%.mp3" (
		
		REM The mp3 is encrypted in a .z7 file of the download link %dwLink%. Download the file .7z file if it does not exist.
		if not exist "%fileName%.7z" (
			toolsForInstallation\wget.exe  --no-check-certificate %dwLink% -O %fileName%.7z
			if not exist "%fileName%.7z" (
				echo ------------------------------
				echo ERROR Problem 1. Could not download or create "%fileName%.7z" ^(containing "%fileName%.mp3"^). Solution: Check the download links in toolsForInstallation\Music.bat
				goto :exitWithError
			)
		)
		REM Check if the mp3 file exists in the 7z file. (If not, it is renamed/shadowed or there is another problem)
		toolsForInstallation\7z\7z.exe l %fileName%.7z | find "%fileName%.mp3"
		REM If the check was successful, then errorlevel of FIND is 0!
		echo Check if mp3 is in z7. Errorlevel=!ERRORLEVEL!
		if not "!ERRORLEVEL!"=="0" (
			REM Check if the filename exists as a .ppt file.
			toolsForInstallation\7z\7z.exe l %fileName%.7z | find "%fileName%.ppt"
			REM If the check was successful, then errorlevel of FIND is 0!
			echo Check if ppt is in z7. Errorlevel=!ERRORLEVEL!
			if "!ERRORLEVEL!"=="0" (
				REM The file exists as ppt file. So rename it to mp3.
				toolsForInstallation\7z\7z.exe rn %fileName%.7z "%fileName%.ppt" "%fileName%.mp3"
			) else (
				toolsForInstallation\7z\7z.exe l %fileName%.7z
				echo ----------------------------
				echo ERROR Problem 2. After downloading "%fileName%.7z" could not find "%fileName%.ppt" nor "%fileName%.mp3" in the "%fileName%.7z" archive. 
				goto :exitWithError			
			)
			
		)

		REM Check again if the mp3 file exists in the 7z file. This time it must exist.
		toolsForInstallation\7z\7z.exe l %fileName%.7z | find "%fileName%.mp3"
		REM If the check was successful, then errorlevel of FIND is 0!
		echo Check again if mp3 is in z7. Errorlevel=!ERRORLEVEL!		
		if not "!ERRORLEVEL!"=="0" (
			echo ------------------------------
			echo ERROR Problem 3. Did not find "%fileName%.mp3" inside the "%fileName%.7z" archive after trying to rename "%fileName%.ppt" to "%fileName%.mp3" inside the "%fileName%.7z" archive.
			echo(
			echo Perhaps an Anti-Virus program prevented this. Try to configure the Anti-Virus program to ignore the folder SAxVCxLC during this installation. If nothing helps, then contact the developers of SAxVCxLC.
			SET /P a=Press enter to exit...
			exit
		)
		
		REM extract and decrypt the .7z file. The P_a_s s. W o_r_d is specified in %PW% above
        toolsForInstallation\7z\7z.exe e %PW% %fileName%.7z
		if not exist "%fileName%.mp3" (
			echo ----------------------------
			echo ERROR Problem 4. After extracting "%fileName%.7z" the file "%fileName%.mp3" was expected but does not exist. The files are
			dir
			goto :exitWithError
		)
		
		
		if not exist "%fromDir%\music\CLEO%folder%" (
			mkdir "%fromDir%\music\CLEO%folder%"
		)
		REM Copy the file where it belongs
		move %fileName%.mp3 "%fromDir%\music\CLEO%folder%\%fileName%.mp3"

		if not exist "%fromDir%\music\CLEO%folder%\%fileName%.mp3" (
			echo -------------------------
			echo ERROR Problem 5. Copying "%fileName%.7z" to "%fromDir%\music\CLEO%folder%\%fileName%.mp3" has failed.
			goto :exitWithError
		)
		
		REM cleanup not needed file.
		del %fileName%.7z		
) else (
	echo Skipping download, the file "%fileName%.mp3" already exists.
)
exit /b


:exitWithError
	echo This message comes from toolsForInstallation\Music.bat
	echo(
	echo Please take a screenshot of this window and inform the developers of SAxVCxLC on www.gtaforums.com about this problem.
	SET /P a=Press enter to exit...
exit

