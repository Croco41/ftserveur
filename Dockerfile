# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: cgranja <cgranja@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/06/18 15:53:13 by cgranja           #+#    #+#              #
#    Updated: 2021/07/05 19:34:23 by cgranja          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#env. debian buster
FROM debian:buster

ENV AUTOINDEX off

RUN apt-get update -y

RUN apt-get upgrade -y

#install php
RUN apt-get -y install php7.3-fpm php7.3-common php7.3-mysql php7.3-gmp php7.3-curl php7.3-intl php7.3-xmlrpc php7.3-xml php7.3-cli php7.3-zip php7.3-soap php7.3-mbstring php7.3-imap php7.3-gd

#used to get .tar file of phpmyadmin and wordpress
RUN apt-get -y install wget
#install nginx
RUN apt-get -y install nginx
#install MYSQL-mariadb
RUN apt-get -y install mariadb-server

#swap the default file by my confnginx file
COPY ./srcs/nginx.conf /etc/nginx/sites-available/default
#lien symbolique
#RUN ln -s /etc/nginx/sites-available/default /etc/nginx/sites-enabled

#install phpmyadmin
WORKDIR /var/www/localhost/

RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.1.0/phpMyAdmin-5.1.0-english.tar.gz
RUN tar -xf phpMyAdmin-5.1.0-english.tar.gz && rm -rf phpMyAdmin-5.1.0-english.tar.gz
RUN mv phpMyAdmin-5.1.0-english phpmyadmin

COPY ./srcs/config.inc.php phpmyadmin
RUN rm /var/www/localhost/phpmyadmin/config.sample.inc.php

#Install Wordpress
RUN wget https://wordpress.org/latest.tar.gz
RUN tar -xvzf latest.tar.gz && rm -rf latest.tar.gz
RUN rm /var/www/localhost/wordpress/wp-config-sample.php

COPY ./srcs/wp-config.php /var/www/localhost/wordpress

COPY ./srcs/start.sh /var/www/

#Change rights
RUN chown -R www-data:www-data /var/www/localhost && \
    chmod 755 -R /var/www/localhost && \
    chmod 777 /var/www/start.sh

CMD bash /var/www/start.sh


#docker build -t ft_server.
#docker run -it -p 80:80 -p 443:443 AUTOINDEX=on ft_server
#docker container prune
#docker ps -a
#docker rmi $(docker images -a -q)
