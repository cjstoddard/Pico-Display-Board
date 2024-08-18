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

Once that is done, you can open the com port and type in oled.bas and run the program. I used the same pin configuration as used in the other repo, so if you followed his work, you can add an OLED and run my program with no changes to your wiring.

You will notice looking at the code here, that I pull code from other sources alot. I am a lazy man, I don't believe in reinventing the wheel. Before I even start a coding project, I do a google search to find out if someone has already done it, if that is the case, I will use their code and adapt it for my own use. I also give credit were credit is due, in each program I will cite the author of the original code along with a link to where I found it. I in no way want to take credit for other peoples work. My intent here is to simply hellp others use what I consider to be a cool development board, so they in turn do not have to reinvent the wheel.

It should also be noted that none of this code requires you to have the Pico Display Board, you can wire all of this up with a breadboard. The Pico Display Board simply makes it easier to do, especially the SSD1963, which can be a pain to get wired properly. I added a picture of oled-dht22.bas running on a breadboard, with equivelent wiring to the Pico Display Board. Really, I think most of this is more about showing you how to use devices like the BME280 with a Pico using MMBasic, because in some cases, there is not much documentation on how to do it and I want to save some people an hour of their lives sorting through Backshed forum posts.

Update 7-13-2024:
I have added cardkb.bas which demonstrates how to get an M5stack Cardkb working on I2C2. At some point I will turn this into a function so it can be inserted into another program easily.

Update 7-24-2024:
I added bme280.bas which demonstrates connecting a BME280 sensor on the I2C2 bus. I also added oled-bme280.bas which gives you two screens, one with the IP Adress, Date and Time, the other has Temperature, Pressure and Humity. You can change the screens by pressing switch 2.

Update 7-25-2024:
I added oled-dht22.bas, this domonstrated the use of a DHT22 Temperature/Humity sensor. These are much easier to use than a BME280. MMBasic has support for these built in and the data can be read directly off the device without all the heavy math required by the BME280. The only advantage to the BME280 is it reports pressure as well. I recommend getting one that has a buillt in pullup resistor.

https://www.amazon.com/dp/B0795F19W6?psc=1&ref=ppx_yo2ov_dt_b_product_details

Update 8-16-2024:
I finally got an SSD1963 to work with. In order to make it work, you will need to run "option reset" to clear all the options set this far. Unfortunately MMBasic does not support using multiple LCD Panels, you can either use the small OLED or you can use the SSD1963, but not both. Once you have cleared all the options, set the following options.

    OPTION SYSTEM SPI GP10,GP11,GP12
    OPTION SYSTEM I2C GP8,GP9
    OPTION LCDPANEL SSD1963_5, LANDSCAPE
    OPTION GUI CONTROLS 75
    OPTION TOUCH GP18,GP19
    GUI CALIBRATE 1, 134, 3777, 2065, -1340
    OPTION SDCARD GP22

The program ssd1963-dht22.bas is simply oled-dht22.bas rewritten to use the SSD1963 instead of the oled and adds some nice bar gauges.

Something to be aware of is if you are using WebMite, you are not going to be able use most of the GUI commands. When making WebMite, they had to sacrifice GUI functions for Web functions. This can probably be worked around, but it is something to pay attention to before you get too deep into a project. My suggestion is to use PicoMite instead of WebMite for projects involving an SSD1963. 

Here is the SSD1963 that I purchased, it is coming from China, so be patient, it will take time to get.

https://www.amazon.com/dp/B0D47QD82X?psc=1&ref=ppx_yo2ov_dt_b_product_details

Update 8-18-2024:
I added ssd1963-dht22-2.bas, this is an adaption of the TwoGaugeButton.txt program on KW Services github that uses the gauges to visually display the Temperature and Humity from the DHT22 sensor.

Disclaimer: This software is provided "AS IS", without warranty of any kind, express or implied, including but not limited to warranties of merchantability, fitness for a paticular purpose and nonifringment. In no event shall the author or copyright holders be liable for any claim, damages or other liability, whether in an action of contract, tort or otherwise, arising from, out of or in connection with the software or the use or other dealings in the software.