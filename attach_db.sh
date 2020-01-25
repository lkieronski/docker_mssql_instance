#!/bin/bash

db=$(ls ./db)
db=($db)

dbname="default"
pass="P@ssw0rd"
sudo=$(which sudo)
docker=$(which docker)
sqlcmd="/opt/mssql-tools/bin/sqlcmd"


while getopts ":d:p:" opt; do
	case ${opt} in
		d )
			dbname=$OPTARG
			;;
		p )
			pass=$OPTARG
			;;
		\? )
			echo "Invalid option: $OPTARG" 1>&2
			;;
		: )
			echo "Invalid option: $OPTARG requires an argument" 1>&2
			;;
	esac
done
shift $((OPTIND -1))

sql="CREATE DATABASE $dbname ON PRIMARY (FILENAME=N'/mssqldb/${db[1]}') LOG ON (FILENAME=N'/mssqldb/${db[0]}') FOR ATTACH;"
echo $sql > attach.sql
echo $sql
echo $pass

sudo docker cp ./attach.sql  mssqldb:/
sudo docker exec mssqldb $sqlcmd -S 127.0.0.1 -i attach.sql -U sa -P $pass
