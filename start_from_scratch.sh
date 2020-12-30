#Build dockerfile
#docker build -t cool .
docker-compose up -d
docker exec -it miningcore_db_1 apt-get update
docker exec -it miningcore_db_1 apt-get install -y sudo wget
docker exec -it miningcore_db_1 sudo -u postgres createuser miningcore
docker exec -it miningcore_db_1 sudo -u postgres createdb miningcore
docker exec -it miningcore_db_1 sudo -u postgres psql miningcore
#run these two commands now
alter user miningcore with encrypted password 'yourpassword';
grant all privileges on database miningcore to miningcore;
docker exec -it miningcore_db_1 wget https://raw.githubusercontent.com/coinfoundry/miningcore/master/src/Miningcore/Persistence/Postgres/Scripts/createdb.sql
docker exec -it miningcore_db_1 sudo -u postgres psql -d miningcore -U miningcore -f createdb.sql
