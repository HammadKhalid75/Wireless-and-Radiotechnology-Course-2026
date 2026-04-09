import paho.mqtt.client as mqtt
import requests

broker = "broker.emqx.io"
topic = "savonia/iot/temperature"

# Your specific Telegram Bot Token and Chat ID
TOKEN = "8623917157:AAG2GbgmKZmIJqzrn5vZnJWVyeHjfcAJMmk"
CHAT_ID = "6461625639"
threshold = 28.0

def send_telegram(message):
    url = f"https://api.telegram.org/bot{TOKEN}/sendMessage"
    payload = {
        "chat_id": CHAT_ID,
        "text": message
    }
    response = requests.post(url, data=payload)
    
    # This will print an error if Telegram rejects the message
    if response.status_code != 200:
        print("Telegram API Error:", response.text)

def on_message(client, userdata, msg):
    temperature = float(msg.payload.decode())
    print("Temperature:", temperature)
    
    if temperature > threshold:
        alert = f"ALERT: High temperature {temperature} °C"
        print(alert)
        send_telegram(alert)

# Setup MQTT Client
client = mqtt.Client()
client.on_message = on_message 
client.connect(broker, 1883)
client.subscribe(topic)

print("Listening for temperature alerts...")
client.loop_forever()