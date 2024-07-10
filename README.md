# Pico-Display-Board

On Tindie there is a cool little board for sale, the Pico Display Base Board, that makes hooking up several devices to a Raspberry Pi Pico reasonably easy. The board only costs about $14, so it is a bargin.

Tindie: https://www.tindie.com/products/aiy745321/pico-display-base-board/

Github: https://github.com/kwinter745321/PicoDisplay

On his Github page he has several examples of how to get various devices working. The best part is he is doing it in MMBasic, which is my favorite way to program a Pico. The only problem is, he does not present any code to show how to use an OLED using MMBasic. So I thought I would throw his code for using the buttons, potentiometer, and LED into a program to display some useful information on the OLED.

Before you get started, you will need to set these Options;

OPTION SYSTEM I2C GP8,GP9

OPTION LCDPANEL SSD1306I2C, LANDSCAPE

OPTION RTC AUTO ENABLE

If you have a Raspberry Pi Pico W, you will also need to set this option;

OPTION WIFI "SSID", "PASSWORD"

Once that is done, you can open the com port and type in the oled.bas program.
