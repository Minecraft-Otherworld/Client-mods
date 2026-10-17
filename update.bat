@echo off
rem Update: pull mods, configs and icon from the repo.
cd /d "%~dp0"
git pull || (pause & exit /b 1)
call "%~dp0init.bat"
