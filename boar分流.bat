@echo off
setlocal
:: 設定編碼為 UTF-8 (若顯示亂碼可嘗試刪除此行)
chcp 65001 >nul

:: --- 設定儲存路徑 ---
set "targetDir=%USERPROFILE%\Desktop\下載"

:: --- 確保資料夾存在 ---
if not exist "%targetDir%" mkdir "%targetDir%"

echo 歡迎使用seankuo0105.github.io站內下載器（boar分流）
pause

echo.
echo 請輸入檔案名稱 (需包含副檔名，例如 image.jpg)：
set /p "filename="

:: --- 防止空輸入 ---
if "%filename%"=="" goto Fail

:: --- 組合網址 ---
set "fullUrl=https://seankuo0105.github.io/boar/%filename%"

:: --- 切換目錄並下載 ---
cd /d "%targetDir%"

:: 使用 curl 下載
:: -f: 若伺服器回傳錯誤(如404找不到檔案)則不下載且回報錯誤
:: -L: 跟隨轉址
:: -O: 使用原始檔名存檔
curl -f -L -O "%fullUrl%"

:: --- 判斷成功與否 ---
if %errorlevel% equ 0 (
    goto Success
) else (
    goto Fail
)

:Success
echo.
echo 下載成功！
:: 打開資料夾
start "" "%targetDir%"
:: 等待 3 秒
timeout /t 3 /nobreak >nul
cls
:: 等待 3 秒
timeout /t 3 /nobreak >nul
exit

:Fail
echo.
echo %filename% 下載失敗❌
:: 等待 3 秒
timeout /t 3 /nobreak >nul
cls
:: 等待 3 秒
timeout /t 3 /nobreak >nul
exit
