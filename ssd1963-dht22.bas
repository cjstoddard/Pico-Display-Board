'ssd1963-dht22.bas

' Copyright (C) 2024 Chris Stoddard
' MIT License
' MMBASIC 5.08

RTC GETTIME
Dim FLOAT temp, humidity
Font 5
CLS RGB(BLUE)
Colour RGB(WHITE),RGB(BLUE)
GUI FRAME #1, "Time and Temperature", 20, 20, 760, 440, RGB(WHITE)
GUI CAPTION #2, "Time: " + Time$, 50, 50, LT, RGB(WHITE), RGB(BLUE)
GUI CAPTION #3, "Temp: " + Str$(temp), 50, 100, LT, RGB(WHITE), RGB(BLUE)
GUI CAPTION #4, "Humi: " + Str$(humidity), 50, 150, LT, RGB(WHITE), RGB(BLUE)

Do
  Device HUMID GP27, temp, humidity
  ' If you want the temp dispayed in celcius
  ' comment out the next 2 lines
  f_temp = (temp * 1.8) + 32
  temp = f_temp
  CtrlVal(#2) = "Time: " + Time$
  CtrlVal(#3) = "Temp: " + Str$(temp)
  CtrlVal(#4) = "Humi: " + Str$(humidity)
  Pause 1000
Loop
