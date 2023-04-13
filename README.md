# CoreGateway
Core module to deploy modules on raspberry and launching service to save data on influxDB from MQTT 

Une fois que l'image raspi est installée ( et SSH activée ) lancer la commande

`ssh -A "pi@raspidroneeduc.local" "sudo apt-get update && sudo apt-get upgrade -y && sudo apt-get install -y git && git clone https://github.com/TamataOcean/CoreGateway.git && cd CoreGateway/ && chmod u+x deploy.sh && ./deploy.sh"`
