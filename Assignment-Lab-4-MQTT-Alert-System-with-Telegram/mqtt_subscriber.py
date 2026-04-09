import socket
import random
import time

SERVER_IP = "127.0.0.1" 
PORT = 5000

client = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
client.connect((SERVER_IP, PORT))

while True:
    # Generates a random temperature between 20 and 35
    temperature = round(random.uniform(20, 35), 2)
    message = f"{temperature}"
    
    client.send(message.encode())
    print("Sensor value sent:", temperature)
    
    # Waits 5 seconds before sending the next reading
    time.sleep(5)