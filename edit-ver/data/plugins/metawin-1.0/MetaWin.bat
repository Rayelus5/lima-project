@shift /0
@echo off
setlocal enabledelayedexpansion


::CONFIG:::::::::::::::::::::::::::::::::::::
set filecontent=configUser.dat
for /f "delims=" %%a in (configUser.dat) do (
  set currentline=%%a
  set user=!currentline!
)
set filecontent=configKey.dat
for /f "delims=" %%a in (configKey.dat) do (
  set currentline=%%a
  set pass=!currentline!
)
set filecontent=appVersion.dat
for /f "delims=" %%a in (appVersion.dat) do (
  set currentline=%%a
  set version=!currentline!
)
set filecontent=appColor.dat
for /f "delims=" %%a in (appColor.dat) do (
  set currentline=%%a
  set color=!currentline!
)
set filecontent=appCartera.dat
for /f "delims=" %%a in (appCartera.dat) do (
  set currentline=%%a
  set carteraSaldo=!currentline!
)
::::::::::::::::::::::::::::::::::::::::::::




:::::::::::PANTALLA DE CARGA:::::::::::
title MetaWin DESKTOP - version %version%
cls
color %color%
echo --------------------------------------- >> logs/log.txt
echo [INFO] Nuevo inicio del programa - %TIME% %DATE% >> logs/log.txt
echo MetaWin - version %version%          %TIME% %DATE%
echo -----------------------
echo (-) loading...
timeout>nul /nobreak 1
cls
echo MetaWin - version %version%          %TIME% %DATE%
echo -----------------------
echo (+) loading...
timeout>nul /nobreak 1
cls
echo MetaWin - version %version%          %TIME% %DATE%
echo -----------------------
echo (-) loading...
timeout>nul /nobreak 1
cls
echo MetaWin - version %version%          %TIME% %DATE%
echo -----------------------
echo (+) wait...
timeout>nul /nobreak 1
:::::::::::::::::::::::::::::::::::::::


:::::::::::VERIFICAR USUARIO:::::::::::
if exist userLoged.dat (
	
	goto log-in

	) else (
	cls
	echo MetaWin - version %version%          %TIME% %DATE%
	echo.
	echo Sign up
	echo ----------------------------------------------------
	goto sign-up

	)
:::::::::::::::::::::::::::::::::::::::


:::::::::::INICIAR SESIÓN:::::::::::
:log-in
title Login
cls
echo MetaWin - version %version%          %TIME% %DATE%
echo -----------------------
set /p checkPass=Password: 
if %pass% == %checkPass% (goto loged) else (goto login-error)

:loged
title Start MetaWin
echo [INFO] Nuevo inicio de sesión - %TIME% %DATE% >> logs/log.txt
cls
echo MetaWin - version %version%          %TIME% %DATE%
echo ----------------------------------------------------
echo Loged as %user%
echo.
echo [+] Iniciar
pause>nul
goto normal-start

:login-error
echo Incorrect Password
timeout>nul /nobreak 2
goto log-in
:::::::::::::::::::::::::::::::::::


:::::::::::REGISTRARSE:::::::::::
:sign-up
title Registrando Usuario
set /p user=Username: 
set /p pass=Password: 
:loop1
if "!user:~%count1%,1!" neq "" set /a "count1+=1" & goto loop1
:loop2
if "!pass:~%count2%,1!" neq "" set /a "count2+=1" & goto loop2
cls
echo MetaWin - version %version%          %TIME% %DATE%
echo.
echo Sign up
echo ----------------------------------------------------
echo Username: %user%, (%count1% characters)
echo Password: (%count2% characters)
echo # > userLoged.dat
echo %user% > configUser.dat
echo %pass% > configKey.dat
echo [INFO] Usuario registrado - %TIME% %DATE% >> logs/log.txt
echo [INFO] Más información en "configUser.dat" y "configKey.dat" >> logs/log.txt
echo.
pause
:::::::::::::::::::::::::::::::::


::::::::::::INICIANDO::::::::::::
:normal-start
title Starting MetaWin
cls
rem timeout>nul /nobreak 1
:::::::::::::::::::::::::::::::::




::::::::::::::MAIN:::::::::::::::
:main
cd C:\Users\Rayelus\Desktop\Escritorio\0-SOFTWARE\MetaWin
title Main Menu
cls
echo MetaWin - version %version%          %TIME% %DATE%
echo ----------------------------------------------------
echo [1] Desktop
echo [2] Options
echo [3] Exit
echo ----------------------------------------------------
CHOICE /M "Go: " /C:123
	IF ERRORLEVEL 3 GOTO exit-app
	IF ERRORLEVEL 2 GOTO options
	IF ERRORLEVEL 1 GOTO start-desktop
goto main
:::::::::::::::::::::::::::::::::


::::::::::::::EXIT:::::::::::::::
:exit-app
echo [1] Yes
echo [2] No
CHOICE /M "Are you sure?: " /C:12
	IF ERRORLEVEL 2 GOTO main
	IF ERRORLEVEL 1 GOTO exit-app-y
goto exit-app
:exit-app-y
cls
echo [INFO] Exit success - %TIME% %DATE% >> logs/log.txt
echo --------------------------------------- >> logs/log.txt
echo. >> logs/log.txt
cls
exit
::::::::::::::::::::::::::::::::::


:::::::::::::OPTIONS::::::::::::::
:options
cls
title Options
cls
echo MetaWin Options - v %version%
echo ----------------------------------------------------
echo [1] Change Username
echo [2] Change Password
echo [3] Change Color
echo [4] Delete account
echo [5] Back
echo ----------------------------------------------------
CHOICE /M "Go: " /C:12345
	IF ERRORLEVEL 5 GOTO main
	IF ERRORLEVEL 4 GOTO delete-account
	IF ERRORLEVEL 3 GOTO change-color
	IF ERRORLEVEL 2 GOTO change-pass
	IF ERRORLEVEL 1 GOTO change-user
goto options



::CHANGE USER
:change-user
echo [1] Yes
echo [2] No
CHOICE /M "Are you sure?: " /C:12
	IF ERRORLEVEL 2 GOTO options
	IF ERRORLEVEL 1 GOTO change-user-y
goto change-user
:change-user-y
echo Username: %user%
set /p newUser=New Username: 
echo %newUser% > configUser.dat
echo The username %user% has been changed to %newUser%
echo [INFO] Nuevo username (%newUser%) - %TIME% %DATE% >> logs/log.txt
set user=%newUser%
timeout>nul /nobreak 2
goto options



::CHANGE PASS
:change-pass
echo [1] Yes
echo [2] No
CHOICE /M "Are you sure?: " /C:12
	IF ERRORLEVEL 2 GOTO options
	IF ERRORLEVEL 1 GOTO change-pass-y
goto change-pass
:change-pass-y
set /p newPass=New Password: 
echo %newPass% > configKey.dat
echo The password has been changed to %newPass%
echo [INFO] Nueva contraseña - %TIME% %DATE% >> logs/log.txt
set pass=%newPass%
timeout>nul /nobreak 2
goto options



::CHANGE COLOR
:change-color
echo [1] Yes
echo [2] No
CHOICE /M "Are you sure?: " /C:12
	IF ERRORLEVEL 2 GOTO options
	IF ERRORLEVEL 1 GOTO change-color-y
goto change-color
:change-color-y
cls
echo -------------------------------------
echo 0 = Negro       8 = Gris
echo 1 = Azul        9 = Azul claro
echo 2 = Verde       A = Verde claro
echo 3 = Aguamarina  B = Aguamarina claro
echo 4 = Rojo        C = Rojo claro
echo 5 = Purpura     D = Purpura claro
echo 6 = Amarillo    E = Amarillo claro
echo 7 = Blanco      F = Blanco brillante
echo -------------------------------------
set colorBackground=nul
set/p colorBackground=Background Color: 
if %colorBackground%==nul (
	goto options
	) 
set colorText=nul
set/p colorText=Text Color: 
if %colorText%==nul (
	goto options
	) 
set color=%colorBackground%%colorText%
echo %color% > appColor.dat
echo Color changed
echo [INFO] Color cambiado a: %color% - %TIME% %DATE% >> logs/log.txt
color %color%
timeout>nul /nobreak 2
goto options



::DELETE ACCOUNT
:delete-account
cls
echo [1] Yes
echo [2] No
CHOICE /M "Are you sure?: " /C:12
	IF ERRORLEVEL 2 GOTO options
	IF ERRORLEVEL 1 GOTO delete-account-confirm
goto delete-account
:delete-account-confirm
	title Remove Account
	cls
	set /p checkPass=Password: 
	if %pass% == %checkPass% (goto delete-account-definitive) else (goto delete-account-error)
:delete-account-error
echo Incorrect Password
timeout>nul /nobreak 2
goto delete-account-confirm
:delete-account-definitive
cls
echo Deleting Account...
del configUser.dat, configKey.dat, userLoged.dat
timeout>nul /nobreak 1
echo [INFO] Cuenta eliminada - %TIME% %DATE% >> logs/log.txt
echo -------------------------------------------------------
echo.
echo Successful removal
timeout>nul /nobreak 1
start MetaWin.bat
:: start MetaWin.exe
exit
::::::::::::::::::::::::::::::::::



::::::::::::DESKTOP:::::::::::::::
:start-desktop
cd ./home
goto desktop

:desktop
title Desktop
cls
echo MetaWin - version %version%          %TIME% %DATE%
echo ----------------------------------------------------
dir /b
echo ----------------------------------------------------
echo [1] Abrir
echo [2] Crear Carpeta
echo [3] Crear Archivo
echo [4] Eliminar
echo [5] Back
echo ----------------------------------------------------
CHOICE /M "Do: " /C:12345
	IF ERRORLEVEL 5 GOTO desktop-back
	IF ERRORLEVEL 4 GOTO desktop-delete
	IF ERRORLEVEL 3 GOTO desktop-make-file
	IF ERRORLEVEL 2 GOTO desktop-make-directory
	IF ERRORLEVEL 1 GOTO desktop-open
goto desktop

:desktop-open
set openDirectory=admin
cls
echo MetaWin - version %version%          %TIME% %DATE%
echo ----------------------------------------------------
dir /b
echo ----------------------------------------------------
echo Open Directory
echo +--------------------------------------------------+
echo.
echo [+] PULSE ANY KEY TO BE ADMIN
echo.
echo +--------------------------------------------------+
echo Type "exit" to go back
echo ----------------------------------------------------
set /p openDirectory=Go to: 
if %openDirectory%==exit (
	goto desktop
) 
if %openDirectory%==admin (
	goto desktop-admin
) else (
	cd %openDirectory%
	goto desktop
)

:desktop-make-directory
set newDirectory=exit
cls
echo MetaWin - version %version%          %TIME% %DATE%
echo ----------------------------------------------------
dir /b
echo ----------------------------------------------------
echo Made Directory
echo Type "exit" to go back
echo ----------------------------------------------------
set /p newDirectory=Name: 
if %newDirectory%==exit (
	goto desktop
) else (
	md %newDirectory%
	goto desktop
)

:desktop-make-file
set newFile=exit
cls
echo MetaWin - version %version%          %TIME% %DATE%
echo ----------------------------------------------------
dir /b
echo ----------------------------------------------------
echo Made File
echo Type "exit" to go back
echo ----------------------------------------------------
set /p newFile=File: 
if %newFile%==exit (
	goto desktop
) else (
	cls 
	echo %newFile% - Text Editor [CRTL+C to exit]
	echo ----------------------------------------------------
	echo.
	copy con %newFile%
	goto desktop
)

:desktop-delete
set del=exit
cls
echo MetaWin - version %version%          %TIME% %DATE%
echo ----------------------------------------------------
dir /b
echo ----------------------------------------------------
echo Delete File
echo Type "exit" to go back
echo ----------------------------------------------------
set /p del=Delete: 
if %del%==exit (
	goto desktop
) else (
	rd /Q %del%
	del /Q %del%
	goto desktop
)

:desktop-back
cd ..
cls
goto desktop

:desktop-admin
cls
echo [ADMIN] MetaWin - v %version%
echo ----------------------------------------------------
echo.
tree /f
echo.
echo ----------------------------------------------------
echo [1] Abrir carpeta
echo [2] Abrir archivo
echo [3] Leer archivo
echo [4] Crear Carpeta
echo [5] Crear Archivo
echo [6] Eliminar
echo [7] Back
echo ----------------------------------------------------
CHOICE /M "Do: " /C:1234567
	IF ERRORLEVEL 7 GOTO desktop-back-admin
	IF ERRORLEVEL 6 GOTO desktop-delete-admin
	IF ERRORLEVEL 5 GOTO desktop-make-file-admin
	IF ERRORLEVEL 4 GOTO desktop-make-directory-admin
	IF ERRORLEVEL 3 GOTO desktop-read-file-admin
	IF ERRORLEVEL 2 GOTO desktop-open-file-admin
	IF ERRORLEVEL 1 GOTO desktop-open-admin
goto desktop-admin

:desktop-back-admin
cd ..
goto desktop-admin

:desktop-delete-admin
set del=exit
cls
echo [ADMIN] MetaWin - v %version%
echo ----------------------------------------------------
dir /b
echo ----------------------------------------------------
echo Delete File
echo Type "exit" to go back
echo ----------------------------------------------------
set /p del=Delete: 
if %del%==exit (
	goto desktop-admin
) else (
	rd /Q %del%
	del /Q %del%
	goto desktop-admin
)

:desktop-make-file-admin
set newFile=exit
cls
echo [ADMIN] MetaWin - v %version%
echo ----------------------------------------------------
dir /b
echo ----------------------------------------------------
echo Made File
echo Type "exit" to go back
echo ----------------------------------------------------
set /p newFile=File: 
if %newFile%==exit (
	goto desktop-admin
) else (
	cls 
	echo %newFile% - Text Editor [CRTL+C to exit]
	echo ----------------------------------------------------
	echo.
	copy con %newFile%
	goto desktop-admin
)

:desktop-make-directory-admin
set newDirectory=exit
cls
echo [ADMIN] MetaWin - v %version%
echo ----------------------------------------------------
dir /b
echo ----------------------------------------------------
echo Made Directory
echo Type "exit" to go back
echo ----------------------------------------------------
set /p newDirectory=Name: 
if %newDirectory%==exit (
	goto desktop-admin
) else (
	md %newDirectory%
	goto desktop-admin
)

:desktop-read-file-admin
set fileRead=exit
cls
echo [ADMIN] MetaWin - v %version%
echo ----------------------------------------------------
dir /b
echo ----------------------------------------------------
echo ReadFile
echo Type "exit" to go back
echo ----------------------------------------------------
set /p fileRead=Name: 
if %fileRead%==exit (
	goto desktop-admin
) else (
	cls
	echo %fileRead% 
	echo ----------------------------------------------------
	echo.
	type %fileRead%
	echo.
	pause
	goto desktop-admin
)

:desktop-open-file-admin
set openFile=exit
cls
echo [ADMIN] MetaWin - v %version%
echo ----------------------------------------------------
dir /b
echo ----------------------------------------------------
echo Open File
echo Type "exit" to go back
echo ----------------------------------------------------
set /p openFile=Go to: 
if %openFile%==exit (
	goto desktop-admin
) else (
	start %openFile%
	goto desktop-admin
)

:desktop-open-admin
set openDirectory=exit
cls
echo [ADMIN] MetaWin - v %version%
echo ----------------------------------------------------
dir /b
echo ----------------------------------------------------
echo Open Directory
echo Type "exit" to go back
echo ----------------------------------------------------
set /p openDirectory=Go to: 
if %openDirectory%==exit (
	goto desktop-admin
) 
if %openDirectory%==back (
	goto desktop
) else (
	cd %openDirectory%
	goto desktop-admin
)
::::::::::::::::::::::::::::::::::