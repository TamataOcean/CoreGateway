#!/bin/bash

echo "*************************************"
echo "DEPLOYMENT BEGIN ..."
echo "*************************************"

chmod u+x ./components/*.sh &&

#sudo ./components/*.sh &&
sudo ./components/deploy_Mosquitto.sh &&
sudo ./components/deploy_NodeJS.sh
sudo ./components/deploy_Grafana.sh && 
sudo ./components/deploy_InfluxDB.sh &&
sudo ./components/deploy_AP.sh &&

sudo apt-get upgrade -y &&
echo "Rebooting..."
sudo reboot now

echo "*************************************"
echo "DEPLOY END ..."
echo "*************************************"

#### PACKAGE DEPLOY END ####
