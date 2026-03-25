import socket
import paho.mqtt.client as mqtt

# --- Settings ---
SOCKET_HOST = '127.0.0.1'  # Listens only on your local computer
SOCKET_PORT = 65432
MQTT_BROKER = "broker.emqx.io"
MQTT_PORT = 1883
MQTT_TOPIC = "savonia/iot/temperature"

# --- Connect to MQTT Broker ---
print("Connecting to public MQTT Broker...")
mqtt_client = mqtt.Client()
mqtt_client.connect(MQTT_BROKER, MQTT_PORT, 60)
mqtt_client.loop_start()

# --- Setup Socket Server ---
with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
    s.bind((SOCKET_HOST, SOCKET_PORT))
    s.listen()
    print(f"Edge Device listening on port {SOCKET_PORT}...")
    
    conn, addr = s.accept() 
    with conn:
        print(f"Sensor connected from {addr}")
        while True:
            data = conn.recv(1024)
            if not data:
                break
            
            temperature = data.decode('utf-8')
            print(f"Received: {temperature}°C -> Publishing to MQTT")
            mqtt_client.publish(MQTT_TOPIC, temperature)