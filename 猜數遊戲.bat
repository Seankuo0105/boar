@echo off
chcp 65001 >nul
set currentFile=%~f0
color 02
setlocal EnableDelayedExpansion

:: 產生 1 到 100 之間的隨機數
set /a targetNumber=%random% %% 100 + 1
set attempts=0

:guess
echo.
set /p userGuess=請輸入你猜的數字 (1-100): 

:: 確保輸入不為空
if "%userGuess%"=="" (
    echo 請輸入有效的數字！
    goto guess
)

:: 檢查輸入是否為數字
for /f "delims=0123456789" %%i in ("%userGuess%") do (
    echo 請輸入有效的數字！
    goto guess
)

:: 確保輸入值是數值
set /a userGuess+=0
set /a attempts+=1

:: 確保數字範圍正確
if %userGuess% LSS 1 (echo 請輸入 1 到 100 之間的數字！ & goto guess)
if %userGuess% GTR 100 (echo 請輸入 1 到 100 之間的數字！ & goto guess)

:: 判斷猜測結果
if %userGuess% GTR %targetNumber% (
    echo 太大了！請再試一次。
    goto guess
)
if %userGuess% LSS %targetNumber% (
    echo 太小了！請再試一次。
    goto guess
)

:: 猜對
echo.
echo 恭喜你猜對了！你總共猜了 %attempts% 次。
pause
start "" "%currentFile%"
exit