#!/usr/bin/python
import subprocess
import sys
import binascii
import argparse


""" Input arguments. """
if len(sys.argv) != 3 and len(sys.argv) != 4 and len(sys.argv)!= 5:
  print "[*] You didn't specify the right command line arguments."
  print "Usage:\n"
  print "\t"+sys.argv[0]+" <pcap> <port> [<src_ip>] [<dst_ip>]"
  print
  exit(-1)

args = len(sys.argv)
if args == 3:
  pcap = sys.argv[1]
  port = sys.argv[2]
elif args == 4:
  pcap = sys.argv[1]
  port = sys.argv[2]
  srcip = sys.argv[3]
elif args == 5:
  pcap = sys.argv[1]
  port = sys.argv[2]
  srcip = sys.argv[3]
  dstip = sys.argv[4]


""" Use tshark to read pcap file. """
targs = []
targs.append("tshark")
targs.append("-r"+pcap)
#f = "-R (tcp.port=="+port+") && (tcp.len>0)"
#if args == 4: 
#  f=f+" && (ip.src == "+srcip+")"
#elif args == 5:
#  f=f+" && (ip.src == "+srcip+" and ip.dst == "+dstip+")"
targs.append("-R "+srcip+" && (tcp.port=="+port+") && (tcp.len>0)")
try:
  dstip
except NameError:
  pass
else:
  targs.append("-Tfields")
  #targs.append("-edata.data")
  for item in dstip.split(';'):
    targs.append("-e"+item)

print targs
p = subprocess.Popen(targs, stderr=subprocess.PIPE, stdout=subprocess.PIPE)

while True:
  """ Read a line of output from the tshark output- """
  out = p.stdout.readline()
  
  """ Print only non-empty lines."""
  if out != '':
    """ Parse the line appropriately and print printable characters. """
    chars = out.split(':')
    for c in chars:
      if c >= '20' and c <= '7e':
	try:
          cc = binascii.unhexlify(c)
	except:
	  pass
	sys.stdout.write(cc)
      else:
        sys.stdout.write('.')
    print

  """ When there is no more data, break out of infinite loop."""
  if out == '' and p.poll() != None:
    break
  
p.stdout.close()

