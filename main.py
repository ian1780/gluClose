import serial

#ngrok.client.BASE_URL = "http://localhost:8765"
ser = serial.Serial('/dev/cu.usbmodem1411')  # open serial port

while True:
	line = float(ser.readline().decode("utf-8"))
	print(line)

ser.close() 