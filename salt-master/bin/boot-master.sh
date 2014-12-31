#!/bin/bash

MASTER_CONFIG_FILE="/etc/salt/master"
MASTER_CONFIG_URL=${MASTER_CONFIG_URL:-}

if [ -n "$MASTER_CONFIG_URL" ]; then
	echo "Downloading master configuration file from: $MASTER_CONFIG_URL"
	wget $MASTER_CONFIG_URL -O $MASTER_CONFIG_FILE
fi

exec /usr/bin/supervisord -n -c /etc/supervisor/supervisord.conf