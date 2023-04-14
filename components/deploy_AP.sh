echo "*************************************"
echo "ACCES POINT INSTALLATION ..."
echo "*************************************"

sudo apt-get install -y dnsmasq hostapd &&

sudo cp components/wifi_raspi/hostapd.conf /etc/hostapd/hostapd.conf &&
sudo cp components/wifi_raspi/interfaces /etc/network/interfaces &&
sudo cp components/wifi_raspi/dnsmasq.conf /etc/dnsmasq.conf &&
sudo cp components/wifi_raspi/sysctl.conf /etc/sysctl.conf &&
sudo cp components/wifi_raspi/dhcpcd.conf /etc/dhcpcd.conf &&
sudo sh -c "echo 1 > /proc/sys/net/ipv4/ip_forward" &&
sleep 5 &&
sudo iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE &&
sudo iptables -t nat -A POSTROUTING -o usb0 -j MASQUERADE &&
sudo iptables -A FORWARD -i eth0 -o wlan0 -m state --state RELATED,ESTABLISHED -j ACCEPT &&
sudo iptables -A FORWARD -i usb0 -o wlan0 -m state --state RELATED,ESTABLISHED -j ACCEPT &&
sudo iptables -A FORWARD -i wlan0 -o eth0 -j ACCEPT &&
sudo iptables -A FORWARD -i wlan0 -o usb0 -j ACCEPT &&
sleep 5
sudo sh -c "iptables-save > /etc/iptables.ipv4.nat" &&
sudo cp components/wifi_raspi/rc.local /etc/rc.local &&
sudo chmod +x  /etc/rc.local &&

sudo systemctl unmask hostapd &&
sudo systemctl enable hostapd
