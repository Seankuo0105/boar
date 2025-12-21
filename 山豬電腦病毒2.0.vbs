
Dim x
x = MsgBox ("you need to answer a question :)",16,"computer virus:)")

    x = InputBox("What is your name? (you name is SB)")

If x = "SB" Then 
    MsgBox "your name is SB XD" 
Else 
    do
    MsgBox x & " is not your correct name (your name is SB)"
    x = InputBox("What is your name? (you name is SB)")
    Loop Until x = "SB"

End If