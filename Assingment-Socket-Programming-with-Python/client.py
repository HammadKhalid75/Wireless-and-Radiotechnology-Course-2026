import socket
import time
import random

# --- Settings ---
# Keep as '127.0.0.1' for local testing. 
# Change to the Server's WiFi IP address when testing on a second device.
SERVER_IP = '127.0.0.1'  
PORT = 65432

print(f"Connecting to server at {SERVER_IP}...")
with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
    s.connect((SERVER_IP, PORT))
    print("Connected! Generating sensor data...")
    
    while True:
        # Generate random data formatted exactly as requested
        temp = round(random.uniform(20.0, 30.0), 1)
        message = f"Temperature: {temp} C"
        
        # Send it
        s.sendall(message.encode('utf-8'))
        print(f"Sent: {message}")
        
        # Wait 5 seconds to meet the requirement
        time.sleep(5)