source /vagrant/incl.sh

echo "stopping spark master.."
ssh vagrant@@PREFIXER_master1 "/usr/local/spark/sbin/stop-master.sh"
echo "stopping worker on @PREFIXER_master1.."
ssh vagrant@@PREFIXER_master1 "/usr/local/spark/sbin/stop-slave.sh && ${JAVA_HOME}/bin/jps"
echo "stopping worker on @PREFIXER_slave1.."
ssh vagrant@@PREFIXER_slave1 "/usr/local/spark/sbin/stop-slave.sh && ${JAVA_HOME}/bin/jps"
echo "stopping worker on @PREFIXER_slave2.."
ssh vagrant@@PREFIXER_slave2 "/usr/local/spark/sbin/stop-slave.sh && ${JAVA_HOME}/bin/jps"
echo "stopping worker on @PREFIXER_slave3.."
ssh vagrant@@PREFIXER_slave3 "/usr/local/spark/sbin/stop-slave.sh && ${JAVA_HOME}/bin/jps"
echo "spark cluster stopped"
