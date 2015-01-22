#!/bin/bash
set -e

JENKINS_MASTER=$1

if [ -n "$JENKINS_MASTER" ]; then
    echo "Usage: $0 <jenkins-master-ip-or-name>"
    exit 1
fi

oracle_xe_cid=$(docker run -d \
    --cidfile=oracle.cid \
    alexeiled/docker-oracle-xe-11g)
oracle_xe_name=$(docker inspect --format='{{.Name}}' $oracle_xe_cid)

jenkins_slave_cid=$(docker run -d \
    --cidfile=jenkins_slave.cid \
    --link $oracle_xe_name:db \
    -e JENKINS_USERNAME=jenkins \
    -e JENKINS_PASSWORD=jenkins \
    -e JENKINS_MASTER=$JENKINS_MASTER
    maestrodev/jenkins-slave)
jenkins_slave_name=$(docker inspect --format='{{.Name}}' $jenkins_slave_cid)

echo "Environment ready: "
echo "Jenkins Master: $jenkins_master_name"
echo "Jenkins Slave: $jenkins_slave_name"
echo "OracleXE: $oracle_xe_name"
