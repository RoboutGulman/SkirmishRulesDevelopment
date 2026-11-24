@echo off
setlocal

echo =====================================================================
echo  GANG SHOWDOWN -- BUILDING ALL RULEBOOKS
echo =====================================================================

set "TYPST_BIN=typst"
if exist "C:\Users\Alexey\Typst\bin\typst.exe" (
    set "TYPST_BIN=C:\Users\Alexey\Typst\bin\typst.exe"
)

if not exist "release" mkdir "release"

echo.
echo [1/3] Compiling Book 1: Core Rules...
"%TYPST_BIN%" compile --root . books\01_core_rules\main.typ release\Gang_Showdown_01_Core_Rules.pdf
if %ERRORLEVEL% NEQ 0 (
    echo [ERROR] Failed to compile Book 1!
    echo [NOTE] If Gang_Showdown_01_Core_Rules.pdf is currently open in Adobe Acrobat or a PDF viewer, please close it to allow overwriting.
    exit /b %ERRORLEVEL%
)
echo [OK] release\Gang_Showdown_01_Core_Rules.pdf ready.

echo.
echo [2/3] Compiling Book 2: Gang Creation...
"%TYPST_BIN%" compile --root . books\02_gang_creation\main.typ release\Gang_Showdown_02_Gang_Creation.pdf
if %ERRORLEVEL% NEQ 0 (
    echo [ERROR] Failed to compile Book 2!
    echo [NOTE] If Gang_Showdown_02_Gang_Creation.pdf is currently open in Adobe Acrobat or a PDF viewer, please close it to allow overwriting.
    exit /b %ERRORLEVEL%
)
echo [OK] release\Gang_Showdown_02_Gang_Creation.pdf ready.

echo.
echo [3/3] Compiling Book 3: Campaign Rules...
"%TYPST_BIN%" compile --root . books\03_campaign_rules\main.typ release\Gang_Showdown_03_Campaign_Rules.pdf
if %ERRORLEVEL% NEQ 0 (
    echo [ERROR] Failed to compile Book 3!
    echo [NOTE] If Gang_Showdown_03_Campaign_Rules.pdf is currently open in Adobe Acrobat or a PDF viewer, please close it to allow overwriting.
    exit /b %ERRORLEVEL%
)
echo [OK] release\Gang_Showdown_03_Campaign_Rules.pdf ready.

echo.
echo =====================================================================
echo  [SUCCESS] All 3 rulebooks compiled successfully into release\
echo =====================================================================
dir release\*.pdf
