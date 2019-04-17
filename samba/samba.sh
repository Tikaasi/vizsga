#!/bin/bash
apt-get update -y
mv /etc/hostname /etc/hostname.old
cp hostname /etc/
mv /etc/hosts /etc/hosts.old
cp hosts /etc
apt-get install samba -y
mkdir /srv/kozos
chmod 777 /srv/kozos
mkdir /srv/readonly
chmod 755 /srv/readonly
mv /etc/samba/smb.conf /etc/samba/smb.conf.old
cp smb.conf /etc/samba/smb.conf
service smbd restart
useradd user2 -c "user2" -g users -m -d /home/user2 -s /bin/bash
passwd user2 
mkdir /srv/user2
chown user2 /srv/user2
chmod 700 /srv/user2
smbpasswd -a user2
sudo service smbd restart
ifconfig
