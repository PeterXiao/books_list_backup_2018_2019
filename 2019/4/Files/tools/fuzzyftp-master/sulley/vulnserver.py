#!/usr/bin/python
from sulley import *
import sys
import time

""" Receive banner when connecting to server. """
def banner(sock):
  sock.recv(1024)


""" Define data model. """
s_initialize("VulnserverDATA")
s_group("commands", values=['HELP', 'STATS', 'RTIME', 'LTIME', 'SRUN', 'TRUN', 'GMON', 'GDOG', 'KSTET', 'GTER', 'HTER', 'LTER', 'KSTAN', 'EXIT'])
s_block_start("CommandBlock", group="commands")
s_delim(' ')
s_string('fuzz')
s_static('\r\n')
s_block_end()


""" Keep session information if we want to resume at a later point. """
s = sessions.session(session_filename="audits/vulnserver.session")

""" Define state model. """
s.connect(s_get("VulnserverDATA"))

""" Define the target to fuzz. """
target         = sessions.target("192.168.1.126", 9999)
target.netmon  = pedrpc.client("192.168.1.126", 26001)
target.procmon = pedrpc.client("192.168.1.126", 26002)
target.procmon_options =  {
	"proc_name"      : "vulnserver.exe",
	"stop_commands"  : ['wmic process where (name="vulnserver.exe") delete'],
	"start_commands" : ['C:\\Users\\eleanor\\Desktop\\vulnserver\\vulnserver.exe'],
}


""" grab the banner from the server """
s.pre_send = banner

""" start fuzzing - define target and data """
s.add_target(target)
s.fuzz()

