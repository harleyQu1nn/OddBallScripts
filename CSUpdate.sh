#!/bin/bash
#Author: @Qu1nn
#Cobalt Strike Update Script
#Specify the Target IP
#***The target linux boxes specified must be reachable from the box it's run from. (Same Resource Pool)
#***The target linux boxes must also have the ssh service running.

USERNAME=root
HOSTS="$1"
SCRIPT="cd /opt/cobaltstrike; ./update"

if [ -z "$1" ]; then
	echo "Missing Command Line Arguments!";
	echo "Usage: ./csupdate.sh [Target IP]";
	exit 1;
else
	for HOSTNAME in ${HOSTS} ; do
    ssh -o StrictHostKeyChecking=no -l ${USERNAME} ${HOSTNAME} "${SCRIPT}"
done
fi