#/bin/bash!
set -e
sudo yum install -y wget
echo "Type \"yes\" to download and install kibana-6.3.1-x86_64.rpm or \"Enter\" to skip."
if [[ $ans == "yes" ]]; then
	wget https://artifacts.elastic.co/downloads/kibana/kibana-6.3.1-x86_64.rpm
	sudo rpm --install kibana-6.3.1-x86_64.rpm
fi

sudo cp share/kibana.yml /etc/kibana/kibana.yml
