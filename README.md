# blog
some blog coding thinking or rethinking


# JAVA_LINE
JAVA进阶相关书籍：《JAVA并发编程实践》、《Linux Shell脚本攻略》、《spring揭秘 精选版》、《高性能Mysql》、《深入理解Java虚拟机[JVM高级特性与最佳实践](周志明)》、《图解HTTP 彩色版》、《图解TCP_IP_第5版》、《head+first+servlets jsp》、《How Tomcat Works 中文版》、《J2EE核心模式》、《JAVA并发编程实践》

图解TCP_IP_第5版.pdf https://download.csdn.net/download/singgel/10575268

JAVA并发编程实践 https://download.csdn.net/download/singgel/10575062

J2EE核心模式.pdf https://download.csdn.net/download/singgel/10575054

head+first+servlets jsp https://download.csdn.net/download/singgel/10575054

深入理解Java虚拟机[JVM高级特性与最佳实践](周志明) https://download.csdn.net/download/singgel/10575034

从PAXOS到ZOOKEEPER分布式一致性原理与实践 https://download.csdn.net/download/singgel/10575025

effective java https://download.csdn.net/download/singgel/10575008

深入浅出MyBatis技术原理与实战 https://download.csdn.net/download/singgel/10616746

大型网站系统及Java中间件实践 https://download.csdn.net/download/singgel/10621351

深入分析Java Web技术内幕 https://download.csdn.net/download/singgel/10623623

HotSpot实战 https://download.csdn.net/download/singgel/10623740

Java多线程编程核心技术 https://download.csdn.net/download/singgel/10623743

Spring源码深度解析 https://download.csdn.net/download/singgel/10623766

深入解析Spring架构与设计原理 https://download.csdn.net/download/singgel/10637765


Server IP: 45.62.100.172
PSK      : teddysun.com
Username : teddysun
Password : TDHMOupagzmx


 wget https://git.io/vpnsetup-centos -O vpnsetup.sh && sudo sh vpnsetup.sh
 myusername  mypassword *

 {
  "server": "*****",
  "server_port": 28888,
  "local_address": "127.0.0.1",
  "local_port": 1080,
  "password": "******",
  "timeout": 300,
  "method":"aes-256-cfb",
}

 11946

# /sbin/service iptables start
//启动iptables
# iptables -t nat -A POSTROUTING -o eth0 -s 192.168.2.0/24 -j SNAT --to-source 45.62.100.172
//设置转发功能 -o eth0制定网卡
// xxx.xxx.xxx.xxx为公网ip
# /etc/init.d/iptables save
//保存iptables的转发规则
# /sbin/service iptables restart
//重新启动iptables
# service pptpd start

docker pull openzipkin/zipkin-elasticsearch5

https://github.com/PeterXiao/Java11.git


codegen +yaml 代碼生成

對比與規範

性能與有效性


pingtai

現眼驗證

數據預估與隔離

數據與孤寂



-Xmx640M -Xms640M -Xmn192M -XX:MaxMetaspaceSize=128M -XX:MetaspaceSize=128M -XX:+UseParallelGC -XX:+UseAdaptiveSizePolicy -XX:MaxGCPauseMillis=100
-Xms512m -Xmx512m -XX:PermSize=64M -XX:MaxPermSize=128m
-Xmx320M -Xms320M -Xmn64M -XX:MaxMetaspaceSize=64M -XX:MetaspaceSize=64M -XX:+UseParallelGC -XX:+UseAdaptiveSizePolicy -XX:MaxGCPauseMillis=100
-Xms512m -Xmx512m -XX:PermSize=64M -XX:MaxPermSize=128m -Djava.awt.headless=true

-Xmx16384M -Xms16384M -XX:MaxMetaspaceSize=512M -XX:MetaspaceSize=512M -XX:+UseG1GC -XX:MaxGCPauseMillis=100 -XX:+ParallelRefProcEnabled


