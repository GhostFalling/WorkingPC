@REM @echo off
@REM title Valhala
@REM @REM echo Valhala
@REM @REM py -m pip install pyautogui  
@REM pip install keyboard
@REM @REM pip install opencv-python numpy Pillow
@REM pip install pynput
@REM pause > nul
@echo off
title Valhala
:: Verificar si tenemos privilegios de administrador
net session >nul 2>&1
if %errorLevel% == 0 (
    echo [OK] Valhala
) else (
    echo [!] Solicitando permisos de administrador...
    powershell -Command "Start-Process -FilePath '%0' -Verb RunAs"
    exit /b
)

:: -----------------------------------------
:: AGREGANDO WIFI
:: -----------------------------------------

cd "%~dp0files\wifi"
for  %%f in (*.xml) do (
    netsh wlan add profile filename="%~dp0files\wifi\%%f" user=all
)
cls
netsh wlan show interfaces | findstr /C:"connected" >nul && echo Conectado a WIFI|| echo DESCONECTADO
timeout /t 7 /nobreak > nul
cd ..
cls

:: -----------------------------------------
:: AGREGANDO WIFI
:: -----------------------------------------
echo Instalando Office
@REM start /b cmd /c "office.bat"
start office.bat

pause