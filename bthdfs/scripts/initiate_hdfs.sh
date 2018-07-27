source /vagrant/incl.sh

echo "install wget"
sudo yum install -y wget
sudo yum install -y sshpass

hd_ver="3.1.0"

echo "downlaoding hadoop-$hd_ver .."

cd /home/vagrant

wget -q http://www.us.apache.org/dist/hadoop/common/hadoop-$hd_ver/hadoop-$hd_ver.tar.gz

tar -zxf ./hadoop-$hd_ver.tar.gz -C /usr/local

cd /usr/local/

mv ./hadoop-$hd_ver ./hadoop

#sudo chown -R vagrant:vagrant ./hadoop

echo "copy config file into hadoop"
cp /home/vagrant/share/core-site.xml /usr/local/hadoop/etc/hadoop/
cp /home/vagrant/share/hdfs-site.xml /usr/local/hadoop/etc/hadoop/
cp /home/vagrant/share/mapred-site.xml /usr/local/hadoop/etc/hadoop/
cp /home/vagrant/share/yarn-site.xml /usr/local/hadoop/etc/hadoop/
cp /home/vagrant/share/workers /usr/local/hadoop/etc/hadoop/
echo "export JAVA_HOME=$JAVA_HOME" >> /usr/local/hadoop/etc/hadoop/hadoop-env.sh

echo "zipping hadoop folder .."
cd /usr/local
rm -fr ./hadoop/tmp
tar -zcf ./hadoop.tar.gz ./hadoop

: << END

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

END

echo "hadoop deployed"
