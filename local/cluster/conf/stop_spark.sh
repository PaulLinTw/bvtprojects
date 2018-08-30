source /vagrant/incl.sh

echo "stopping spark master.."
ssh vagrant@@PREFIXER_master1 "/usr/local/spark/sbin/stop-master.sh"
echo "stopping worker on @PREFIXER_master1.."
ssh vagrant@@PREFIXER_master1 "/usr/local/spark/sbin/stop-slave.sh && ${JAVA_HOME}/bin/jps"
echo "stopping worker on @PREFIXER_worker1.."
ssh vagrant@@PREFIXER_worker1 "/usr/local/spark/sbin/stop-slave.sh && ${JAVA_HOME}/bin/jps"
echo "stopping worker on @PREFIXER_worker2.."
ssh vagrant@@PREFIXER_worker2 "/usr/local/spark/sbin/stop-slave.sh && ${JAVA_HOME}/bin/jps"
echo "stopping worker on @PREFIXER_worker3.."
ssh vagrant@@PREFIXER_worker3 "/usr/local/spark/sbin/stop-slave.sh && ${JAVA_HOME}/bin/jps"
echo "spark cluster stopped"
