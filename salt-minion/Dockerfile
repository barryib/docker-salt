FROM debian:wheezy
MAINTAINER Thierno IB. BARRY

ADD ./sources.list /etc/apt/sources.list
RUN apt-get update && apt-get install -y \
	wget \
	sudo \
	supervisor

RUN echo "deb http://debian.saltstack.com/debian wheezy-saltstack main" > /etc/apt/sources.list.d/saltstack.list \
	&& wget -q -O- "http://debian.saltstack.com/debian-salt-team-joehealy.gpg.key" | apt-key add - \
	&& apt-get -y -q update

# Keep upstart from complaining
RUN dpkg-divert --local --rename --add /sbin/initctl

RUN apt-get install -y salt-minion

ADD ./supervisor-salt.conf /etc/supervisor/conf.d/

# Copy build files to container root
RUN mkdir /app
ADD . /app

RUN chmod +x /app/bin/boot-minion.sh

ENTRYPOINT ["/app/bin/boot-minion.sh"]