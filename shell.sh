#!/bin/bash

UPDATE="sudo pacman -Syyu"
PRCOESS="ps aux | grep node"
INSTALL="sudo apt-get install rsync"
SHUTDOWN="sudo shutdown -h now"
GIT="mkdir git ; cd git ; mkdir llcomputing ; cd llcomputing ; git init --bare"
APP="mkdir app ; cd app ; mkdir llcomputing"
MV="cd git ; mv llcomputing/ llcomputing.git/"
COMMAND=$MV

for i in {1..4}; do
	ssh pi$i $COMMAND
done

exit
