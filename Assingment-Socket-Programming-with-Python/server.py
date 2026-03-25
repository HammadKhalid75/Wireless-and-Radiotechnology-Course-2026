import socket

# --- Settings ---
# We use '0.0.0.0' instead of '127.0.0.1' here so that it works for BOTH 
# the localhost test and the mobile hotspot/second laptop test later!
HOST = '0.0.0.0' 
PORT = 65432      

print("Starting server...")
with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
    s.bind((HOST, PORT))
    s.listen()
    print(f"Server is listening on port {PORT}...")
    
    # Wait for the client to connect
    conn, addr = s.accept()
    with conn:
        print(f"Client connected from {addr}")
        while True:
            # Receive data
            data = conn.recv(1024)
            if not data:
                break
            # Print the decoded message
            print(f"Received: {data.decode('utf-8')}")