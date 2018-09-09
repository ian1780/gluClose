import serial
import threading
from bottle import route, run, template
import json
from firebase import firebase
firebase = firebase.FirebaseApplication('https://gluclose-ff5dd.firebaseio.com', None)


#ngrok.client.BASE_URL = "http://localhost:8765"
ser = serial.Serial('/dev/cu.usbmodem1411')  # open serial port
data = {}
data['data'] = [] 
while True:
	line = float(ser.readline().decode("utf-8"))
		#print(line)
	data['data'].append({
	'num': line
	})
	print(line)
	result = firebase.post('/', {'data': line})

	#print(printA())
	#print(str(pyresponse))
ser.close()
