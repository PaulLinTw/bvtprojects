source /vagrant/incl.sh

echo starting spark ..
cd /usr/local/spark/
sbin/start-all.sh
jps
echo spark started
