import cv2
from ultralytics import YOLO
import time

# Using localhost because everything is on one laptop
STREAM_URL = "http://127.0.0.1:5000/video_feed"

# Load the YOLO model (it will download a small file the first time you run it)
model = YOLO("yolov8n.pt")
cap = cv2.VideoCapture(STREAM_URL)

if not cap.isOpened():
    print("Error: Could not open stream.")
    exit()

print("Stream opened. Running YOLO detection...")

person_count = 1
last_save_time = 0

cv2.namedWindow("YOLO Home Monitoring", cv2.WINDOW_NORMAL)
while True:
    ret, frame = cap.read()
    if not ret:
        print("Error: Could not read frame.")
        break

    # Run YOLO detection on the frame
    results = model(frame)
    annotated_frame = results[0].plot()

    # ---- BONUS TASK: Save image if a person is detected ----
    # Class '0' in the YOLO model corresponds to 'person'
    detected_classes = results[0].boxes.cls.cpu().numpy()
    if 0 in detected_classes:
        current_time = time.time()
        # Wait 5 seconds between saves so it doesn't flood your hard drive!
        if current_time - last_save_time > 5:
            filename = f"person_detected_{person_count:02d}.jpg"
            cv2.imwrite(filename, frame)
            print(f"*** ALERT: Person detected! Saved {filename} ***")
            person_count += 1
            last_save_time = current_time
    # --------------------------------------------------------

    # Show the video feed with bounding boxes
    cv2.imshow("YOLO Home Monitoring", annotated_frame)
    
    # Press 'q' on your keyboard to quit the window
    if cv2.waitKey(1) & 0xFF == ord('q'):
        break

cap.release()
cv2.destroyAllWindows()