@echo off
title InsightIQ Dashboard
cd /d "%~dp0"

if not exist ".venv\Scripts\python.exe" (
    echo InsightIQ virtual environment was not found.
    echo Create it first with: python -m venv .venv
    pause
    exit /b 1
)

echo Starting InsightIQ at http://127.0.0.1:8000/
start "InsightIQ Server - keep this window open" cmd /k ""%CD%\.venv\Scripts\python.exe" manage.py runserver 127.0.0.1:8000"
timeout /t 3 /nobreak >nul
start "" "http://127.0.0.1:8000/dashboard/"
