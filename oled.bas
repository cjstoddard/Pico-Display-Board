'oled.bas

' Based on code written by KW Services.
' https://github.com/kwinter745321/PicoDisplay
' MIT License
' MMBASIC 5.08

SETPIN GP17, DIN
SETPIN GP21, DOUT
SETPIN GP26, AIN

' Clears the screen
CLS

' Sets time from NTP server
' If you do not have an RTC, but you are using a Pico W
' you can uncomment this line and get the time/date from
' the internet
'WEB NTP -5

' Draws a box on the screen
Box 0, 0, 128, 64, 2, RGB(WHITE), RGB(BLACK)

' Gets the IP Adress and writes it to the screen. 
' If you do not have a Pico W leave these 2 lines out
ipaddr$ = MM.Info(ip address)
Text 10, 10, ipaddr$, "L", 1, 1, RGB(WHITE), RGB(BLACK)

' Writes the time to the screen, If you do not have an
' RTC or Pico W, leave this line out
Text 10, 25, Time$, "L", 1, 1, RGB(WHITE), RGB(BLACK)

' When the button is pressed writes the Voltage to the screen
' otherwise updates time
Do
  If Pin(GP17) = 0 Then
    reading$ = Left$(Str$(Pin(GP26)),4) + " volts"
    Text 10, 40, reading$, "L", 1, 1, RGB(WHITE), RGB(BLACK)
    Pin(GP21) = 1
    Pause 300
  Else
    Pin(GP21) = 0
    ' If you do not have an RTC or Pico W, leave this line out
    Text 10, 25, Time$, "L", 1, 1, RGB(WHITE), RGB(BLACK)
    Pause 300
  EndIf
Loop


