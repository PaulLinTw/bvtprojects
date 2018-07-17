#/bin/bash!
set -e
sudo yum install -y wget
wget https://artifacts.elastic.co/downloads/kibana/kibana-6.3.1-x86_64.rpm
sudo rpm --install kibana-6.3.1-x86_64.rpm
sudo cp share/kibana.yml /etc/kibana/kibana.yml
