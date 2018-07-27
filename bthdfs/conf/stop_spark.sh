source /vagrant/incl.sh

echo "stopping spark master.."
ssh vagrant@hdmaster1 "/usr/local/spark/sbin/stop-master.sh"
echo "stopping worker on hdmaster1.."
ssh vagrant@hdmaster1 "/usr/local/spark/sbin/stop-slave.sh && $(which jps)"
echo "stopping worker on hdslave1.."
ssh vagrant@hdslave1 "/usr/local/spark/sbin/stop-slave.sh && $(which jps)"
echo "stopping worker on hdslave2.."
ssh vagrant@hdslave2 "/usr/local/spark/sbin/stop-slave.sh && $(which jps)"
echo "stopping worker on hdslave3.."
ssh vagrant@hdslave3 "/usr/local/spark/sbin/stop-slave.sh && $(which jps)"
echo "spark cluster stopped"
