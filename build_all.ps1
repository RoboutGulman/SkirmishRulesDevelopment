# =====================================================================
# Gang Showdown — PowerShell Build Script
# =====================================================================

$ErrorActionPreference = "Stop"

Write-Host "=====================================================================" -ForegroundColor DarkRed
Write-Host " GANG SHOWDOWN — СБОРКА ВСЕХ КНИГ ПРАВИЛ" -ForegroundColor Yellow
Write-Host "=====================================================================" -ForegroundColor DarkRed

$TypstBin = "typst"
if (Get-Command "typst" -ErrorAction SilentlyContinue) {
    $TypstBin = "typst"
} elseif (Test-Path "C:\Users\Alexey\Typst\bin\typst.exe") {
    $TypstBin = "C:\Users\Alexey\Typst\bin\typst.exe"
} else {
    Write-Error "Typst CLI не найден в PATH или C:\Users\Alexey\Typst\bin\typst.exe"
    exit 1
}

if (-not (Test-Path "release")) {
    New-Item -ItemType Directory -Path "release" | Out-Null
}

$books = @(
    @{ Name = "Книга 1: Основные правила"; Source = "books/01_core_rules/main.typ"; Out = "release/Gang_Showdown_01_Core_Rules.pdf" },
    @{ Name = "Книга 2: Создание банды и Арсенал"; Source = "books/02_gang_creation/main.typ"; Out = "release/Gang_Showdown_02_Gang_Creation.pdf" },
    @{ Name = "Книга 3: Правила кампании и Сценарии"; Source = "books/03_campaign_rules/main.typ"; Out = "release/Gang_Showdown_03_Campaign_Rules.pdf" }
)

$step = 1
foreach ($b in $books) {
    Write-Host "`n[$step/3] Компиляция $($b.Name)..." -ForegroundColor Cyan
    & $TypstBin compile --root . $b.Source $b.Out
    if ($LASTEXITCODE -eq 0) {
        $fileSize = (Get-Item $b.Out).Length / 1KB
        Write-Host " [OK] $($b.Out) готов ($([Math]::Round($fileSize, 1)) КБ)" -ForegroundColor Green
    } else {
        Write-Error "Ошибка при сборке $($b.Name)!"
        exit $LASTEXITCODE
    }
    $step++
}

Write-Host "`n=====================================================================" -ForegroundColor DarkGreen
Write-Host " [УСПЕХ] Все 3 книги правил успешно скомпилированы в release\" -ForegroundColor Green
Write-Host "=====================================================================" -ForegroundColor DarkGreen
Get-ChildItem "release\*.pdf" | Select-Object Name, Length, LastWriteTime | Format-Table -AutoSize
