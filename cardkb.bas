'cardkb.bas

' Based on code written by thwill at TheBackShed.com Forums
' https://www.thebackshed.com/forum/ViewTopic.php?TID=13915&PID=170991#170991
' MIT License
' MMBASIC 5.08

Option Base 0

Dim addr%, byte%

SetPin GP18, GP19, I2C2

I2C2 Open 100, 1000
addr% = &h5f

Do
  I2C2 Read addr%, 0, 1, byte%
  If byte% = 0 Then
    ' nothing
  ElseIf byte% > 31 And byte% < 128 Then
    Print Chr$(byte%);
  Else
    Print "[" Hex$(byte%, 2) "]";
  EndIf
  Pause 100
Loop
