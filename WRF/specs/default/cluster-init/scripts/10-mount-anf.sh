#!/bin/bash
set -ex


sudo mkdir -p /apps
sudo chmod 777 /apps

sleep 1m

sudo mount -t nfs -o rw,hard,rsize=1048576,wsize=1048576,sec=sys,vers=4.1,tcp 10.0.1.4:/wrf-vol /apps

sudo chmod 777 -R /apps
sudo yum install -y python3
sudo yum install -y libgfortran5
