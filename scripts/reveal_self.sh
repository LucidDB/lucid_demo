#!/bin/bash
# Run as root. Expects USER and WS_PORT to be passed in the env.

. env.sh

su -l $USER -c "export JAVA_HOME=$JAVA_HOME
cd luciddb/bin/
./lucidDbServer &
cd ~/dynamodb-services
chmod +x ./bin/*.sh
./bin/startup.sh
"
WS_SERVER=`ec2metadata | grep public-hostname | sed -e "s/^.* //"`
pw=`cat authpass.txt | sed -e s:\n::`
curl "$DEMO_SERVER/register_server/$pw/$WS_SERVER/$WS_PORT"
