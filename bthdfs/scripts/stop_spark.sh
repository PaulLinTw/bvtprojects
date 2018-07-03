source /vagrant/incl.sh

echo stopping spark ..
cd /usr/local/spark/
sbin/stop-all.sh
jps
echo spark stopped
