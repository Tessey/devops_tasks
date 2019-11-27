FROM ubuntu:latest

MAINTAINER Chris Fidao

ADD html /var/www/html

RUN apt-get update \
    && apt-get install -y apache2 \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* 
    
CMD ["apachectl", "-D", "FOREGROUND"]

EXPOSE 80
