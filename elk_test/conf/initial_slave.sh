#/bin/bash!
sudo yum install -y wget

#sudo yum install -y elasticsearch
wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-6.3.1.rpm
sudo rpm --install elasticsearch-6.3.1.rpm

sudo yum install -y logstash
#wget https://artifacts.elastic.co/downloads/logstash/logstash-6.3.1.tar.gz
#tar -xcvf logstash-6.3.1.tar.gz

echo begin initiating kafka...

echo create local/opt/ path
mkdir -p /home/vagrant/local/opt

echo downloading kafka

cd /home/vagrant

kafkaver="0.11.0.2"


wget -q http://apache.stu.edu.tw/kafka/$kafkaver/kafka_2.10-$kafkaver.tgz
tar zxf kafka_2.10-$kafkaver.tgz
mv kafka_2.10-$kafkaver /home/vagrant/local/opt/kafka
rm  kafka_2.10-$kafkaver.tgz
chown vagrant.vagrant -R /home/vagrant/local/opt/kafka/

echo update server.properties
#cp /home/vagrant/share/server$VMID.properties /home/vagrant/local/opt/kafka/config/server.properties
echo broker.id=1 >> /home/vagrant/local/opt/kafka/config/server.properties
