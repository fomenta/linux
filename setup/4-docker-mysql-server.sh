#/bin/bash
set -e -u

# instructions
# https://hub.docker.com/_/mysql

echo "Downloading Image..."
docker pull mysql:5.7

echo "Starting a MySQL Server Instance..."
docker run -d --name=mysql57 --network=workgroup -e MYSQL_ROOT_PASSWORD=mysql -e MYSQL_DATABASE=sample -e MYSQL_USER=sample -e MYSQL_PASSWORD=sample mysql:5.7

echo "Listing running instances"
docker ps

echo "Trying connection with new password"
docker exec -it mysql57 mysql -uroot -pmysql
#exit

cat >/dev/null <<EOF
# support
docker start mysql57
docker stop mysql57
docker rm mysql57
ping localhost 3306
exit

docker image ls
docker image rm mysql/mysql-server:5.7

docker run -it --rm --name mysqlcli --network workgroup mysql:5.7 mysql -hmysql57 -uroot -pmysql
exit
EOF
