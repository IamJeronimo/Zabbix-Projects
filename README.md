# Zabbix SpeedTest - Monitoring

0. Instalar: jq e zabbix-sender 
1. O script "speedtest.sh" deve ser implantado em algum Zabbix Server/Proxy da rede alvo, sua saída padrão deve ser o link alvo;
2. Criaremos um crontab ( */3 * * * *     /etc/zabbix/scripts/speedtest.sh ) onde sua execução será a cada 3 minutos;
3. Incluír o template vinculado a este projeto, poderá ser modificado da maneira que entender melhor atender sua necessídade.

![imagem](https://github.com/user-attachments/assets/dc4c5f4a-2230-45e5-9073-bd199487e673)

![imagem](https://github.com/user-attachments/assets/44f90bf7-60a8-4615-8918-86a07b076d5e)



![in progress](https://img.shields.io/badge/build-in%20progress-yellowgreen)
