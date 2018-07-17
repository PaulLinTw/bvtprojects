#/bin/bash!
sudo yum install -y wget
wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2Ftechnetwork%2Fjava%2Fjavase%2Fdownloads%2Fjdk8-downloads-2133151.html; oraclelicense=accept-securebackup-cookie;" "http://download.oracle.com/otn-pub/java/jdk/8u172-b11/a58eab1ec242421181065cdc37240b08/jre-8u172-linux-x64.rpm"
sudo rpm -ivh /tmp/jdk-*.rpm
wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-6.3.1.rpm
wget https://artifacts.elastic.co/downloads/kibana/kibana-6.3.1-x86_64.rpm

#sudo yum install -y elasticsearch
sudo rpm --install elasticsearch-6.3.1.rpm

#sudo yum install -y kibana
sudo rpm --install kibana-6.3.1-x86_64.rpm

sudo yum install -y logstash
#wget https://artifacts.elastic.co/downloads/logstash/logstash-6.3.1.tar.gz
#tar -xcvf logstash-6.3.1.tar.gz
