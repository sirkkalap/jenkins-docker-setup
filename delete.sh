#!/bin/bash
set -e
cidfiles="jenkins_slave.cid jenkins_master.cid oracle.cid"

for cidf in $cidfiles; do
    cid=$(cat $cidf)
    echo -n "Stop: "
    docker stop $cid
    echo -n "Delete: "
    docker rm $cid
    rm $cidf
done