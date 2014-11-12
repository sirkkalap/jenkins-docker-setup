#!/bin/bash
set -e

jenkins_master_cid=$(docker run -d \
    -p 49080:8080 \
    --cidfile=jenkins_master.cid \
    csanchez/jenkins-swarm)
jenkins_master_name=$(docker inspect --format='{{.Name}}' $jenkins_master_cid)

oracle_xe_cid=$(docker run -d \
    --cidfile=oracle.cid \
    alexeiled/docker-oracle-xe-11g)
oracle_xe_name=$(docker inspect --format='{{.Name}}' $oracle_xe_cid)

jenkins_slave_cid=$(docker run -d \
    --cidfile=jenkins_slave.cid \
    --link $oracle_xe_name:db \
    --link $jenkins_master_name:jenkins \
    -e JENKINS_USERNAME=jenkins \
    -e JENKINS_PASSWORD=jenkins \
    maestrodev/jenkins-slave)
jenkins_slave_name=$(docker inspect --format='{{.Name}}' $jenkins_slave_cid)

echo "Environment ready: "
echo "Jenkins Master: $jenkins_master_name"
echo "Jenkins Slave: $jenkins_slave_name"
echo "OracleXE: $oracle_xe_name"