@echo off
setlocal

set "TYPST_BIN=typst"
if exist "C:\Users\Alexey\Typst\bin\typst.exe" (
    set "TYPST_BIN=C:\Users\Alexey\Typst\bin\typst.exe"
)

echo [BUILD] Book 3: Campaign Rules...
if not exist "..\..\release" mkdir "..\..\release"
"%TYPST_BIN%" compile --root "..\.." main.typ "..\..\release\Gang_Showdown_03_Campaign_Rules.pdf"
if %ERRORLEVEL% EQU 0 (
    echo [OK] Compiled: release\Gang_Showdown_03_Campaign_Rules.pdf
) else (
    echo [ERROR] Book 3 compilation failed!
    exit /b %ERRORLEVEL%
)
