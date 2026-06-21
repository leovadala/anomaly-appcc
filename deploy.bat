@echo off
cd /d C:\Users\leova\Desktop\ANOMALY\ANOMALY-APP
git add -A
git commit -m "deploy"
git push
npx vercel@latest --prod --yes
echo.
echo Deploy completado. Copiando alias...
for /f "tokens=*" %%i in ('npx vercel@latest ls --prod 2^>nul ^| findstr "anomaly-appcc"') do set LAST=%%i
echo Si el alias no se aplicó solo, correlo manualmente:
echo npx vercel@latest alias set [URL] anomaly-appcc.vercel.app
pause
