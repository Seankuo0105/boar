@echo off
setlocal
:: 設定編碼為 UTF-8
chcp 65001 >nul

:: --- 設定儲存路徑 (改用英文名稱以避免路徑錯誤) ---
set "targetDir=%USERPROFILE%\Desktop\Boar_Downloads"

:: --- 確保資料夾存在 ---
if not exist "%targetDir%" (
    echo 正在建立資料夾...
    mkdir "%targetDir%"
)

:Start
cls
echo ===================================================
echo   歡迎使用 seankuo0105.github.io 站內下載器
echo          （Boar 分流 - 強力下載版）
echo ===================================================
echo.
echo 提示：檔案將下載至桌面的 [Boar_Downloads] 資料夾
echo.
echo 請輸入檔案名稱 (需包含副檔名，例如 parkour.html)：
set /p "filename="

:: --- 防止空輸入 ---
if "%filename%"=="" goto Fail

:: --- 組合網址 ---
set "fullUrl=https://seankuo0105.github.io/boar/%filename%"

:: --- 顯示網址 ---
echo.
echo 正在連接至: [%fullUrl%]
echo 正在下載中...

:: --- 切換目錄 ---
cd /d "%targetDir%"

:: --- 下載指令 (關鍵修改) ---
:: 加入 --ssl-no-revoke 解決 (0x80092012) 錯誤
:: 加入 -k (insecure) 作為最後手段確保能下載
curl -f -L -O --ssl-no-revoke -k "%fullUrl%"

:: --- 判斷成功與否 ---
if %errorlevel% equ 0 (
    goto Success
) else (
    goto Fail
)

:Success
echo.
echo ===================================================
echo             下載成功！ (Success)
echo ===================================================
echo 檔案已儲存於：%targetDir%
echo.
echo 3 秒後自動打開資料夾...
timeout /t 3 /nobreak >nul
start "" "%targetDir%"
exit

:Fail
echo.
echo ===================================================
echo             下載失敗 (Failed) ❌
echo ===================================================
echo.
echo 如果還是失敗，請檢查：
echo 1. 您的 GitHub Pages 是否已經開啟？(在 Repo 的 Settings -> Pages)
echo 2. 檔名大小寫是否完全正確？
echo.
echo 按任意鍵重新輸入...
pause >nul
goto Start
