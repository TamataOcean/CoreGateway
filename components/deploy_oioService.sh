echo "*************************************"
echo "SETUP O.I.O. MAIN SERVICE ..."
echo "*************************************"

cd /home/$USER &&
git clone https://github.com/TamataOcean/OceanIsOpen.git &&
# Deploy node.js libs
cd /home/$USER/OceanIsOpen/systools &&
npm install &&

# DEPRECATED, we are using Build directory
# cd /home/pi/OceanIsOpen/react-socket-app/socket-client
# npm install

#### ADD SERVICE OIO ( server.js )
sudo cp /home/$USER/OceanIsOpen/systools/oio.service /etc/systemd/system/oio.service &&
sudo systemctl enable oio.service &&
sudo systemctl start oio.service
