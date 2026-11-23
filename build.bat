@echo off
chcp 65001 >nul
cd /d "%~dp0"
echo Installing dependencies...
python -m pip install -r requirements.txt
if errorlevel 1 (
  pause
  exit /b 1
)
echo Building MyVibe Launcher EXE...
python -m PyInstaller --noconfirm --clean --windowed --name "MyVibe Launcher" --collect-all customtkinter --collect-all minecraft_launcher_lib src\main.py
if errorlevel 1 (
  pause
  exit /b 1
)
echo.
echo Done! EXE: dist\MyVibe Launcher\MyVibe Launcher.exe
pause
