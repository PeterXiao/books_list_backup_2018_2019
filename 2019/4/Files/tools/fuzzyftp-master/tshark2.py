#!/usr/bin/python
import subprocess
import sys
import binascii
import argparse
import textwrap
import os
import fnmatch

def hex_output(line):
  """ Print only non-empty lines."""
  if line != '':
    """ Parse the line appropriately and print printable characters. """
    chars = line.split(':')
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

def ascii_output(line):
  if line != '':
    print line

def tshark(pcap, mfilter, port, mformat, fields, quiet):
  """ Use tshark to read pcap file. """
  targs = []
  targs.append("tshark")
  targs.append("-r"+pcap)
  targs.append("-R "+mfilter+" && (tcp.port=="+port+") && (tcp.len>0)")

  if fields != None:
    targs.append("-Tfields")
    for item in fields.split(';'):
      targs.append("-e"+item)
  
  if not quiet:
    print targs
 
  p = subprocess.Popen(targs, stderr=subprocess.PIPE, stdout=subprocess.PIPE)
  
  print "|",
  while True:
    """ Read a line of output from the tshark output- """
    out = p.stdout.readline()
  
    if mformat == "hex":
      hex_output(out)
    elif mformat == "ascii":
      ascii_output(out)
  
    """ When there is no more data, break out of infinite loop."""
    if out == '' and p.poll() != None:
      break
    
  print "|",
  p.stdout.close()
  




"""
Main Function
"""
if __name__ == "__main__":
  """
  Parse command line arguments.
  """
  parser = argparse.ArgumentParser(
    formatter_class=argparse.RawDescriptionHelpFormatter,
    epilog = textwrap.dedent('''\
      \tExamples:
      \t\t./tshark.py -r log.pcap -p 21 -R 'ftp.request.command' -e 'ftp.request.command;ftp.request.arg' -f ascii 
      \t\t./tshark.py -r log.pcap -p 9999 -R '(tcp.port==9999) && (ip.src == 10.1.1.176)' -e 'data.data' -f hex 
    ''')
  )

  parser.add_argument(
    '-r', 
    '--infile', 
    dest='mfile', 
    nargs=1, 
    required=False, 
    help='Set the filename to read from.')
  parser.add_argument(
    '-R', 
    '--filter', 
    dest='mfilter', 
    nargs=1, 
    required=True, 
    help='Packet filter in Wireshark display filter syntax.')
  parser.add_argument(
    '-p', 
    '--port', 
    dest='port',
    nargs=1, 
    required=True,
    help='Set the port on which to filter.')
  parser.add_argument(
    '-e', 
    '--fields',
    dest='fields',
    nargs=1,
    required=False,
    help='Fields to print if -Tfields selected. Multiple fields are separated by \';\'.')
  parser.add_argument(
    '-f',
    '--format',
    dest='mformat',
    nargs=1,
    required=False,
    help='In which format the tshark outputs the pcap file: hex, ascii.')
  parser.add_argument(
    '-d',
    '--dir',
    dest='mdir',
    nargs=1,
    required=False,
    help='Specify the directory that contains pcap files. They will all be read one by one.')
  parser.add_argument(
    '-q',
    '--quiet',
    dest='quiet',
    action='store_true',
    help='Don\'t print the tshark array used with python subprocess command.')


  args = parser.parse_args()


  if args.mdir and args.mfile:
    print "[*] Specify either the -r or -d argument, not both."
    exit(-1)

  """ Parse the PCAP file """
  if not args.fields:
    args.fields = [None]
  
  if not args.mformat:
    args.mformat = ['ascii']

  if args.mdir:
    if args.mdir[0][-1] != '/':
      args.mdir[0] += '/'

    for filename in os.listdir(args.mdir[0]):
      if fnmatch.fnmatch(filename, '*'+'.pcap'):
        tshark(args.mdir[0]+filename, args.mfilter[0], args.port[0], args.mformat[0], args.fields[0], args.quiet)
  else:
    tshark(args.mfile[0], 
      args.mfilter[0], 
      args.port[0], 
      args.mformat[0],
      args.fields[0], 
      args.quiet)


