jenkins-docker-setup
====================

Simple scripts to initialize an CI-environment with Docker

Currently create.sh sets up:
1. Jenkins master,
2. Jenkins slave
3. Oracle XE database for the slave to use.

And delete.sh stops and deletes the containers.

TODO:
# Make it so, that Jenkins master can be parametrized and set up separately.
# Fix the Swarm-setup on master. Slave can not currently register to the mastes, because master is lacking the Swarm-plugin.
# Add Firefox and Xvfb to the slave
