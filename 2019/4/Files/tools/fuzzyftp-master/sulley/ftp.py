#!/usr/bin/python

import sys
import time
from sulley import *


#######################################################################
""" Receive banner when connecting to server. """
def banner(sock):
  sock.recv(1024)

#######################################################################
"""
#################
## Data model. ##
#################
"""

""" Non-fuzzed commands used as preconditions to other commands. """
s_initialize('DataUSER')
s_static('USER anon\r\n')

s_initialize('DataPASS')
s_static('PASS anon\r\n')

s_initialize('DataPORT')
s_static('PORT 127,0,0,1,4,1\r\n')

s_initialize('DataPASV')
s_static('PASV\r\n')

s_initialize('DataREST')
s_static('REST 9999\r\n')

s_initialize('DataRNFR')
s_static('RNFT test\r\n')

s_initialize('DataQUIT')
s_static('QUIT\r\n')



""" User/Pass commands. """
s_initialize('AUSER')
s_static('USER')
s_delim(' ')
s_string('fuzz')
s_static('\r\n')

s_initialize('APASS')
s_static('PASS')
s_delim(' ')
s_string('fuzz')
s_static('\r\n')

s_initialize('AHELP')
s_static('HELP')
s_delim(' ')
s_string('fuzz')
s_static('\r\n')

s_initialize('AACCT')
s_static('ACCT')
s_delim(' ')
s_string('fuzz')
s_static('\r\n')

s_initialize('AHOST')
s_static('HOST')
s_delim(' ')
s_string('fuzz')
s_static('\r\n')

s_initialize('AAUTH')
s_static('AUTH')
s_delim(' ')
s_string('fuzz')
s_static('\r\n')

s_initialize('AADAT')
s_static('ADAT')
s_delim(' ')
s_string('fuzz')
s_static('\r\n')

s_initialize('APBSZ')
s_static('PBSZ')
s_delim(' ')
s_string('fuzz')
s_static('\r\n')

s_initialize('APROT')
s_static('PROT')
s_delim(' ')
s_string('fuzz')
s_static('\r\n')



""" Standard commands. """
s_initialize('DataSet1')
s_group('commands1', values=['HELP', 'ACCT', 'CWD', 'SMNT', 'RETR', 'STOR', 'STOU', 'APPE', 'REST', 'RNFR', 'RNTO', 'DELE', 'RMD', 'MKD', 'SITE', 'HOST', 'AUTH', 'ADAT', 'ALGS', 'OPTS', 'MDTM', 'SIZE', 'XRMD', 'XMKD', 'XCWD', 'STRU', 'MODE', 'PROT', 'STAT', 'NLST', 'LIST', 'MLST', 'MLSD', 'CDUP', 'REIN', 'PASV', 'ABOR', 'SYST', 'NOOP', 'CCC', 'LPSV', 'XPWD', 'PWD', 'XCUP', 'QUIT'])
s_block_start('Datablock1', group='commands1')
s_delim(' ')
s_string('fuzz')
s_static('\r\n')
s_block_end()

""" Base64 commands. """
s_initialize('DataSet2')
s_group('commands2', values=['MIC', 'CONF', 'ENC'])
s_block_start('DataBlock2', group='commands2')
s_static('\r\n')
s_block_end()



""" Special commands. """
s_initialize('PORT')
s_static('PORT')
s_delim(' ')
s_byte(0, format="ascii", signed=False)
s_delim(',')
s_byte(0, format="ascii", signed=False)
s_delim(',')
s_byte(0, format="ascii", signed=False)
s_delim(',')
s_byte(0, format="ascii", signed=False)
s_delim(',')
s_byte(0, format="ascii", signed=False)
s_delim(',')
s_byte(0, format="ascii", signed=False)
s_static('\r\n')

s_initialize('LPRT')
s_static('LPRT')
s_delim(' ')
s_byte(0, format="ascii", signed=False)
s_delim(',')
s_byte(0, format="ascii", signed=False)
s_delim(',')
s_byte(0, format="ascii", signed=False)
s_delim(',')
s_byte(0, format="ascii", signed=False)
s_delim(',')
s_byte(0, format="ascii", signed=False)
s_delim(',')
s_byte(0, format="ascii", signed=False)
s_delim(',')
s_byte(0, format="ascii", signed=False)
s_delim(',')
s_byte(0, format="ascii", signed=False)
s_delim(',')
s_byte(0, format="ascii", signed=False)
s_static('\r\n')

s_initialize('LANG')
s_static('LANG')
s_delim(' ')
s_string('fuzz', size=2)
s_delim('-')
s_string('fuzz', size=2)
s_static('\r\n')


s_initialize('EPRT')
s_static('EPRT')
s_delim(' ')
s_delim('|')
s_byte(0, format="ascii", signed=False)
s_delim('|')
s_byte(0, format="ascii", signed=False)
s_delim('.')
s_byte(0, format="ascii", signed=False)
s_delim('.')
s_byte(0, format="ascii", signed=False)
s_delim('.')
s_byte(0, format="ascii", signed=False)
s_delim('|')
s_word(0, format="ascii", signed=False)
s_static('\r\n')

s_initialize('EPSV')
s_static('EPSV')
s_delim(' ')
s_byte(0, format="ascii", signed=False)
s_delim('.')
s_byte(0, format="ascii", signed=False)
s_delim('.')
s_byte(0, format="ascii", signed=False)
s_delim('.')
s_byte(0, format="ascii", signed=False)
s_static('\r\n')

s_initialize('PBSZ')
s_static('PBSZ')
s_delim(' ')
s_qword(0, format="ascii", signed=False)
s_static('\r\n')


s_initialize('ALLO1')
s_static('ALLO')
s_delim(' ')
s_qword(0, format="ascii", signed=False)
s_static('\r\n')

s_initialize('ALLO2')
s_static('ALLO')
s_delim(' ')
s_qword(0, format="ascii", signed=False)
s_delim(' ')
s_static('R')
s_delim(' ')
s_qword(0, format="ascii", signed=False)
s_static('\r\n')


s_initialize('TYPE1')
s_static('TYPE')
s_delim(' ')
s_static('A')
s_delim(' ')
s_string('fuzz')
s_static('\r\n')

s_initialize('TYPE2')
s_static('TYPE')
s_delim(' ')
s_static('E')
s_delim(' ')
s_string('fuzz')
s_static('\r\n')

s_initialize('TYPE3')
s_static('TYPE')
s_delim(' ')
s_string('fuzz')
s_static('\r\n')

s_initialize('TYPE4')
s_static('TYPE')
s_delim(' ')
s_static('L')
s_delim(' ')
s_word(0, format="ascii", signed=False)
s_static('\r\n')


""" Dependencies commands. """
s_initialize('APPE')
s_static('APPE')
s_delim(' ')
s_string('fuzz')
s_static('\r\n')

s_initialize('STOR')
s_static('STOR')
s_delim(' ')
s_string('fuzz')
s_static('\r\n')

s_initialize('NLST')
s_static('NLST')
s_delim(' ')
s_string('fuzz')
s_static('\r\n')

s_initialize('LIST')
s_static('LIST')
s_delim(' ')
s_string('fuzz')
s_static('\r\n')

s_initialize('RETR')
s_static('RETR')
s_delim(' ')
s_string('fuzz')
s_static('\r\n')

s_initialize('STOU')
s_static('STOU')
s_delim(' ')
s_string('fuzz')
s_static('\r\n')

s_initialize('RNTO')
s_static('RNTO')
s_delim(' ')
s_string('fuzz')
s_static('\r\n')





#######################################################################
""" Keep session information if we want to resume at a later point. """
s = sessions.session(session_filename="audits/ftp.session")

""""Define state model."""
# commands directly accessible without login
#s.connect(s_get('AUSER'))
s.connect(s_get('AUSER'))
s.connect(s_get('APASS'))
s.connect(s_get('AUSER'), s_get('APASS'))
s.connect(s_get('AHELP'))
s.connect(s_get('AACCT'))
s.connect(s_get('APROT'))
s.connect(s_get('APBSZ'))
s.connect(s_get('AHOST'))
s.connect(s_get('AAUTH'))
s.connect(s_get('AADAT'))
# authenticated commands
s.connect(s_get('DataUSER'))
s.connect(s_get('DataUSER'), s_get('DataPASS'))

s.connect(s_get('DataPASS'), s_get('DataSet1'))
s.connect(s_get('DataPASS'), s_get('PORT'))
s.connect(s_get('DataPASS'), s_get('TYPE1'))
s.connect(s_get('DataPASS'), s_get('TYPE2'))
s.connect(s_get('DataPASS'), s_get('TYPE3'))
s.connect(s_get('DataPASS'), s_get('TYPE4'))
s.connect(s_get('DataPASS'), s_get('ALLO1'))
s.connect(s_get('DataPASS'), s_get('ALLO2'))
s.connect(s_get('DataPASS'), s_get('PBSZ'))
s.connect(s_get('DataPASS'), s_get('EPRT'))
s.connect(s_get('DataPASS'), s_get('EPSV'))
s.connect(s_get('DataPASS'), s_get('LANG'))
s.connect(s_get('DataPASS'), s_get('EPRT'))

# special order of commands
# PASS
s.connect(s_get('DataPASS'), s_get('DataPASV'))
s.connect(s_get('DataPASV'), s_get('APPE'))
s.connect(s_get('DataPASV'), s_get('STOR'))
s.connect(s_get('DataPASV'), s_get('NLST'))
s.connect(s_get('DataPASV'), s_get('LIST'))
s.connect(s_get('DataPASV'), s_get('RETR'))
s.connect(s_get('DataPASV'), s_get('STOU'))
# PORT
s.connect(s_get('DataPASS'), s_get('DataPORT'))
s.connect(s_get('DataPORT'), s_get('APPE'))
s.connect(s_get('DataPORT'), s_get('STOR'))
s.connect(s_get('DataPORT'), s_get('NLST'))
s.connect(s_get('DataPORT'), s_get('LIST'))
s.connect(s_get('DataPORT'), s_get('RETR'))
s.connect(s_get('DataPORT'), s_get('STOU'))
# REST
s.connect(s_get('DataPASS'), s_get('DataREST'))
s.connect(s_get('DataREST'), s_get('APPE'))
s.connect(s_get('DataREST'), s_get('STOR'))
s.connect(s_get('DataREST'), s_get('RETR'))
# RNFR
s.connect(s_get('DataPASS'), s_get('DataRNFR'))
s.connect(s_get('DataRNFR'), s_get('RNTO'))




#######################################################################
""" Define the target to fuzz. """
target         = sessions.target("10.1.1.182", 21)
target.netmon  = pedrpc.client("10.1.1.182", 26001)
target.procmon = pedrpc.client("10.1.1.182", 26002)
target.procmon_options =  {
	"proc_name"      : "SlimFTPd.exe",
	"stop_commands"  : ['wmic process where (name="SlimFTPd.exe") delete'],
	#"start_commands" : ['C:\\Users\\eleanor\\Desktop\\slimftp3.15b\\SlimFTPd.exe'],
  "start_commands" : ['C:\\Documents and Settings\\eleanor\\Desktop\\slimftp\\slimftp3.15\\SlimFTPd.exe'],
}

""" grab the banner from the server """
s.pre_send = banner

""" start fuzzing - define target and data """
s.add_target(target)
s.fuzz()




