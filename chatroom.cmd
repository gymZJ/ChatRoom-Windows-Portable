@echo off
setlocal
set "NODE=%~dp0node.exe"
set "CLI=%~dp0app\dist\cli\index.js"

if not "%~1"=="" (
  "%NODE%" "%CLI%" %*
  exit /b %errorlevel%
)

if not exist "%APPDATA%\ChatRoom\config.json" (
  "%NODE%" "%CLI%" init || exit /b 1
  start "" http://127.0.0.1:8765
)

"%NODE%" "%CLI%" serve
