FROM ubuntu:22.04

RUN apt-get update && apt-get install -y --no-install-recommends \
	curl \
	openjdk-17-jdk \
	&& apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN mkdir /usr/mc \
	mkdir /usr/mc/mods

ADD https://mediafilez.forgecdn.net/files/5105/683/fabric-api-0.92.0%2B1.20.1.jar /usr/mc/mods
ADD https://mediafilez.forgecdn.net/files/5204/260/emi-1.1.4%2B1.20.1%2Bfabric.jar /usr/mc/mods

ADD https://meta.fabricmc.net/v2/versions/loader/1.20.1/0.15.9/1.0.0/server/jar /usr/mc/server.jar
RUN echo eula=true > /usr/mc/eula.txt

WORKDIR /usr/mc

ENTRYPOINT ["java", "-Xmx6G", "-Xms4G", "-jar", "server.jar", "nogui"]

