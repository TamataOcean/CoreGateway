sudo apt-get install -y build-essential
cd
git clone https://github.com/rtklibexplorer/RTKLIB.git
sudo make --directory=RTKLIB/app/consapp/str2str/gcc
sudo make --directory=RTKLIB/app/consapp/str2str/gcc install
