#/bin/bash!

: << ES
export ES_HOME=/usr/share/elasticsearch
export LOG_DIR=/var/log/elasticsearch
export DATA_DIR=/var/lib/elasticsearch
export CONF_DIR=/etc/elasticsearch
sudo -u elasticsearch bash -x $ES_HOME/bin/elasticsearch --default.path.home=$ES_HOME --default.path.logs=$LOG_DIR --default.path.data=$DATA_DIR --default.path.conf=$CONF_DIR
ES

: << KA
echo "Starting kafka"
if [[  -n $PORT ]]; then
  export JMX_PORT=904$VMID
  export KAFKA_JMX_OPTS="-Djava.rmi.server.hostname=$IP -Dcom.sun.management.jmxremote -Dcom.sun.management.jmxremote.authenticate=false  -Dcom.sun.management.jmxremote.ssl=false "
fi
bin/kafka-server-start.sh config/server.properties 1>> /tmp/broker.log 2>> /tmp/broker.log &
KA
