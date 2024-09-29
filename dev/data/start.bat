@echo off
color a

:main
cls
echo Lima32
echo ----------------------------------------------------
echo *                                                  *
echo *                       MENU                       *
echo *                   -------------                  *
echo *                    1-Metawin                     *
echo *                    2-FastIPScan                  *
echo *                    3-FastKEYLogger               *
echo *                    4-FastPSWord                  *
echo *                    5-FastPWOff                   *
echo *                    6-Scripts                     *
echo *                    7-Exit                        *
echo *                                                  *
echo *                                                  *
echo *                                                  *
echo ----------------------------------------------------
CHOICE /M "Ir a:" /C:1234567
	
	IF ERRORLEVEL 7 (
		exit
	)

    IF ERRORLEVEL 6 (
		goto scripts
		)
	
	IF ERRORLEVEL 5 (
		goto fastpwoff
	)

	IF ERRORLEVEL 4 (
		goto fastpsword
		)
	
	IF ERRORLEVEL 3 (
		goto fastkeylogger
	)
	
	IF ERRORLEVEL 2 (
		goto fastipscan
	)
	
	IF ERRORLEVEL 1 (
		goto metawin
	)

:metawin
cls
cd plugins/metawin-1.0
start MetaWin.exe
cd ..
cd ..
goto main

:fastipscan
cls
cd plugins/fastipscan-1.0
start FastIPScan.bat
cd ..
cd ..
goto main