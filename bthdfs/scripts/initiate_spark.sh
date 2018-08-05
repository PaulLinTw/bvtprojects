source /vagrant/incl.sh

sp_ver="2.3.1"
hd_ver="2.7"

echo "downlaoding spark-$sp_ver-bin-hadoop$hd_ver.tgz .."

cd /home/vagrant

wget -q https://archive.apache.org/dist/spark/spark-$sp_ver/spark-$sp_ver-bin-hadoop$hd_ver.tgz

tar -zxf ./spark-$sp_ver-bin-hadoop$hd_ver.tgz -C /usr/local

cd /usr/local/

mv ./spark-$sp_ver-bin-hadoop$hd_ver ./spark

echo "copy config file into spark"
cp /home/vagrant/share/spark-env.sh /usr/local/spark/conf/
echo "export JAVA_HOME=$JAVA_HOME" >> /usr/local/spark/conf/spark-env.sh

chown vagrant.vagrant -R spark

echo "zipping spark folder .."
cd /usr/local
tar -zcf ./spark.tar.gz ./spark

: << END
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
END

echo "spark deployed"

