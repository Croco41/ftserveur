#!/bin/bash

openssl req -newkey rsa:2048 -x509 -sha256 -days 364 -nodes -subj '/C=FR/ST=66/L=Prades/O=yoyo/OU=cgranja/CN=localhost' -out /etc/ssl/nginxcertificate.crt -keyout /etc/ssl/nginxkey.key


if [ $AUTOINDEX = "off" ] 
	then
		sed -i "s/autoindex on/autoindex off/g" /etc/nginx/sites-available/default		
elif [ $AUTOINDEX = "on" ] 
	then
		sed -i "s/autoindex off/autoindex on/g" /etc/nginx/sites-available/default
fi

service mysql start
# Configure a wordpress database
echo "CREATE DATABASE wordpress;"| mysql -u root --skip-password
# Making root account which can access to all tables in wordpress schema. And we skipped password by using mysql -u root — skip-password
echo "GRANT ALL PRIVILEGES ON wordpress.* TO 'root'@'localhost' WITH GRANT OPTION;"| mysql -u root --skip-password
echo "FLUSH PRIVILEGES;"| mysql -u root --skip-password
echo "update mysql.user set plugin='' where user='root';"| mysql -u root --skip-password

# Start services
service php7.3-fpm start
service nginx start

bash
