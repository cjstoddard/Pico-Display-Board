'web-oled-dht22.bas

' Code is based examples givien in the
' WebMite User Manual, Page 25
' https://geoffg.net/Downloads/picomite/WebMite_User_Manual.pdf
' MIT License
' MMBASIC 5.08

DIM buff%(4096/8)
DIM FLOAT temp, humidity

Const BLK=RGB(BLACK)
Const WHT=RGB(WHITE)

SetPin GP21, DOUT
Pin(GP21) = 1
RTC GETTIME
ipaddr$ = MM.Info(ip address)

CLS
Box 0, 0, 128, 64, 2, WHT, BLK
Text 10, 10, "IP: " + ipaddr$, "L", 1, 1, WHT, BLK

WEB TCP INTERRUPT WebInterrupt

Do
  Device HUMID GP27, temp, humidity
  f_temp = (temp * 1.8) + 32
  temp = f_temp
  Text 10, 25, "Temp: " + Str$(temp) + " F", "L", 1, 1, WHT, BLK
  Text 10, 40, "Humi: " + Str$(humidity) + " %", "L", 1, 1, WHT, BLK
  Pause 1000
Loop

SUB WebInterrupt
  LOCAL a%, p%, t%, s$
  FOR a% = 1 To MM.INFO(MAX CONNECTIONS)
    WEB TCP READ a%, buff%()
    p% = LINSTR(buff%(),"GET")
    t% = LINSTR(buff%(),"HTTP")
    If (p% <> 0) And (t% > p%) Then
      WEB TRANSMIT PAGE a%,"index.html"
    ENDIF
  NEXT a%
END SUB