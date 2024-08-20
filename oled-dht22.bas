'oled-dht22.bas

' Code is based examples givien in the
' PicoMite User Manual, Page 40
' https://geoffg.net/Downloads/picomite/PicoMite_User_Manual.pdf
' MIT License
' MMBASIC 5.08

Dim FLOAT temp, humidity
Const BLK=RGB(BLACK)
Const WHT=RGB(WHITE)

SetPin GP21, DOUT

CLS
Box 0, 0, 128, 64, 2, WHT, BLK
Pin(GP21) = 1

Do
  Device HUMID GP27, temp, humidity
  ' If you want the temp dispayed in fahrenheit
  ' uncomment the next 2 lines
  'f_temp = (temp * (9/5)) + 32
  'temp = f_temp
  Text 10, 10, "Time: " + Time$, "L", 1, 1, WHT, BLK
  Text 10, 25, "Temp: " + Str$(temp), "L", 1, 1, WHT, BLK
  Text 10, 40, "Humi: " + Str$(humidity), "L", 1, 1, WHT, BLK
  Pause 1000
Loop
