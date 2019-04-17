#!/bin/bash
apt update -y
apt-get install unzip -y
apt install lamp-server^ -y
mysql -u root -p -Bse "CREATE DATABASE wordpressdb;CREATE USER wordpressuser@localhost IDENTIFIED BY 'wordpresspassword';GRANT ALL PRIVILEGES ON wordpressdb.* TO wordpressuser@localhost; FLUSH PRIVILEGES;"
cd /tmp
wget http://wordpress.org/latest.zip
unzip -q latest.zip -d /var/www/html/
chown -R www-data:www-data /var/www/html/wordpress
chmod -R 755 /var/www/html/wordpress
mkdir -p /var/www/html/wordpress/wp-content/uploads
chown -R www-data:www-data /var/www/html/wordpress/wp-content/uploads 
service apache2 restart
