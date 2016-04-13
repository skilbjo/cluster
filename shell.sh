#!/bin/bash

UPDATE="sudo pacman "
PRCOESS="ps aux | grep node"
INSTALL="sudo apt-get install rsync"
SHUTDOWN="sudo shutdown -h now"
COMMAND=$SHUTDOWN

for i in {2..4}; do
	ssh pi$i $COMMAND
done

exit
