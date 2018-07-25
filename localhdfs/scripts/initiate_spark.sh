source /vagrant/incl.sh

sp_ver="2.3.1"

echo "downlaoding spark-$sp_ver .."

cd /home/vagrant

wget -q http://apache.stu.edu.tw/spark/spark-$sp_ver/spark-$sp_ver-bin-hadoop2.7.tgz

tar -zxf ./spark-$sp_ver-bin-hadoop2.7.tgz -C /usr/local

cd /usr/local/

mv ./spark-$sp_ver-bin-hadoop2.7 ./spark

echo "copy spark-env.sh into spark/conf"
cp /home/vagrant/share/spark-env.sh /usr/local/spark/conf/
echo "export JAVA_HOME=$JAVA_HOME" >> /usr/local/spark/conf/spark-env.sh

chown vagrant.vagrant -R spark

echo "zipping spark folder .."
cd /usr/local
tar -zcf ./spark.tar.gz ./spark

: << END
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
END

echo "spark deployed"

