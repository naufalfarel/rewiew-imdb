@echo off
echo ========================================
echo Setting up Python Virtual Environment
echo ========================================
echo.

REM Check if Python is installed
python --version >nul 2>&1
if errorlevel 1 (
    echo ERROR: Python is not installed or not in PATH
    echo Please install Python 3.11 or later from https://www.python.org/
    pause
    exit /b 1
)

echo Python found:
python --version
echo.

REM Create virtual environment if it doesn't exist
if not exist "venv" (
    echo Creating virtual environment...
    python -m venv venv
    echo Virtual environment created!
) else (
    echo Virtual environment already exists.
)
echo.

REM Activate virtual environment
echo Activating virtual environment...
call venv\Scripts\activate.bat

REM Upgrade pip
echo Upgrading pip...
python -m pip install --upgrade pip
echo.

REM Install dependencies
echo Installing Python dependencies...
pip install -r requirements.txt
echo.

echo ========================================
echo Setup completed successfully!
echo ========================================
echo.
echo To activate the virtual environment manually, run:
echo   venv\Scripts\activate.bat
echo.
echo To deactivate, run:
echo   deactivate
echo.

pause

