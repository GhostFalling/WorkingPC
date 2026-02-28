@REM @echo off
@REM title Valhala
@REM net session >nul 2>&1
@REM if %errorLevel% neq 0 (
@REM     echo Solicitando privilegios de administrador...
@REM     powershell -Command "Start-Process -FilePath '%~f0' -Verb RunAs"
@REM     exit /b
@REM )
@REM :proce0
@REM cd /d "%~dp0"

@REM if not exist "setup.exe" (
@REM     echo ERROR: No se encuentra 'files\setup.exe' en %cd%
@REM     pause
@REM     exit /b
@REM )

@REM :: 4. Ejecución del instalador
@REM setup /configure config.xml

@REM if %errorlevel% neq 0 (
@REM     echo El instalador devolvió un error (Codigo: %errorlevel%).
@REM ) else (
@REM     echo Instalación completada con éxito.
@REM )

@REM cscript ospp.vbs /cachst:TRUE

@REM pause
@echo off
title Valhala
echo Instalando Office
cd /d "%~dp0"
tar -xf Ohook_Activation_AIO.zip
if not exist "setup.exe" (
    echo ERROR: No se encuentra 'files\setup.exe' en %cd%
    pause
    exit /b
)
setup /configure config.xml
taskkill /f /im Ohook_Activation_AIO.cmd
call Ohook_Activation_AIO.cmd
exit