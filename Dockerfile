FROM python:3.5

#Create volume to mount program directory
VOLUME /data

WORKDIR /data

#Install vim
RUN apt-get -y update && apt-get -y install vim
