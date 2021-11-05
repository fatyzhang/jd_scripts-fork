@echo off
SETLOCAL ENABLEDELAYEDEXPANSION
cd /d "%~dp0%"
cd ../
for /f "tokens=1 delims= " %%j in (./common/delete_list.txt) do (set var1=%%j
del !var1! /q /s /f /a >>del_records.txt
)