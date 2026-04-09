import socket
import random
import time

# We use 127.0.0.1 instead of a network IP because both programs run on the same laptop
SERVER_IP = "127.0.0.1" 
PORT = 5000

client = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
client.connect((SERVER_IP, PORT))

while True:
    temperature = round(random.uniform(20, 35), 2)
    message = f"{temperature}"
    client.send(message.encode())
    print("Sensor value sent:", temperature)
    time.sleep(5)