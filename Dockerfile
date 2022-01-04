#FROM ubuntu
#RUN apt-get update
#RUN apt-get install -y apache2
#ADD . /var/www/html
#ENTRYPOINT apachectl -D FOREGROUND
#ENV name motosony 

FROM ubuntu
RUN apt-get update 
RUN apt-get install apache2 -y

## for apt to be noninteractive
ENV DEBIAN_FRONTEND=noninteractive
#ENV DEBCONF_NONINTERACTIVE_SEEN=true

## preesed tzdata, update package index, upgrade packages and install needed software
#ENV TZ=India/Mauritius
#RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN ln -snf /usr/share/zoneinfo/$CONTAINER_TIMEZONE /etc/localtime && echo $CONTAINER_TIMEZONE > /etc/timezone
ADD . /var/www/html
#CMD systemctl restart apache2
ENTRYPOINT apachectl -D FOREGROUND
#ENV name motosony
