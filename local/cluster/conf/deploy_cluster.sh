source /vagrant/incl.sh

mkdir -p /home/vagrant/.ssh

echo "create empty-password rsa key for vagrant"

ssh-keygen -P "" -t rsa -f /home/vagrant/.ssh/id_rsa

ssh-copy-id -i /home/vagrant/.ssh/id_rsa.pub @PREFIXER_master1
ssh-copy-id -i /home/vagrant/.ssh/id_rsa.pub @PREFIXER_worker1
ssh-copy-id -i /home/vagrant/.ssh/id_rsa.pub @PREFIXER_worker2
ssh-copy-id -i /home/vagrant/.ssh/id_rsa.pub @PREFIXER_worker3

echo "copy hadoop.tar.gz into workers"
cd /usr/local
scp ./hadoop.tar.gz @PREFIXER_worker1:/home/vagrant
scp ./hadoop.tar.gz @PREFIXER_worker2:/home/vagrant
scp ./hadoop.tar.gz @PREFIXER_worker3:/home/vagrant

echo "unzip hadoop.tar.gz in @PREFIXER_worker1"
ssh @PREFIXER_worker1 "sudo tar -zxf /home/vagrant/hadoop.tar.gz -C /usr/local"
echo "unzip hadoop.tar.gz in @PREFIXER_worker2"
ssh @PREFIXER_worker2 "sudo tar -zxf /home/vagrant/hadoop.tar.gz -C /usr/local"
echo "unzip hadoop.tar.gz in @PREFIXER_worker3"
ssh @PREFIXER_worker3 "sudo tar -zxf /home/vagrant/hadoop.tar.gz -C /usr/local"

echo "copy spark.tar.gz into workers"
cd /usr/local
scp ./spark.tar.gz @PREFIXER_worker1:/home/vagrant
scp ./spark.tar.gz @PREFIXER_worker2:/home/vagrant
scp ./spark.tar.gz @PREFIXER_worker3:/home/vagrant

echo "unzip spark.tar.gz in @PREFIXER_worker1"
ssh @PREFIXER_worker1 "sudo tar -zxf /home/vagrant/spark.tar.gz -C /usr/local"
echo "unzip spark.tar.gz in @PREFIXER_worker2"
ssh @PREFIXER_worker2 "sudo tar -zxf /home/vagrant/spark.tar.gz -C /usr/local"
echo "unzip spark.tar.gz in @PREFIXER_worker3"
ssh @PREFIXER_worker3 "sudo tar -zxf /home/vagrant/spark.tar.gz -C /usr/local"
