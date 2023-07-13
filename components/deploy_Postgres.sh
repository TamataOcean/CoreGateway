echo "*************************************"
echo "POSTGRES INSTALLATION ..."
echo "*************************************"

sudo apt install postgresql-14 postgresql-14-postgis-3 postgresql-14-cron postgresql-14-postgis-3-scripts postgresql-plpython3-14
echo "deb https://packagecloud.io/timescale/timescaledb/debian/ $(lsb_release -c -s) main" | sudo tee /etc/apt/sources.list.d/timescaledb.list
wget --quiet -O - https://packagecloud.io/timescale/timescaledb/gpgkey | sudo apt-key add -
sudo apt-get update
sudo apt install timescaledb-2-postgresql-14

# NEXT STEPS SEE : https://github.com/jancelin/MultiProbeCase/blob/dev/gateway/MPC_install_postgresql_grafana_rfcommBT_rtk_.md
