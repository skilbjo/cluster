#!/bin/bash

UPDATE="sudo apt-get update; sudo apt-get upgrade"
PRCOESS="ps aux | grep node"
INSTALL="sudo apt-get install rsync"
COMMAND=$INSTALL

for i in {1..4}; do
	echo ssh pi$i \"$COMMAND\"
done
