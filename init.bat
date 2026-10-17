@echo off
rem First-time setup after clone: Prism only sees folders with instance.cfg as instances.
cd /d "%~dp0"
if exist instance.cfg (
  echo instance.cfg already exists, nothing to do.
) else (
  for %%I in (.) do (
    echo [General]
    echo InstanceType=OneSix
    echo name=%%~nxI
  ) > instance.cfg
  echo Created instance.cfg. Restart Prism Launcher to see the instance.
)
pause
