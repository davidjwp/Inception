FROM		alpine:3.12
#settin up all the apps 
RUN		apk update && apk upgrade && apk add \
		nginx \
		vim \
		curl \
		openssl
#requesting ssl certificate
RUN		mkdir -p /etc/nginx/ssl && \
		openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=IDF/L=Paris/L=Paris/O=42/OU=42/CN=login.42.fr/UID=login" 

RUN		mkdir -p /var/run/nginx

