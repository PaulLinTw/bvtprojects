source /vagrant/incl.sh

echo "stopping spark master.."
ssh vagrant@master1 "/usr/local/spark/sbin/stop-master.sh"
echo "stopping worker on master1.."
ssh vagrant@master1 "/usr/local/spark/sbin/stop-slave.sh && $(which jps)"
echo "stopping worker on slave1.."
ssh vagrant@slave1 "/usr/local/spark/sbin/stop-slave.sh && $(which jps)"
echo "stopping worker on slave2.."
ssh vagrant@slave2 "/usr/local/spark/sbin/stop-slave.sh && $(which jps)"
echo "stopping worker on slave3.."
ssh vagrant@slave3 "/usr/local/spark/sbin/stop-slave.sh && $(which jps)"
echo "spark cluster stopped"
