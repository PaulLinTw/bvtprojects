source ./define.sh

sudo yum install -y wget
echo "Type \"yes\" to download logstash-6.3.1.tar.gz or \"Enter\" to skip."
read ans
if [[ $ans == "yes" ]]; then
	wget https://artifacts.elastic.co/downloads/logstash/logstash-6.3.1.tar.gz
	tar -xvf logstash-6.3.1.tar.gz
	cp -r logstash-6.3.1/ logstash_1/
	cp -r logstash-6.3.1/ logstash_2/
fi

echo "what config file do you wnat to copy? (m)aster or (s)lave"
read ans
cp share/logstash_${ans}1.yml logstash_1/config/logstash.yml
cp share/logstash_${ans}1.conf logstash_1/config/logstash.conf
cp share/logstash_${ans}2.yml logstash_2/config/logstash.yml
cp share/logstash_${ans}2.conf logstash_2/config/logstash.conf
cp share/run_logstash.sh .
