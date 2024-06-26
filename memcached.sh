#1/bin/bash
sudo -i
yum update -y
yum install epel_release -y
yum install memcached -y
systemctl start memcached
systemctl enabled memcached
sed -i 's/127.7.0.1/0.0.0.0/g' /etc/sysconfig/memcached
systemctl restart memcached
systemctl start firewalld
systemctl enable firewalld
firewall-cmd --add-port=11211/tcp
firewall-cmd --runtime-to-permanent
firewall-cmd --add-port=11111/udp
firewall-cmd --runtime-to-permanent
memcached -p 11211 -U 11111 -u memcached -d
