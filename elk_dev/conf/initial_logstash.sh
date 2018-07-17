#/bin/bash!
set -e
sudo yum install -y wget
wget https://artifacts.elastic.co/downloads/logstash/logstash-6.3.1.tar.gz
tar -xvf logstash-6.3.1.tar.gz
cp -r logstash-6.3.1/ logstash_1/
cp -r logstash-6.3.1/ logstash_2/
cp share/logstash_1.yml logstash_1/config/logstash.yml
cp share/logstash_1.conf logstash_1/config/logstash.conf
cp share/logstash_2.yml logstash_2/config/logstash.yml
cp share/logstash_2.conf logstash_2/config/logstash.conf
cp share/run_logstash.sh .
