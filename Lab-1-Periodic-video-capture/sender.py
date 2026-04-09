import socket
import os
import time

HOST = "127.0.0.1" # Using localhost for single-laptop simulation
PORT = 5001
VIDEO_FOLDER = "videos"
CHECK_INTERVAL = 5 

def send_file(filepath):
    filename = os.path.basename(filepath)
    try:
        client = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        client.connect((HOST, PORT))
        
        # Send filename
        client.sendall(filename.encode())
        response = client.recv(1024)
        
        if response == b"FILENAME_OK":
            with open(filepath, "rb") as f:
                while True:
                    data = f.read(4096)
                    if not data: break
                    client.sendall(data)
            client.sendall(b"EOF") # Signal end of transfer
            
            # Wait for confirmation before deleting
            confirmation = client.recv(1024)
            if confirmation == b"OK":
                print(f"Transfer confirmed: {filename}")
                client.close()
                os.remove(filepath) # Delete only after confirmation
                print(f"Deleted local file: {filename}\n")
                return True
        client.close()
    except Exception as e:
        print(f"Error sending {filename}: {e}")
    return False

while True:
    files = [f for f in os.listdir(VIDEO_FOLDER) if f.endswith(".mp4")]
    files.sort()
    for file in files:
        send_file(os.path.join(VIDEO_FOLDER, file))
    time.sleep(CHECK_INTERVAL)