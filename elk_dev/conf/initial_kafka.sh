#/bin/bash!
sudo yum install -y wget

echo create /home/vagrant/local/opt/ path
mkdir -p /home/vagrant/local/opt

kafkaver="0.11.0.2"
wget -q http://apache.stu.edu.tw/kafka/$kafkaver/kafka_2.12-$kafkaver.tgz
tar zxf kafka_2.12-$kafkaver.tgz
mv kafka_2.12-$kafkaver /home/vagrant/local/opt/kafka
rm  kafka_2.12-$kafkaver.tgz
chown vagrant.vagrant -R /home/vagrant/local/opt/kafka/

echo update server.properties
#cp /home/vagrant/share/server$VMID.properties /home/vagrant/local/opt/kafka/config/server.properties
echo broker.id=1 >> /home/vagrant/local/opt/kafka/config/server.properties
