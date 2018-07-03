source /vagrant/incl.sh

mkdir -p /home/vagrant/.ssh

echo "create empty-password rsa key for vagrant"

ssh-keygen -P "" -t rsa -f /home/vagrant/.ssh/id_rsa

ssh-copy-id -i /home/vagrant/.ssh/id_rsa.pub master1
ssh-copy-id -i /home/vagrant/.ssh/id_rsa.pub slave1
ssh-copy-id -i /home/vagrant/.ssh/id_rsa.pub slave2
ssh-copy-id -i /home/vagrant/.ssh/id_rsa.pub slave3

echo "copy hadoop.tar.gz into workers"
cd /usr/local
scp ./hadoop.tar.gz slave1:/home/vagrant
scp ./hadoop.tar.gz slave2:/home/vagrant
scp ./hadoop.tar.gz slave3:/home/vagrant

echo "unzip hadoop.tar.gz in slave1"
ssh slave1 "sudo tar -zxf /home/vagrant/hadoop.tar.gz -C /usr/local"
echo "unzip hadoop.tar.gz in slave2"
ssh slave2 "sudo tar -zxf /home/vagrant/hadoop.tar.gz -C /usr/local"
echo "unzip hadoop.tar.gz in slave3"
ssh slave3 "sudo tar -zxf /home/vagrant/hadoop.tar.gz -C /usr/local"

echo "copy spark.tar.gz into workers"
cd /usr/local
scp ./spark.tar.gz slave1:/home/vagrant
scp ./spark.tar.gz slave2:/home/vagrant
scp ./spark.tar.gz slave3:/home/vagrant

echo "unzip spark.tar.gz in slave1"
ssh slave1 "sudo tar -zxf /home/vagrant/spark.tar.gz -C /usr/local"
echo "unzip spark.tar.gz in slave2"
ssh slave2 "sudo tar -zxf /home/vagrant/spark.tar.gz -C /usr/local"
echo "unzip spark.tar.gz in slave3"
ssh slave3 "sudo tar -zxf /home/vagrant/spark.tar.gz -C /usr/local"
