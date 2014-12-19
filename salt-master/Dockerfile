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
#RUN ln -s /bin/true /sbin/initctl

RUN apt-get install -y \
	salt-master \
	openssh-server 

RUN echo "root:salt-master" | chpasswd
RUN mkdir -p -m0755 /var/run/sshd

ADD ./supervisor-salt.conf /etc/supervisor/conf.d/

EXPOSE 4505 4506

CMD ["/usr/bin/supervisord", "-n", "-c", "/etc/supervisor/supervisord.conf"]  