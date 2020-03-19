FROM ubuntu:18.04
################################################################################
# https://minecraft.azureedge.net/bin-linux/bedrock-server-1.14.32.1.zip
COPY files/bedrock-server-1.14.32.1.zip /opt/minecraft_server.zip
################################################################################
RUN apt-get update && \
	apt-get -y upgrade && \
	apt-get -y install openssh-server unzip zip curl libcurl4 libcurl3-gnutls screen && \
	mkdir /run/sshd
################################################################################
RUN unzip /opt/minecraft_server.zip -d /opt/minecraft_server
################################################################################
COPY config/permissions.json /opt/minecraft_server/permissions.json
COPY config/server.properties /opt/minecraft_server/server.properties
################################################################################
ADD startServices.sh /opt/startServices.sh
RUN chmod 755 /opt/startServices.sh
################################################################################
CMD [ "/opt/startServices.sh" ]


# /usr/bin/screen -dmS MineCraft /opt/minecraft_server/startServer.sh


