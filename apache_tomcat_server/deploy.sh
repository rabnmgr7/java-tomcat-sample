#!/bin/sh
echo "Provide server name:"
read server_name
tar -xvzf apache-tomcat-9.0.85.tar.gz -C /opt/"$server_name"

