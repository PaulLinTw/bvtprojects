source /vagrant/incl.sh

echo starting hdfs ..
cd /usr/local/hadoop/
sbin/start-dfs.sh
sbin/start-yarn.sh
jps
echo hdfs started
