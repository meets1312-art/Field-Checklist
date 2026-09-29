@echo off
REM Serve the Field Checklist on http://localhost:8000 (Windows).
REM Usage: double-click start.bat, or run "start.bat 3000" for another port.
cd /d "%~dp0"
set PORT=%1
if "%PORT%"=="" set PORT=8000

echo Field Checklist running at: http://localhost:%PORT%
echo Press Ctrl+C to stop.

where py >nul 2>nul && (py -m http.server %PORT% & goto :eof)
where python >nul 2>nul && (python -m http.server %PORT% & goto :eof)
where npx >nul 2>nul && (npx --yes serve -l %PORT% . & goto :eof)

echo Neither Python nor Node.js was found. Install Python from https://www.python.org/downloads/
pause
