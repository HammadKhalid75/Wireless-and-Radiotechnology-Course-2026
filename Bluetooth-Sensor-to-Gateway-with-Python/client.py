import socket
import random
import time

# Replace the XX's below with Laptop 1's Bluetooth MAC address
client = socket.socket(socket.AF_BLUETOOTH, socket.SOCK_STREAM, socket.BTPROTO_RFCOMM)
client.connect(("24:B2:B9:5A:4D:86", 4))
print("Connected to Bluetooth server")

try:
    while True:
        temperature = round(random.uniform(20.0, 30.0), 1)
        # Formats the message nicely
        message = f"Temperature: {temperature} C" 
        client.send(message.encode("utf-8"))
        print("Sent:", message)
        time.sleep(5)
except OSError:
    pass

client.close()