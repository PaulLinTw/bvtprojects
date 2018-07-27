source /vagrant/incl.sh

mkdir -p /home/vagrant/.ssh

echo "create empty-password rsa key for vagrant"

ssh-keygen -P "" -t rsa -f /home/vagrant/.ssh/id_rsa

ssh-copy-id -i /home/vagrant/.ssh/id_rsa.pub hdmaster1
ssh-copy-id -i /home/vagrant/.ssh/id_rsa.pub hdslave1
ssh-copy-id -i /home/vagrant/.ssh/id_rsa.pub hdslave2
ssh-copy-id -i /home/vagrant/.ssh/id_rsa.pub hdslave3

echo "copy hadoop.tar.gz into workers"
cd /usr/local
scp ./hadoop.tar.gz hdslave1:/home/vagrant
scp ./hadoop.tar.gz hdslave2:/home/vagrant
scp ./hadoop.tar.gz hdslave3:/home/vagrant

echo "unzip hadoop.tar.gz in hdslave1"
ssh hdslave1 "sudo tar -zxf /home/vagrant/hadoop.tar.gz -C /usr/local"
echo "unzip hadoop.tar.gz in hdslave2"
ssh hdslave2 "sudo tar -zxf /home/vagrant/hadoop.tar.gz -C /usr/local"
echo "unzip hadoop.tar.gz in hdslave3"
ssh hdslave3 "sudo tar -zxf /home/vagrant/hadoop.tar.gz -C /usr/local"

echo "copy spark.tar.gz into workers"
cd /usr/local
scp ./spark.tar.gz hdslave1:/home/vagrant
scp ./spark.tar.gz hdslave2:/home/vagrant
scp ./spark.tar.gz hdslave3:/home/vagrant

echo "unzip spark.tar.gz in hdslave1"
ssh hdslave1 "sudo tar -zxf /home/vagrant/spark.tar.gz -C /usr/local"
echo "unzip spark.tar.gz in hdslave2"
ssh hdslave2 "sudo tar -zxf /home/vagrant/spark.tar.gz -C /usr/local"
echo "unzip spark.tar.gz in hdslave3"
ssh hdslave3 "sudo tar -zxf /home/vagrant/spark.tar.gz -C /usr/local"
