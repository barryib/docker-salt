Docker Salt-Minion
==================

Description
-----------
Docker image for salt-minion

Run container
-------------
`docker run --link <SALT_MASTER_CONTAINER_NAME>:minion barryib/salt-minion`

To set the minion hostname

`docker run --link <SALT_MASTER_CONTAINER_NAME>:minion -h <MINION_HOSTNAME> barryib/salt-minion`

To use a particular config file

`docker run -e "MINION_CONFIG_URL=<CONFIG_URL>" barryib/salt-minion`


