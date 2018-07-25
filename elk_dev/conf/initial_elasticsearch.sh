#/bin/bash!
set -e
sudo yum install -y wget


echo "Type \"yes\" to download elasticsearch-6.3.1.rpm or \"Enter\" to skip."
read ans
if [[ $ans == "yes" ]]; then
	wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-6.3.1.rpm
	sudo rpm --install elasticsearch-6.3.1.rpm
fi

echo "what config file do you wnat to copy? (m)aster or (s)lave"
read ans
sudo cp share/elasticsearch_${ans}.yml /etc/elasticsearch/elasticsearch.yml

cp share/run_elasticsearch.sh .
sudo sysctl -w vm.max_map_count=262144
