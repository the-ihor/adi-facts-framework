@echo off
setlocal enabledelayedexpansion

REM ADI Facts Framework Installation Script
REM Installs Claude Code slash commands to user's configuration directory

echo ADI Facts Framework - Installation
echo ===================================
echo.

set "SCRIPT_DIR=%~dp0"
set "SOURCE_DIR=%SCRIPT_DIR%claude-code-commands"
set "TARGET_DIR=%USERPROFILE%\.claude\commands"

REM Check if source directory exists
if not exist "%SOURCE_DIR%" (
    echo Error: Source directory not found: %SOURCE_DIR%
    exit /b 1
)

REM Create target directory if it doesn't exist
echo Creating target directory: %TARGET_DIR%
if not exist "%TARGET_DIR%" mkdir "%TARGET_DIR%"

REM Count files to install
set FILE_COUNT=0
for %%f in ("%SOURCE_DIR%\*.md") do (
    set /a FILE_COUNT+=1
)

if %FILE_COUNT%==0 (
    echo Error: No .md files found in %SOURCE_DIR%
    exit /b 1
)

echo Found %FILE_COUNT% command(s) to install
echo.

REM Copy all .md files
echo Installing commands...
copy "%SOURCE_DIR%\*.md" "%TARGET_DIR%\" >nul

if errorlevel 1 (
    echo Error: Failed to copy files
    exit /b 1
)

echo.
echo [92m✓[0m Installation complete!
echo.
echo Installed commands:
for %%f in ("%TARGET_DIR%\adi:facts:*.md") do (
    echo   %%~nxf
)
echo.
echo You can now use these commands in Claude Code:
echo   /adi:facts:add
echo   /adi:facts:verify
echo   /adi:facts:fix
echo   /adi:facts:read
echo   /adi:facts:remove
echo   /adi:facts:detect-conflict
echo.
pause
