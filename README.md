# docker_mssql_instance
docker mssql instance with attach database

default sa password is P@ssw0rd
if you whant to change it go to docker-compose.yaml environmentals

copy you db.mdf and db_log.lfd to ./db folder, make sure that these files are in the folder

run command: docker-compose up -d 

after container is started make attach_db.sh executable and run commad: bash attach_db.sh -d <attached_db_name> -p <password>

use:

 -d - to specify attached db name | default: "default"
 
 -p - to specify diferent sa password, make sure its the same as in docker-compose.yaml | default: "P@ssw0rd"

you need to run the script only once when the container is created and running


all is set now :)
