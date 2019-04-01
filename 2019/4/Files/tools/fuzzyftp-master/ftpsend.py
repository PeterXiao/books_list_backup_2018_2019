#!/usr/bin/python

import socket
import sys
import os

# global variables
username = "anon"
password = "anon"

if len(sys.argv) != 3:
  print '\t[*] Usage: ' + sys.argv[0] + ' <host> <port>'
  sys.exit(1)

# read command line arguments
#filename = sys.argv[1]
host = sys.argv[1]
port = int(sys.argv[2])

# create socket
socket.setdefaulttimeout(1)
try:
  s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
  s.connect((host,port))
except socket.error:
  print "[*] Connection timed out: there is no service running on host "+str(host)+":"+str(port)
  exit(-1)

# receive welcome message
try:
  data = s.recv(1024)
  print "[*] CONNECT"
  print data,
except:
  print "[*] Cannot receive the welcome message."
  exit(-1)

# read the 'data_' files that were used to provoke a crash
files = []
for filename in os.listdir(os.getcwd()):
  if filename.startswith('data_'):
    files.append(filename)
files.sort()

# read the files one by one and send it to a FTP server
for filename in files:
  try:
    data = open(filename, 'r').read().rstrip('\n')
    data = data + '\r\n'
    print '\nftp> ' + data,
    s.send(data)
    print s.recv(1024),
  except:
    print "\n[*] Cannot send/receive data from a service - application crashed."
    exit(-1)

print '[*] DONE'

# close the socket
s.close()
