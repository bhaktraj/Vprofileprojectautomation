#!/bin/bash
password='aadmin123'
sudo -i
# update you os
yum update -y
#install epel-release that will enable extra repositry so we can download more extra package
yum install epel-release -y
yum git zip unzip -y
# install mariadb server to run mysql 
yum install mariadb-server -y
systemctl start mariadb
systemctl enable mariadb
cd /tmp/
# download sourcecode 
git clone -b main https://github.com/hkhcoder/vprofile-project.git
#setup msql 
mysql -u root password "$password"
mysql -u root -p"$password" -e "DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1')"
mysql -u root -p"$password" -e "DELETE FROM mysql.user WHERE User=''"
mysql -u root -p"$password" -e "DELETE FROM mysql.db WHERE Db='test' OR Db='test\_%'"
mysql -u root -p"$password" -e "FLUSH PRIVILEGES"
mysql -u root -p"$password" -e "create database accounts"
mysql -u root -p"$password" -e "grant all privileges on accounts.* TO 'admin'@'localhost' identified by 'admin123'"
mysql -u root -p"$password" -e "grant all privileges on accounts.* TO 'admin'@'%' identified by 'admin123'"
mysql -u root -p"$password" accounts < /tmp/vprofile-project/src/main/resources/db_backup.sql
mysql -u root -p"$password" -e "FLUSH PRIVILEGES"
systemctl restart mariadb

systemctl start firewalld
systemctl enable firewalld
firewall-cmd --get-active-zones
firewall-cmd --zone=public --add-port=3306/tcp --permanent
firewall-cmd --reload
systemctl restart mariadb
