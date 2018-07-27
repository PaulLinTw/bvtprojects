source /vagrant/incl.sh

echo starting spark master..
ssh vagrant@hdmaster1 "/usr/local/spark/sbin/start-master.sh"
echo starting worker on hdmaster1..
ssh vagrant@hdmaster1 "/usr/local/spark/sbin/start-slave.sh spark://hdmaster1:7077 && ${JAVA_HOME}/bin/jps"
echo starting worker hdslave1..
ssh vagrant@hdslave1 "/usr/local/spark/sbin/start-slave.sh spark://hdmaster1:7077 && ${JAVA_HOME}/bin/jps"
echo starting worker hdslave2..
ssh vagrant@hdslave2 "/usr/local/spark/sbin/start-slave.sh spark://hdmaster1:7077 && ${JAVA_HOME}/bin/jps"
echo starting worker hdslave3..
ssh vagrant@hdslave3 "/usr/local/spark/sbin/start-slave.sh spark://hdmaster1:7077 && ${JAVA_HOME}/bin/jps"
echo spark cluster started
