#!/bin/bash
set -e
cidfiles="jenkins_master.cid"

for cidf in $cidfiles; do
    cid=$(cat $cidf)
    echo -n "Stop: "
    docker stop $cid
    echo -n "Delete: "
    docker rm $cid
    rm $cidf
done