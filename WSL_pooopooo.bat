@echo off
title WSL Launcher

echo ============================
echo       WSL INDÍTÁSA
echo ============================
echo.

wsl.exe

if errorlevel 1 (
    echo.
    echo Hiba tortent a WSL inditasakor!
    pause
)

exit /b
