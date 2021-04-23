#/bin/bash
set -e -u

# instructions
# https://hub.docker.com/r/linuxserver/mysql-workbench

echo "Pulling image..."
docker pull ghcr.io/linuxserver/mysql-workbench

echo "Find PUID and PGID..."
id $USER

echo "Running image..."
# "-rm" removes the container after being stop
docker run -d --name mysql-workbench --network workgroup -e PUID=1000 -e PGID=1000 -e TZ=America/Bogota -p 3000:3000 --cap-add="IPC_LOCK" --restart unless-stopped ghcr.io/linuxserver/mysql-workbench

echo "Opening MySQL Workbench (Web Browser)..."
detach xdg-open "http://localhost:3000"

cat >/dev/nul <<EOF
docker ps

# to stop the container
docker stop mysql-workbench
docker rm mysql-workbench

# Support Info
#Shell access whilst the container is running: 
docker exec -it mysql-workbench /bin/bash

# To monitor the logs of the container in realtime:
docker logs -f mysql-workbench

# container version number
docker inspect -f '{{ index .Config.Labels "build_version" }}' mysql-workbench

# image version number
docker inspect -f '{{ index .Config.Labels "build_version" }}' ghcr.io/linuxserver/mysql-workbench
EOF

# By default the user/pass is abc/abc
# if you change your password 
# or want to login manually to the GUI session, use the following link:
# http://yourhost:3000/?login=true
