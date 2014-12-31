Docker Salt-Master
==================

Description
-----------
Docker image for salt-master

Run container
-------------
Run the master as a deamon

`docker run -p 4505:4505 -p 4506:4506 -d barryib/salt-master`

Run the master container with a given name

`docker run -p 4505:4505 -p 4506:4506 -d --name <SALT_MASTER_CONTAINER_NAME> barryib/salt-master`

Run the master with an external config file

`docker run -p 4505:4505 -p 4506:4506 -e "MASTER_CONFIG_URL=<CONFIG_URL>" barryib/salt-master`


