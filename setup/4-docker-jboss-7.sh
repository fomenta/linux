#/bin/bash
set -e -u

# instructions
# https://hub.docker.com/r/scalified/jboss-eap
# https://github.com/Scalified/docker-jboss-eap
#
# https://websiteforstudents.com/how-to-install-wildfly-on-ubuntu-20-04-18-04/

#docker run -d --name jboss7 --network workgroup -p 80:80 -p 443:443 -p 8080:8080 -p 8443:8443 -p 9990:9990 -p 9993:9993 scalified/jboss-eap:7.0.0

#
# https://hub.docker.com/r/tutum/jboss
#
docker run -d --name jboss7 --network workgroup -p 8080:8080 -p 9990:9990 -e JBOSS_PASS=jboss tutum/jboss:as7

echo "Openning jboss..."
detach xdg-open http://127.0.0.1:8080/

echo "Login to the admin console to configure your JBoss Server..."
detach xdg-open http://127.0.0.1:9990

cat >/dev/null <<EOF
# support
docker start jboss7
docker stop jboss7
docker rm jboss7
exit

docker exec -it jboss7 /bin/bash
ls -la
pwd
exit
EOF
