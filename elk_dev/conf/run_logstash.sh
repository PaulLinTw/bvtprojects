cd /home/vagrant/logstash_1
sudo LS_JAVA_OPTS="-Xmx2g -Xms2g" bin/logstash -f config/logstash.conf &
cd /home/vagrant/logstash_2
sudo LS_JAVA_OPTS="-Xmx2g -Xms2g" bin/logstash -f config/logstash.conf &
