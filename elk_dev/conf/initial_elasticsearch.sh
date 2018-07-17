#/bin/bash!
set -e
sudo yum install -y wget
wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-6.3.1.rpm
sudo rpm --install elasticsearch-6.3.1.rpm
sudo cp share/elasticsearch_${1}.yml /etc/elasticsearch/elasticsearch.yml
cp share/run_elasticsearch.sh .
sudo sysctl -w vm.max_map_count=262144
