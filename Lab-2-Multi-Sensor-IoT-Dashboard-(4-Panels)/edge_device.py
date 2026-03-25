import socket
import paho.mqtt.client as mqtt

# --- Settings ---
HOST = '127.0.0.1'  
PORT = 65432
broker = "broker.emqx.io"

# --- Connect to MQTT Broker ---
print("Connecting to public MQTT Broker...")
mqtt_client = mqtt.Client()
mqtt_client.connect(broker, 1883, 60)
mqtt_client.loop_start()

# --- Setup Socket Server ---
with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as server:
    server.bind((HOST, PORT))
    server.listen()
    print(f"Edge Device listening on port {PORT}...")
    
    conn, addr = server.accept() 
    with conn:
        print(f"Sensor node connected from {addr}")
        while True:
            data = conn.recv(1024)
            if not data:
                break
            
            # Decode the incoming string
            message = data.decode('utf-8')
            
            try:
                # Split the string by commas into three variables
                temperature, humidity, light = message.split(",")
                
                # Publish each to a separate topic
                mqtt_client.publish("savonia/iot/temperature", temperature)
                mqtt_client.publish("savonia/iot/humidity", humidity)
                mqtt_client.publish("savonia/iot/light", light)
                
                print(f"Forwarded: {message} to separate topics")
            except ValueError:
                print("Received malformed data, skipping...")