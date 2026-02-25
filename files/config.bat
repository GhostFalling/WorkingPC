@echo off
title Configuracion Valhala
:menu
cls
echo ===========================================
echo          Configuracion Valhala
echo ===========================================
echo 1. Guardar Conexion de Wifi
echo 2. Importar todos los perfiles desde C:\WiFiBackup
echo 4. Salir
echo ===========================================
set /p opt="Selecciona una opcion (1-4): "

if %opt%==1 goto saveWifi
if %opt%==2 goto importar
if %opt%==3 goto ver
if %opt%==4 goto salir

:saveWifi
cls
@REM netsh wlan show profiles
setlocal enabledelayedexpansion
set i=1
echo Profiles on interface Wi-Fi:
echo.
echo User profiles
echo -------------

@REM ciclo for coman optiene  las varables All User Profile
echo   All User Profile     : * (PARA TODOS LAS REDES)
for /f "tokens=*" %%a in ('netsh wlan show profiles ^| findstr /C:"All User Profile"') do (
    echo   %%a 
)
echo Para volver al menu    : exit
echo.
set /p opti="Escribe el Nombre wifi "
if %opti% == exit goto menu
if not exist "%~dp0wifi" mkdir "%~dp0wifi"
IF %opti% == * (
    netsh wlan export profile folder="%~dp0wifi" key=clear
    cls
    echo Se guardaron las todas redes Wi-Fi
    echo.
    echo.
) ELSE (
    netsh wlan export profile name="%opti%" folder="%~dp0wifi" key=clear
    cls
    echo se guardo %opti% 
    echo.
    echo.
)
pause
@REM if not exist /d "%~dp0\wifi" mkdir /d "%~dp0\wifi"
@REM netsh wlan export profile folder="C:\WiFiBackup" key=clear
@REM echo.
@REM echo [OK] Perfiles exportados en C:\WiFiBackup
@REM pause
goto menu

:importar
if not exist "C:\WiFiBackup" (
    echo [ERROR] No se encontro la carpeta C:\WiFiBackup
    pause
    goto menu
)
for %%f in (C:\WiFiBackup\*.xml) do (
    netsh wlan add profile filename="%%f" user=all
)
echo.
echo [OK] Importacion masiva completada.
pause
goto menu

:ver
netsh wlan show profiles
pause
goto menu

:salir
exit
