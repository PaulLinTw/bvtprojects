source /vagrant/incl.sh

echo starting spark master..
ssh vagrant@master1 "/usr/local/spark/sbin/start-master.sh"
echo starting worker on master1..
ssh vagrant@master1 "/usr/local/spark/sbin/start-slave.sh spark://master1:7077 && $(which jps)"
echo starting worker slave1..
ssh vagrant@slave1 "/usr/local/spark/sbin/start-slave.sh spark://master1:7077 && $(which jps)"
echo starting worker slave2..
ssh vagrant@slave2 "/usr/local/spark/sbin/start-slave.sh spark://master1:7077 && $(which jps)"
echo starting worker slave3..
ssh vagrant@slave3 "/usr/local/spark/sbin/start-slave.sh spark://master1:7077 && $(which jps)"
echo spark cluster started
