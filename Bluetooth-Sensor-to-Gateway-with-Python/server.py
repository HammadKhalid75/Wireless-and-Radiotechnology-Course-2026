import socket

# Replace the XX's below with Laptop 1's Bluetooth MAC address
server = socket.socket(socket.AF_BLUETOOTH, socket.SOCK_STREAM, socket.BTPROTO_RFCOMM)
server.bind(("24:B2:B9:5A:4D:86", 4)) 
server.listen(1)

print("Waiting for Bluetooth client connection...")
client, addr = server.accept()
print(f"Connected to: {addr}")

try:
    while True:
        data = client.recv(1024)
        if not data:
            break
        print("Received:", data.decode("utf-8"))
except OSError:
    pass

client.close()
server.close()