@shift /0
@echo off
setlocal enabledelayedexpansion
title Eliminar Registro

set filecontent=appColor.dat
for /f "delims=" %%a in (appColor.dat) do (
  set currentline=%%a
  set color=!currentline!
)

color %color%
echo Eliminar contenido de registro (log.txt)
pause>nul
cls
echo Se eliminara en 3 seg...
timeout>nul /nobreak 1
cls
echo Se eliminara en 2 seg...
timeout>nul /nobreak 1
cls
echo Se eliminara en 1 seg...
timeout>nul /nobreak 1
cd logs
echo. > log.txt
cls
echo Eliminado!
timeout>nul /nobreak 1
exit