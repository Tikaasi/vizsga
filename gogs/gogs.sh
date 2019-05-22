#!/bin/bash
apt-get update -y
adduser git --gecos "git,,," --disabled-password
echo "git:123" | chpasswd
apt-get -y install mc nmap git
wget https://dl.gogs.io/0.11.86/gogs_0.11.86_linux_amd64.tar.gz
tar xvf gogs_0.11.86_linux_amd64.tar.gz
mkdir /var/log/gogs
chown -R git:git /var/log/gogs/
cp gogs/scripts/systemd/gogs.service /etc/systemd/systemd
rsync -avz gogs/* /home/git/
chown -R git:git /home/git/
setcap CAP_NET_BIND_SERVICE=+eip /home/git/gogs
mv /etc/systemd/system/gogs.service /etc/systemd/system/gogs.serviceold
cp gogs.service /etc/systemd/system/gogs.service 
systemctl daemon-reload
systemctl start gogs
systemctl enable gogs
mkdir /home/git/conf
mv /home/git/conf/app.ini /home/git/conf/appold.ini
cp app.ini /home/git/conf
