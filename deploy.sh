#!/bin/bash

echo "*************************************"
echo "DEPLOYMENT BEGIN ..."
echo "*************************************"

chmod u+x ./components/*.sh &&

sudo ./components/deploy_Mosquitto.sh &&
sudo ./components/deploy_NodeJS.sh &&
sudo ./components/deploy_Grafana.sh && 
sudo ./components/deploy_InfluxDB.sh &&
sudo ./components/deploy_AP.sh &&

sudo apt-get update && 
sudo apt-get upgrade -y &&

echo "*************************************"
echo "DEPLOY END ..."
echo "*************************************"
echo "### Rebooting..."
sudo reboot now

#### PACKAGE DEPLOY END ####
