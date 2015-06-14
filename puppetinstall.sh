#!/bin/bash
date1=$(date +"%s")
echo '######################################'
echo '# Dependencies:  sudo apt-get update #'
echo '######################################'
    sudo apt-get update  # > /dev/null 2>&1
echo '######################################'
echo '# Installing puppet'
echo '######################################'
    sudo apt-get -y install puppet

