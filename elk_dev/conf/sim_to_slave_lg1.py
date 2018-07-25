#-*-coding:utf-8 -*-
import socket
import json
import sys
import time

#datem = { "主機代碼": "103", "應用系統代碼": "178", "RequestNumber": "00000001", "分公司代碼": "9157",        "客戶帳號": "12003904", "交易別": "1068", "IP1": "111", "IP2": "224", "IP3": "101",        "IP4": "110", "性別": "1", "Eng_1": "W", "委託交易時間": "2018-07-03 11:12:44", "執行時間": "2018-10-13 04:47:33", "回覆時間": "2018-07-03 11:12:44", "交易回應時間": "63", "ErrorCode": "10000006", "Client IP Address": "111.224.101.110", "身分證字號": "W100000001" }
#msg = {'@message': datem, '@tags': ['python', 'test(1000, 300000)']}
#lendatem=len(json.dumps(msg)+'\n')
datem = "2007-12-03T10:15:30.000||2007-12-03T10:16:30.000||255.255.255.255|| 0x000000000000F000||錯誤訊息不知道有多長||60.000||PostActionService||F123456789||W01||ABCD0000||ABCD0000000||ABCD000000||ABCD0000||ABCD0000||3001||255.255.255.255||A0||ABC000"
lendatem=len(datem+'\n')

HOST = '192.168.1.207'
PORT = 5300
batchcount = 30000

print "message size = "+str(lendatem)

counter = 1 + 4*1024*1024*1024 / (batchcount * lendatem)
start = time.time()
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

	for count in range(0, batchcount):
#		msg = {'@message': datem, '@tags': ['python', 'test('+str(loop)+','+str(count)+')']}
#		sock.send(json.dumps(msg)+'\n')
		sock.send(datem+'\n')
	sock.close()
	now = time.time()
	diff = now - then
	print HOST+":"+str(PORT)+", "+str(loop)+'/'+str(counter)+", "+str(int(batchcount/diff))+" per second."
elapsed = (time.time() - start)/60
print HOST+":"+str(PORT)+", "+str(elapsed)+" minutes elapsed."
sys.exit(0)
