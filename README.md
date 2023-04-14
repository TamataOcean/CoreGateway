# CoreGateway
Core module to deploy modules on raspberry and launching service to save data on influxDB from MQTT 

Une fois que l'image raspi est installée ( et SSH activée ) lancer la commande

`ssh -A "pi@raspidroneeduc.local" "sudo apt-get update && sudo apt-get install -y git && git clone https://github.com/TamataOcean/CoreGateway.git && cd CoreGateway/ && chmod u+x deploy.sh && ./deploy.sh"`

## Troubleshouting
 Updating the system using `sudo apt upgrade` at the very beginning of the installation may update the kernel. If so, this prevents configuration of iptables when configuring the access point as iptables kernel modules were updated and the system needs to reboot to be able to use them. The system update has thenefore been move at the very end of the installation process, right before rebooting.