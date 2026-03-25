import socket
import time
import random

# --- Settings ---
EDGE_DEVICE_IP = '127.0.0.1' 
PORT = 65432

with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as client:
    print("Connecting to Edge Device...")
    
    while True:
        try:
            client.connect((EDGE_DEVICE_IP, PORT))
            break
        except ConnectionRefusedError:
            print("Waiting for edge_device.py to start... retrying in 2s")
            time.sleep(2)

    print("Connected! Sending multi-sensor data...")
    while True:
        # Generate fake data for three sensors
        temperature = round(random.uniform(20.0, 35.0), 2)
        humidity = round(random.uniform(40.0, 80.0), 2)
        light = round(random.uniform(100.0, 1000.0), 2)
        
        # Format as a single comma-separated string
        message = f"{temperature},{humidity},{light}"
        
        # Send via socket
        client.sendall(message.encode('utf-8'))
        print(f"Sent: {message}")
        
        # Wait 5 seconds
        time.sleep(5)