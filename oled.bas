'oled.bas

' Based on work done by KW Services.
' https://github.com/kwinter745321/PicoDisplay
' MIT License
' MMBASIC 5.08

SETPIN GP21, DOUT
SETPIN GP17, DIN
SETPIN GP26, AIN

' Clears the screen
CLS

' Draws a box on the screen
Box 0, 0, 128, 64, 2, RGB(WHITE), RGB(BLACK)

' Gets the IP Adress and writes it to the screen. 
' If you do not have a Pico W leave these 2 lines line out
ipaddr$ = MM.Info(ip address)
Text 10, 10, ipaddr$, "L", 1, 1, RGB(WHITE), RGB(BLACK)

' Writes the time to the screen, it should pull from the RTC
Text 10, 25, Time$, "L", 1, 1, RGB(WHITE), RGB(BLACK)

' When the button is pressed writes the Voltage to the screen
' otherwise updates time
Do
  If Pin(GP17) = 0 Then
    reading$ = Str$(Pin(GP26))
    Text 10, 40, reading$, "L", 1, 1, RGB(WHITE), RGB(BLACK)
    Pin(GP21) = 1
    Pause 300
  Else
    Pin(GP21) = 0
    Text 10, 25, Time$, "L", 1, 1, RGB(WHITE), RGB(BLACK)
    Pause 300
  EndIf
Loop


