#!/bin/bash

MINION_CONFIG_FILE="/etc/salt/minion"
MINION_CONFIG_URL=${MINION_CONFIG_URL:-}

[ -n "$MINION_PORT_4505_TCP_ADDR" ] && MASTER_TCP_IP=$MINION_PORT_4505_TCP_ADDR || MASTER_TCP_IP=$MASTER_IP

if [ -n "$MINION_CONFIG_URL" ]; then
	echo "Downloading minion configuration file from: $MINION_CONFIG_URL"
	wget $MINION_CONFIG_URL -O $MINION_CONFIG_FILE
elif [ -n "$MASTER_TCP_IP" ]; then
	sed -e "s/#master: salt/master: $MASTER_TCP_IP/g" \
	    -i $MINION_CONFIG_FILE
fi

exec /usr/bin/supervisord -n -c /etc/supervisor/supervisord.conf