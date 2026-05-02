@echo off
chcp 65001 >nul
cd /d "%~dp0"

echo.
echo ========================================
echo  Деплой Meal Planner на GitHub Pages
echo ========================================
echo.

echo [1/4] Проверка изменений...
git status --short
if errorlevel 1 goto :error

echo.
echo [2/4] Добавление файлов...
git add .
if errorlevel 1 goto :error

echo.
echo [3/4] Коммит (введите сообщение или нажмите Enter для авто)...
set /p MSG="Сообщение: "
if "%MSG%"=="" set MSG=Update %date% %time%
git commit -m "%MSG%"
if errorlevel 1 (
    echo.
    echo Нечего коммитить — все изменения уже зафиксированы.
    pause
    exit /b 0
)

echo.
echo [4/4] Пуш на GitHub...
git push origin main
if errorlevel 1 goto :error

echo.
echo ========================================
echo  ✓ Готово! GitHub Pages пересоберётся
echo    через 1-2 минуты по адресу:
echo    https://lp6sapphire.github.io/Meal_planner/
echo ========================================
echo.
pause
exit /b 0

:error
echo.
echo ❌ Ошибка. Проверь вывод выше.
pause
exit /b 1
