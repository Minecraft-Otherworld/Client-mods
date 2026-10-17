@echo off
rem Setup after clone: instance.cfg for Prism, instance icon, pack configs.
cd /d "%~dp0"
for %%I in (.) do set "NAME=%%~nxI"

if not exist instance.cfg (
  (
    echo [General]
    echo InstanceType=OneSix
    echo name=%NAME%
    echo iconKey=%NAME%
  ) > instance.cfg
  echo Created instance.cfg. Restart Prism Launcher to see the instance.
)

rem Prism keeps icons in <launcher>\icons, iconKey is the file name without extension.
if exist icon.png (
  if not exist ..\..\icons mkdir ..\..\icons
  copy /y icon.png "..\..\icons\%NAME%.png" >nul
)

if exist config_copy xcopy config_copy minecraft\config\ /e /i /y /q >nul
echo Done.
pause
