'ssd1963-dht22.bas

' Copyright (C) 2024 Chris Stoddard
' MIT License
' MMBASIC 5.08

RTC GETTIME
Dim FLOAT temp, humidity
Font 5
CLS RGB(WHITE)
Colour RGB(BLACK),RGB(WHITE)
GUI FRAME #1, "Time and Temperature", 20, 20, 760, 440, RGB(BLACK)
GUI CAPTION #2, "Time: " + Time$, 50, 50, LT, RGB(BLACK), RGB(WHITE)
GUI CAPTION #3, "Temp: " + Str$(temp), 50, 100, LT, RGB(BLACK), RGB(WHITE)
GUI CAPTION #4, "Humi: " + Str$(humidity), 50, 150, LT, RGB(BLACK), RGB(WHITE)

Do
  Device HUMID GP27, temp, humidity
  ' If you want the temp dispayed in celsius
  ' comment out the next 2 lines
  f_temp = (temp * (9/5)) + 32
  temp = f_temp
  CtrlVal(#2) = "Time: " + Time$
  CtrlVal(#3) = "Temp: " + Str$(temp)
  CtrlVal(#4) = "Humi: " + Str$(humidity)
  Pause 1000
Loop
