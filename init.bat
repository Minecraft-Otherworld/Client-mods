@echo off
chcp 65001 >nul
rem Setup after clone: instance.cfg for Prism, instance icon, pack configs.
rem Close the launcher first: it overwrites instance.cfg on exit.
cd /d "%~dp0"
for %%I in (.) do set "NAME=%%~nxI"

if not exist instance.cfg (
  (
    echo [General]
    echo InstanceType=OneSix
    echo name=%NAME%
  ) > instance.cfg
  echo Created instance.cfg.
)

rem Prism only loads icons from <launcher>\icons, iconKey is the file name without extension.
if exist icon.png (
  if not exist ..\..\icons mkdir ..\..\icons
  copy /y icon.png "..\..\icons\%NAME%.png" >nul
  findstr /x /c:"iconKey=%NAME%" instance.cfg >nul || powershell -NoProfile -Command ^
    "$f = Join-Path $PWD 'instance.cfg';" ^
    "$c = [IO.File]::ReadAllLines($f) | Where-Object { $_ -notmatch '^iconKey=' };" ^
    "[IO.File]::WriteAllLines($f, ($c -replace '^\[General\]$', \"[General]`niconKey=$env:NAME\"))"
)

if exist config_copy xcopy config_copy minecraft\config\ /e /i /y /q >nul
echo Done. Restart Prism Launcher to see the changes.
pause
