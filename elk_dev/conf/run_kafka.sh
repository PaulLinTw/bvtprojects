echo start zookeeper
export JMX_PORT=903$BrokerId
export KAFKA_JMX_OPTS="-Djava.rmi.server.hostname=$Ip -Dcom.sun.management.jmxremote -Dcom.sun.management.jmxremote.authenticate=false  -Dcom.sun.management.jmxremote.ssl=false " bin/zookeeper-server-start.sh config/zookeeper.properties >> $KafkaFolder/tmp/zk.log &

echo "Starting kafka"
export JMX_PORT=9041
export KAFKA_JMX_OPTS="-Djava.rmi.server.hostname=192.168.1.207 -Dcom.sun.management.jmxremote -Dcom.sun.management.jmxremote.authenticate=false  -Dcom.sun.management.jmxremote.ssl=false "
bin/kafka-server-start.sh config/server.properties 1>> /tmp/broker.log 2>> /tmp/broker.log &
