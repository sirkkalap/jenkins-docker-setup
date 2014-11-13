#!/bin/bash
set -e

jenkins_master_cid=$(docker run -d \
    -p 49080:8080 \
    --cidfile=jenkins_master.cid \
    csanchez/jenkins-swarm)
jenkins_master_name=$(docker inspect --format='{{.Name}}' $jenkins_master_cid)
jenkins_master_ip=$(docker inspect --format='{{.IP}}' $jenkins_master_cid)

echo "Jenkins Master: $jenkins_master_name $jenkins_master_ip"
