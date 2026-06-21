@echo off
chcp 65001 >nul
echo ========================================
echo        ANOMALY - DEPLOY
echo ========================================
echo.

cd /d C:\Users\leova\Desktop\ANOMALY\ANOMALY-APP

echo [1/4] Git add...
git add -A
if %ERRORLEVEL% NEQ 0 (echo ERROR en git add & pause & exit /b)

echo [2/4] Git commit...
git commit -m "deploy" 2>&1
echo (si dice nothing to commit esta bien, continua)

echo [3/4] Git push...
git push
if %ERRORLEVEL% NEQ 0 (echo ERROR en git push & pause & exit /b)

echo [4/4] Vercel deploy...
npx vercel@latest --prod --yes 2>&1

echo.
echo ========================================
echo RECORDA: copiar la URL del deploy arriba
echo y correr:
echo npx vercel@latest alias set [URL] anomaly-appcc.vercel.app
echo ========================================
pause
