import socket
import json
import sys
import time

datem = { "apid":551, "RequestNumber":300001, "Code": 9807, "CustId": 72752308, "TranCode": 7288, "IP1": 231, "IP2": 233, "IP3": 205, "IP4": 127, "gender": 2, "Eng_1": "G", "dele_time": "2018-06-26 17:47:32", "exec_time": "2018-06-26 17:47:34", "resp_time": "2018-06-26 17:47:36", "ClientIP": "231.233.205.127", "uid": "G200300001" }
HOST = '192.168.1.200'
PORT = 5000
msg = {'@message': datem, '@tags': ['python', 'test(1000, 300000)']}
lendatem=len(json.dumps(msg)+'\n')

print "len(message)="+str(lendatem)

counter = 1 + 4*1024*1024*1024 / (30000 * lendatem)
#counter = 10
for loop in range(0,counter):
	then = time.time()
	try:
		sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
	except socket.error, msg:
		sys.stderr.write("[ERROR] %s\n" % msg[1])
		sys.exit(1)

	try:
		sock.connect((HOST, PORT))
	except socket.error, msg:
		sys.stderr.write("[ERROR] %s\n" % msg[1])
		sys.exit(2)

	print "total records to send:"+str(counter)
	for count in range(0, 30000):
		msg = {'@message': datem, '@tags': ['sim_1', 'test('+str(loop)+','+str(count)+')']}
		sock.send(json.dumps(msg)+'\n')
	sock.close()
	now = time.time()
	diff = now - then
	print "total counter="+str(loop)+'/'+str(counter)+", "+str(int(30000/diff))+" per second."
sys.exit(0)
