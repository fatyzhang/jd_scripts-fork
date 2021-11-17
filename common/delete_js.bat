@echo off
SETLOCAL ENABLEDELAYEDEXPANSION

cd /d "%~dp0%"
cd ../
for /f "tokens=1 delims= " %%j in (./common/delete_list.txt) do (set var1=%%j
del !var1! /q /s /f /a >>del_records.txt
)

powershell wget -O jd_try.js https://raw.githubusercontent.com/LostInsight/jd_scripts/main/jd_try.js