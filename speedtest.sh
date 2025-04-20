#!/bin/bash

ERRLOGFILE="/var/log/speedtest_error.log"
SPEEDTST=$(speedtest --secure --json)

if [[ -n "$SPEEDTST" ]] && echo "$SPEEDTST" | jq empty 2>/dev/null;
then
        zabbix_sender -z localhost -s "PRD-SPEEDTEST-FCONET-500M" -k speedtest -o "$SPEEDTST"
        echo "$(date '+%Y-%m-%d %H:%M:%S') - Sucesso: Resultado enviado ao Zabbix."
elif [[ -n "$SPEEDTST" ]];
then
    echo "$(date '+%Y-%m-%d %H:%M:%S') - ERRO: Retorno inválido (não é JSON) "$SPEEDTST"" >> "$ERRLOGFILE"
    exit 1
else
        echo "$(date '+%Y-%m-%d %H:%M:%S') - ERRO: Retorno é nulo!" >> "$ERRLOGFILE"
        exit 1
fi

exit 0
