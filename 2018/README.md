
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




