#!/bin/bash
if [ -z $1 ]; then pass=P@ssw0rd; else pass=$1; fi
sudo=$(which sudo)
docker=$(which docker)
sudo docker exec mssqldb /opt/mssql-tools/bin/sqlcmd -S 127.0.0.1 -i attach.sql -U sa -P $pass
