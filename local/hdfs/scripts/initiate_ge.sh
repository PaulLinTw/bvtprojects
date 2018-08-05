source /vagrant/incl.sh

sp_ver="2.3.0"

echo "Install Graphite Exporter.."

# install git
sudo  yum -y install git
# install golang
cd ~
git clone https://github.com/canha/golang-tools-install-script.git
cd golang-tools-install-script/
bash goinstall.sh --64
exit
cat ~/.bashrc
# download graphite_exporter to go/src/github.com/prometheus/
mkdir -p go/src/github.com/prometheus/
cd go/src/github.com/prometheus/
git clone https://github.com/prometheus/graphite_exporter.git
# build graphite_exporter
cd graphite_exporter/
make

echo "Graphite Exporter deployed"

