Docker Salt-Minion
==================

Description
-----------
Docker image for salt-minion

Run container
-------------
Link the minion with a salt-master container

`docker run --link <SALT_MASTER_CONTAINER_NAME>:minion barryib/salt-minion`

Run the minion container by seting its hostname

`docker run --link <SALT_MASTER_CONTAINER_NAME>:minion -h <MINION_HOSTNAME> barryib/salt-minion`

Run the minion with an external config file

`docker run -e "MINION_CONFIG_URL=<CONFIG_URL>" barryib/salt-minion`


