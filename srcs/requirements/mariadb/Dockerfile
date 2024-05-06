FROM		alpine:3.12

RUN		apk update && apk upgrade \
		apk install mariadb-server \
		vim \
		curl \

RUN		mysql_secure_installation 

