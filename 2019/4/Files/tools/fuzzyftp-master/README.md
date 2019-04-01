Introduction
========

I created this project as part of my thesis, where I presented computer security
and it’s importance in the modern world. I tested the fuzzyftp on different FTP
servers with a goal of finding existing vulnerabilities to prove that fuzzyftp can
be used to find vulnerabilities in real world FTP servers. 

The table below presents the FTP servers and existing vulnerabilities that I was able 
to detect with Peach and Sulley FTP input file. The first column presents the FTP
server and version I was testing, the second column presents an existing vulnerability,
where the third and forth columns present the numbers 0 or 1 based on whether the 
vulnerability was found by Sulley or Peach (by using my input files defining FTP
protocol).


| FTP Server       | Known Vulnerabilities | Sulley | Peach |
| ---------------- | --------------------- | ------ | ----- |
| SlimFTPd 3.15    | CWD                   | 0      | 1     |
|                  | STOR                  | 0      | 1     |
|                  | MKD                   | 0      | 1     |
|                  | STAT                  | 0      | 1     |
|                  | Other                 | 0      | 10    |
|                  | None                  | 0      | 0     |
| EasyFTP 1.7.0.11 | CWD                   | 1      | 1     |
|                  | LIST                  | 1      | 1     |
|                  | MKD                   | 1      | 1     |
|                  | DELE                  | 1      | 1     |
|                  | STOR                  | 1      | 1     |
|                  | RNFR                  | 1      | 1     |
|                  | RMD                   | 1      | 1     |
|                  | XRMD                  | 1      | 1     |
|                  | NLST                  | 1      | 1     |
|                  | APPE                  | 1      | 1     |
|                  | RETR                  | 1      | 1     |
|                  | SIZE                  | 1      | 1     |
|                  | XCWD                  | 1      | 1     |
| Cesar FTP 0.99g  | MKD                   | 0      | 1     |
| Serv-U 4.1.0.0   | MDTM                  | 0      | 0     |

From the table above, we can see that Peach found more vulnerabilities than Sulley
by using the same specification of the FTP protocol.

This repository holds the following files for presenting the FTP protocol:
* [Sulley FTP Input File](https://github.com/dejanlukan/fuzzyftp/blob/master/sulley/ftp.py)
* [Peach  FTP Input File](https://github.com/dejanlukan/fuzzyftp/blob/master/peach/ftp.xml)

Aditionally, the repository also contains input files for [Vulnserver](http://www.thegreycorner.com/2010/12/introducing-vulnserver.html):
* [Sulley Vulnserver Input File](https://github.com/dejanlukan/fuzzyftp/blob/master/sulley/vulnserver.py)
* [Peach  Vulnserver Input File](https://github.com/dejanlukan/fuzzyftp/blob/master/peach/vulnserver.xml)


Usage 
========

To use the input files into the Sulley/Peach generic fuzzers, you first have to
download the fuzzers. The instructions for downloading the fuzzers:
* [Sulley](http://resources.infosecinstitute.com/sulley-fuzzing/)
* [Peach](http://peachfuzzer.com/v3/Installation.html)


If we would like to use Peach, we need to follow these steps:

1. Install Peach agent on computer where FTP server is running.

2. Install Peach on computer from where we'll be testing the FTP server (can be the same computer).

3. Edit the ftp.xml and change the IP address of the Peach agent as well as the command that will restart the FTP server once it becomes unavailable (on crash).
```xml
<Agent name="AgentRemote" location="http://10.1.1.169:9001">
<Monitor name="AgentDebugger" class="debugger.WindowsDebugEngine">
    <Param name="CommandLine" value="C:\Users\eleanor\Desktop\easyftp\ftpbasicsvr.exe /nontservice" />
</Monitor>
</Agent>
```
4. Run Peach and wait for a crash, which will be logged and we can take a look at it later.
```
# python peach.py ftp.xml
```


