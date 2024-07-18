# Pico-Display-Board

On Tindie there is a cool little board for sale, the Pico Display Base Board, that makes hooking up several devices to a Raspberry Pi Pico reasonably easy. The board only costs about $15, so it is a bargin.

Tindie: https://www.tindie.com/products/aiy745321/pico-display-base-board/

Github: https://github.com/kwinter745321/PicoDisplay

On his Github page he has several examples of how to get various devices working. The best part is he is doing it in MMBasic, which is my favorite way to program a Pico. The only problem is, he does not present any code to show how to use an OLED using MMBasic. So I thought I would throw his code for using the buttons, potentiometer, and LED into a program to display some useful, semi useful information on the OLED.

Before you get started, you will need to set these Options;

OPTION SYSTEM I2C GP8,GP9

OPTION RTC AUTO ENABLE

OPTION LCDPANEL SSD1306I2C, LANDSCAPE

You will notice that I used SSD1306I2C rather than SSD1306I2C32 that he used. This is because I think his OLED was 128x32, the one I am using is 128x64, the other will work with a 128x64, but you end up with a lot less space to draw to and you will have to alter the code to make it fit.

If you have a Raspberry Pi Pico W, you will also need to set this option;

OPTION WIFI "SSID", "PASSWORD"

Once that is done, you can open the com port and type in oled.bas and run the program. I used the same pin configuration as used in the other repo, so if you followed his work, you can add an OLED and run my program with no changes to your wiring. I do not have an SSD1963 LCD yet, it is on the way. Once I have it, I will update this repo with some new code, once I think of something interesting to do with it.

Update 7-13-2024:
I have added cardkb.bas which demonstrates how to get an M5stack Carkb working on I2C2. At some point I will turn this into a function so it can be inserted into another program easily.

Disclaimer: This software is provided "AS IS", without warranty of any kind, express or implied, including but not limited to warranties of merchantability, fitness for a paticular purpose and nonifringment. In no event shall the author or copyright holders be liable for any claim, damages or other liability, whether in an action of contract, tort or otherwise, arising from, out of or in connection with the software or the use or other dealings in the software.