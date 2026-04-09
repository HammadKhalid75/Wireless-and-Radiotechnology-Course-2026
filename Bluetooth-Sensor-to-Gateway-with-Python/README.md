
# Bluetooth Sensor to Gateway Project

## Project Description
This project is a simple Bluetooth client-server application built in Python using RFCOMM sockets. It simulates an IoT environment where a client device (acting as a sensor node) generates random temperature data every 5 seconds and transmits it wirelessly via Bluetooth to a server device (acting as a gateway), which receives and displays the data.

## Configuration
* **Bluetooth MAC Address Used:** `24:B2:B9:5A:4D:86`

## How to Run
1. Ensure Python 3.x is installed and Bluetooth is enabled on both laptops.
2. Pair the two devices together via your operating system's Bluetooth settings.
3. **Start the Server (Gateway):** Open a terminal on the server laptop, navigate to the project folder, and run:
   `python server.py`
4. **Start the Client (Sensor):** Once the server says it is waiting for a connection, open a terminal on the client laptop and run:
   `python client.py`
5. The server terminal will immediately begin displaying the incoming temperature readings every 5 seconds.

## Successful Communication Screenshot
![Successful Communication Screenshot](./screenshot.png) 
<-- (REPLACE THIS IMAGE LINK WITH YOUR ACTUAL SCREENSHOT FILE, OR DRAG-AND-DROP THE IMAGE DIRECTLY INTO GITHUB)

## Reflection

**What did you learn?**
Through this assignment, I learned how to set up RFCOMM sockets in Python to establish a wireless connection between two distinct hardware devices. I also learned how to encode and decode string messages so they can be successfully transmitted and read over a network protocol.

**What was difficult?**
[WRITE ONE SENTENCE HERE. For example: "The most difficult part was finding the correct MAC address using the command prompt and ensuring both laptops were properly paired before running the code."]

**Where could Bluetooth communication be useful in IoT?**
Bluetooth is highly useful in IoT for short-range, low-power communication. Real-world examples include smart home devices (like a smart thermometer communicating with a wall display), wearable health monitors (like a smartwatch sending heart rate data to a mobile phone), and industrial sensors reading machine diagnostics in close proximity.

**What is the difference between Bluetooth socket communication and WiFi socket communication in practice?**
In practice, Bluetooth is designed for short-range, device-to-device communication with very low power consumption, making it ideal for battery-operated sensors. It typically requires devices to be paired locally. WiFi socket communication operates over a Local Area Network (LAN) via a central router. WiFi has a much longer range and higher data bandwidth, allowing devices to communicate across an entire building or directly to the internet, but it consumes significantly more power, making it better suited for devices plugged into wall power.
