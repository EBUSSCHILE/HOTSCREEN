@echo off
setlocal enabledelayedexpansion

REM Obtener la versión actual y la frase informativa del README.md
for /f "tokens=2,*" %%a in ('findstr /B "# HotScreen" README.md') do (
    set "version=%%a"
    set "info_phrase=%%b"
    goto :found_version
)
:found_version

REM Eliminar las comillas de la frase informativa
set "info_phrase=!info_phrase:"=!"

echo Versión actual: !version!
echo Frase informativa: !info_phrase!
echo.
echo Etiqueta completa: HotScreen - !version! !info_phrase!
set /p confirm=¿Es correcta esta etiqueta? (Y/N): 

if /i "%confirm%" neq "Y" (
    echo Proceso cancelado por el usuario.
    exit /b 1
)

REM Actualizar la rama master
git add .
git commit -m "Update to HotScreen - !version! !info_phrase!"
git push origin master

REM Crear y pushear el tag
git tag -a "!version!" -m "HotScreen - !version! !info_phrase!"
git push origin "!version!"

echo Actualización completada y tag creado: HotScreen - !version! !info_phrase!