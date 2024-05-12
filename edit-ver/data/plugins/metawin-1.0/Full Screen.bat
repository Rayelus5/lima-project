@shift /0
@echo off
title Full Screen
setlocal enabledelayedexpansion

set filecontent=appColor.dat
for /f "delims=" %%a in (appColor.dat) do (
  set currentline=%%a
  set color=!currentline!
)

color %color%
echo Iniciar en pantalla completa?
pause>nul
start /max MetaWin.bat
:: start /max MetaWin.exe
exit