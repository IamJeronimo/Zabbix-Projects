# Zabbix SpeedTest - Monitoring

0. Instalar: jq e zabbix-sender 
1. O script "speedtest.sh" deve ser implantado em algum Zabbix Server/Proxy da rede alvo, sua saída padrão deve ser o link alvo;
2. Criaremos um crontab *( */3 * * * *     /etc/zabbix/scripts/speedtest.sh )* onde sua execução será a cada 3 minutos;
3. Incluír o template vinculado a este projeto, poderá ser modificado da maneira que entender melhor atender sua necessídade. 

![in progress](https://img.shields.io/badge/build-in%20progress-yellowgreen)
