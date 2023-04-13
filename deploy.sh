#!/bin/bash

echo "*************************************"
echo "DEPLOYMENT BEGIN ..."
echo "*************************************"

./components/deploy_Mosquitto.sh &&
./components/deploy_NodeJS.sh
./components/deploy_Grafana.sh && 
./components/deploy_InfluxDB.sh &&

echo "*************************************"
echo "DEPLOY END ..."
echo "*************************************"

#### PACKAGE DEPLOY END ####
