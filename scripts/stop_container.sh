#!/bin/bash
containerID=`sudo docker ps | awk -F" " '{print $1}'`
sudo docker rm -f $containerID
