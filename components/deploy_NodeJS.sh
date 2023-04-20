echo "*************************************"
echo "NODEJS INSTALLATION ..."
echo "*************************************"
## NODEJS
#curl -sL https://deb.nodesource.com/setup_16.x | sudo bash - &&
## USING Node Version 10.22.1 for OceanIsOpen app
curl -sL https://deb.nodesource.com/setup_10.x | sudo bash - &&
sudo apt-get install -y nodejs npm && exit
