*** Variables ***
${ENTER}                 \r\n  #\x0D\x0A - on Linux
${PROMPT}                >>>\r\n  #>>> - on Linux
${PORT}                  COM5  #/dev/ttyACM0 - on Linux
${BAUDRATE}              115200
${ENCODING}              utf-8
${MICROPYTHON_VERSION}   1.24.1

# Requires manual setup
${WIFI_NAME}             <Wifi name>
${WIFI_PASSWORD}         <Wifi password>
