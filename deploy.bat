@echo off
chcp 65001 >nul
echo ========================================
echo        ANOMALY - DEPLOY
echo ========================================
echo.

cd /d C:\Users\leova\Desktop\ANOMALY\ANOMALY-APP

echo [1/5] Sincronizando con GitHub (git pull)...
git pull
if %ERRORLEVEL% NEQ 0 (echo ERROR en git pull & pause & exit /b)

echo [2/5] Git add...
git add -A
if %ERRORLEVEL% NEQ 0 (echo ERROR en git add & pause & exit /b)

echo [3/5] Git commit...
git commit -m "deploy" 2>&1
echo (si dice nothing to commit, esta bien, continua)

echo [4/5] Git push...
git push
if %ERRORLEVEL% NEQ 0 (echo ERROR en git push & pause & exit /b)

echo [5/5] Vercel deploy a produccion...
npx vercel@latest --prod --yes 2>&1
if %ERRORLEVEL% NEQ 0 (echo ERROR en vercel deploy & pause & exit /b)

echo.
echo ========================================
echo  DEPLOY COMPLETADO
echo  URL: https://anomaly-appcc.vercel.app
echo ========================================
pause
