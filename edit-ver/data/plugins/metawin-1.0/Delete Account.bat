@shift /0
@echo off
setlocal enabledelayedexpansion
title Eliminar Cuenta

if not exist configKey.dat (
  color c
  echo [i] No existe ninguna cuenta
  timeout>nul /nobreak 2
  exit
)

set filecontent=appColor.dat
for /f "delims=" %%a in (appColor.dat) do (
  set currentline=%%a
  set color=!currentline!
)

set filecontent=configKey.dat
for /f "delims=" %%a in (configKey.dat) do (
  set currentline=%%a
  set pass=!currentline!
)

color %color%
cls
echo [+] Eliminar cuenta de usuario
pause>nul
cls
:delete-account-confirm
cls
color b
set /p checkPass=Password: 
if %pass% == %checkPass% (goto delete-account-definitive) else (goto delete-account-error)
:delete-account-error
echo Incorrect Password
timeout>nul /nobreak 2
goto delete-account-confirm
:delete-account-definitive
color %color%
cls
echo Se eliminara en 3 seg...
timeout>nul /nobreak 1
cls
echo Se eliminara en 2 seg...
timeout>nul /nobreak 1
cls
echo Se eliminara en 1 seg...
timeout>nul /nobreak 1
del /Q configKey.dat, configUser.dat, userLoged.dat
cls
echo Eliminado!
timeout>nul /nobreak 1
exit