@echo off
setlocal EnableExtensions
title iOS Insight - Publish source to GitHub

set "REPO_URL=https://github.com/miserymart58-del/ios-insight.git"
set "ZIP=%~1"
if "%ZIP%"=="" set "ZIP=%~dp0ios-insight-full-usb(1).zip"

where git >nul 2>nul
if errorlevel 1 (
  echo Git for Windows is required. Install it from https://git-scm.com/download/win
  pause
  exit /b 1
)

if not exist "%ZIP%" (
  echo Source ZIP not found:
  echo %ZIP%
  echo.
  echo Put the ZIP beside this script or drag the ZIP onto this BAT file.
  pause
  exit /b 1
)

set "WORK=%TEMP%\ios-insight-publish-%RANDOM%%RANDOM%"
mkdir "%WORK%" || exit /b 1

echo [1/5] Extracting the supplied source archive...
powershell -NoProfile -ExecutionPolicy Bypass -Command "Expand-Archive -LiteralPath $env:ZIP -DestinationPath '%WORK%\source' -Force"
if errorlevel 1 goto :fail

set "SOURCE=%WORK%\source\ios-insight"
if not exist "%SOURCE%\pyproject.toml" (
  echo Could not find ios-insight\pyproject.toml inside the ZIP.
  goto :fail
)

echo [2/5] Cloning %REPO_URL% ...
git clone --branch main "%REPO_URL%" "%WORK%\repo"
if errorlevel 1 goto :fail

echo [3/5] Copying project files into the repository...
robocopy "%SOURCE%" "%WORK%\repo" /E /XD .git .venv __pycache__ /XF *.pyc >nul
if errorlevel 8 goto :fail

echo [4/5] Creating commit...
pushd "%WORK%\repo"
git add -A
git diff --cached --quiet
if not errorlevel 1 (
  echo No source changes to publish.
  popd
  goto :success
)
git commit -m "feat: import complete iOS Insight USB diagnostics application"
if errorlevel 1 (
  popd
  goto :fail
)

echo [5/5] Pushing to GitHub...
git push origin main
if errorlevel 1 (
  popd
  goto :fail
)
popd

:success
echo.
echo SUCCESS: source project published to:
echo https://github.com/miserymart58-del/ios-insight
echo.
echo GitHub Actions will run the repository checks if workflows are enabled.
rmdir /s /q "%WORK%" >nul 2>nul
pause
exit /b 0

:fail
echo.
echo Publishing did not complete. Check the error above.
echo Temporary files: %WORK%
pause
exit /b 1
