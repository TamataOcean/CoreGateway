echo "*************************************"
echo "POSTGRES INSTALLATION ..."
echo "*************************************"

sudo apt install -y postgresql-13 postgresql-13-postgis-3 postgresql-13-cron postgresql-13-postgis-3-scripts postgresql-plpython3-13
echo "deb https://packagecloud.io/timescale/timescaledb/debian/ $(lsb_release -c -s) main" | sudo tee /etc/apt/sources.list.d/timescaledb.list
wget --quiet -O - https://packagecloud.io/timescale/timescaledb/gpgkey | sudo apt-key add -
sudo apt-get update
sudo apt install -y timescaledb-2-postgresql-13

echo "Update config file"
sudo echo "listen_addresses = '*'" | sudo tee -a /etc/postgresql/13/main/postgresql.conf
sudo echo "shared_preload_libraries = 'timescaledb,pg_cron'" | sudo tee -a /etc/postgresql/13/main/postgresql.conf
sudo echo "cron.database_name = 'mpc'" | sudo tee -a /etc/postgresql/13/main/postgresql.conf
sudo echo "host    all             all             0.0.0.0/0               md5" | sudo tee -a /etc/postgresql/13/main/pg_hba.conf

echo "Restarting service"
systemctl restart postgresql

# NEXT STEPS SEE : [jancelin/MultiProbeCase/gateway](https://github.com/jancelin/MultiProbeCase/blob/dev/gateway/MPC_install_postgresql_grafana_rfcommBT_rtk_.md)
