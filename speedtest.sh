#!/bin/bash
<<coment
Autor: Lucas Jeronimo da Silva
E-mail: l.jeronimo@outlook.com.br
Manutenção: Lucas Jeronimo da Silva - 2025-04-20
#################################### OBJETIVO ###########################################################
- Temos um script que faz testes speed e em seguida encaminha ao Zabbix Server.
#################################### HISTORICO ##########################################################   
	Major Release v0.1, Lucas Jeronimo:
		2025-04-20 v0.1 - Versão inicial, já conseguimos monitorar o link com clareza.
coment

# Definindo as vars
ERRLOGFILE="/var/log/speedtest_error.log"
SPEEDTST=$(speedtest --secure --json)

# Testando se a saída do comando não é vazia e há um JSON em seu output
if [[ -n "$SPEEDTST" ]] && echo "$SPEEDTST" | jq empty 2>/dev/null;
then
        zabbix_sender -z localhost -s "PRD-SPEEDTEST-FCONET-500M" -k speedtest -o "$SPEEDTST"
        echo "$(date '+%Y-%m-%d %H:%M:%S') - Sucesso: Resultado enviado ao Zabbix."

# Se não for um JSON, mas ainda sim temos saída significa que temos algum erro
elif [[ -n "$SPEEDTST" ]];
then
    echo "$(date '+%Y-%m-%d %H:%M:%S') - ERRO: Retorno inválido (não é JSON) "$SPEEDTST"" >> "$ERRLOGFILE"
    exit 1

# Caso não haja output então é nulo!
else
        echo "$(date '+%Y-%m-%d %H:%M:%S') - ERRO: Retorno é nulo!" >> "$ERRLOGFILE"
        exit 1
fi

exit 0
