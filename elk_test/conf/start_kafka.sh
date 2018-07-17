#!/bin/bash

echo "Starting kafka"
export JMX_PORT=9041
export KAFKA_JMX_OPTS="-Djava.rmi.server.hostname=$IP -Dcom.sun.management.jmxremote -Dcom.sun.management.jmxremote.authenticate=false  -Dcom.sun.management.jmxremote.ssl=false "
bin/kafka-server-start.sh config/server.properties 1>> /tmp/broker.log 2>> /tmp/broker.log &
