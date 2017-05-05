# Change the FROM depending on your raspberry pi, the relevant section
# should be raspberrypi, raspberrypi2, or raspberrypi3
# Also switching to Debian Jessie. If you want Wheezy, change here and below too
FROM resin/raspberrypi3-debian:jessie
MAINTAINER justin@dray.be

# Let's start with some basic stuff.
RUN apt-get update && apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    lxc \
    iptables

# Install Docker from hypriot repos and add AUFS Tools for resinOS 2.0
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 37BBEE3F7AD95B3F && \
    echo "deb https://packagecloud.io/Hypriot/Schatzkiste/debian/ jessie main" > /etc/apt/sources.list.d/hypriot.list && \
    apt-get update && \
    apt-get install -y docker-hypriot docker-compose aufs-tools

COPY ./wrapdocker /usr/local/bin/wrapdocker

COPY ./apps /apps
WORKDIR /apps

# Define additional metadata for our image.
VOLUME /var/lib/docker
ADD start /start
CMD /start
