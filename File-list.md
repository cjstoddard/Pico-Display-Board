
If you are just looking for a specific program and don't want to sort through the code to figure out what is what, here is a short description of each program.

bme280.bas - This program simply outputs Temerature, Humidity and Pressure readings from a BME280 senor to the console.

cardkb.bas - This program demonstrates how to get an M5stack Cardkb working on I2C2.

index.html - This is needed by web-oled-dht22.bas, if you are using that program, you will need this file as well.

oled-bme280.bas - This program has two screens for the SSD1306 128x64 OLED screen, the first on outputs the Time and IP Adress, the second screen outputs Temerature, Humidity and Pressure readings from a BME280 senor. You can switch screens by pressing switch 2.

oled-dht22.bas  - This program outputs Temerature, and Humidity readings from a DHT22 senor to a SSD1306 128x64 OLED screen.

oled.bas  - This program outputs Time and IP Adress to a SSD1306 128x64 OLED screen, this requires WebMite to work.

ssd1963-bme280.bas - This is an adaption of the TwoGaugeButton.txt program on KW Services github that uses the gauges to visually display the Temperature, Humidity and Pressure from the BME280 sensor on an SSD1963 LCD screen.

ssd1963-dht22-2.bas - This is an adaption of the TwoGaugeButton.txt program on KW Services github that uses the gauges to visually display the Temperature and Humidity from the DHT22 sensor on an SSD1963 LCD screen.

ssd1963-dht22.bas - This program is oled-dht22.bas rewritten to use the SSD1963 instead of the oled and adds some nice bar gauges.

web-oled-dht22.bas - This program outputs Temerature, and Humidity readings from a DHT22 senor and IP Adress to a SSD1306 128x64 OLED screen. It also also outputs Temerature, and Humidity to a webpage. This requires WebMite to work and you will need the index.html as well.
