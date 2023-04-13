#!/bin/bash

echo "*************************************"
echo "SETUP BEGIN ..."
echo "*************************************"

### TEST avec nouvelle install
## BASICS

sudo apt-get update && sudo apt-get upgrade -y &&
sudo apt-get install -y git &&


echo "*************************************"
echo "MOSQUITTO INSTALLATION ..."
echo "*************************************"
## INSTALL Mosquitto
sudo apt install -y mosquitto mosquitto-clients &&

echo "*************************************"
echo "GRAFANA INSTALLATION ..."
echo "*************************************"
## GRAFANA
wget -q -O - https://packages.grafana.com/gpg.key | sudo apt-key add - &&
echo "deb https://packages.grafana.com/oss/deb stable main" | sudo tee -a /etc/apt/sources.list.d/grafana.list &&
sudo apt-get update &&
sudo apt-get install -y grafana &&
sudo /bin/systemctl daemon-reload &&
sudo /bin/systemctl enable grafana-server &&
sudo /bin/systemctl start grafana-server &&

echo "*************************************"
echo "NODEJS INSTALLATION ..."
echo "*************************************"
## NODEJS
curl -sL https://deb.nodesource.com/setup_16.x | sudo bash - &&
sudo apt-get install -y nodejs &&

echo "*************************************"
echo "INFLUXDB INSTALLATION ..."
echo "*************************************"
## INFLUXDB Install
wget -q https://repos.influxdata.com/influxdata-archive_compat.key &&
echo '393e8779c89ac8d958f81f942f9ad7fb82a25e133faddaf92e15b16e6ac9ce4c influxdata-archive_compat.key' | sha256sum -c && cat influxdata-archive_compat.key | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/influxdata-archive_compat.gpg > /dev/null &&
echo 'deb [signed-by=/etc/apt/trusted.gpg.d/influxdata-archive_compat.gpg] https://repos.influxdata.com/debian stable main' | sudo tee /etc/apt/sources.list.d/influxdata.list &&
sudo apt-get update && sudo apt-get install influxdb2 -Y &&

# Create Influx DATABASE
echo "---------------"
echo "CREATE DATABASE" 
echo "---------------" 
influx setup --username test --password LIENS12345 --org LIENS --bucket DATAGAS --force 

#### PACKAGE DEPLOY END ####
