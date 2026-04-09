import socket

HOST = "0.0.0.0" # Listens on all available interfaces
PORT = 5000 # The port for communication

server = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
server.bind((HOST, PORT))
server.listen()

print("Waiting for sensor connection...")
conn, addr = server.accept()
print("Connected:", addr)

while True:
    data = conn.recv(1024)
    if not data:
        break
    print("Sensor data:", data.decode())