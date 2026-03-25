import socket
import time
import random

# --- Settings ---
EDGE_DEVICE_IP = '127.0.0.1' # Points directly to your own computer
PORT = 65432

with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
    print("Connecting to Edge Device...")
    
    while True:
        try:
            s.connect((EDGE_DEVICE_IP, PORT))
            break
        except ConnectionRefusedError:
            print("Waiting for edge_device.py to start... retrying in 2s")
            time.sleep(2)

    print("Connected! Sending sensor data...")
    while True:
        temp = round(random.uniform(20.0, 25.0), 2)
        message = str(temp)
        
        s.sendall(message.encode('utf-8'))
        print(f"Sent to Edge Device: {message} °C")
        
        time.sleep(2)