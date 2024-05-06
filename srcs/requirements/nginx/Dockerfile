FROM		debian:buster
#settin up all the apps 

RUN		apt-get update -y && apt-get upgrade -y && apt-get install -y \
		nginx \
		vim \
		curl \
		openssl

#requesting ssl certificate
RUN		mkdir -p /etc/nginx/ssl && \
		openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=IDF/L=Paris/L=Paris/O=42/OU=42/CN=login.42.fr/UID=login" 

#create nginx folder and copy the host conf file to container then give permissions
#to nginx root file and change owneship for all files to www.data
RUN		mkdir -p /var/run/nginx

COPY		./conf/nginx.conf /etc/nginx/nginx.conf

RUN		mkdir -p /var/www/html && \
		chmod 755 /var/www/html && \
		chown -R www-data:www-data /var/www/html

#run nginx when running the container
CMD		["nginx", "-g", "deamon off;"]
