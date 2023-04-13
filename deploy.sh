#!/bin/bash

echo "*************************************"
echo "DEPLOYMENT BEGIN ..."
echo "*************************************"

chmod u+x ./components/*.sh &&

sudo ./components/deploy_Mosquitto.sh &&
sudo ./components/deploy_NodeJS.sh
sudo ./components/deploy_Grafana.sh && 
sudo ./components/deploy_InfluxDB.sh &&

echo "*************************************"
echo "DEPLOY END ..."
echo "*************************************"

#### PACKAGE DEPLOY END ####
