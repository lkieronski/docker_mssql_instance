# docker_mssql_instance
docker mssql instance with attach database

default sa password is P@ssw0rd
if you whant to change it go to docker-compose.yaml environmentals

copy you db.mdf and db_log.lfd to ./db folder

run command: docker-compose up -d 

after container is started make attach_db.sh executable and run commad: bash attach_db.sh

if you changed password in docker-compose run script with argument: bash attach_db.sh <new_password>

you need to run the script only once when the container is created


all is set now :)
