dd if=/dev/zero of=/swapfile bs=1024 count=2097152
mkswap /swapfile
chmod 0600 /swapfile
swapon /swapfile
vi /etc/fstab 

yum install  rsync  python*  telnet ruby*  java* sudo  openssh-server openssh-clients
systemctl status sshd
vi  /etc/pam.d/su

systemctl start ntpd
systemctl status ntpd

vi  /etc/sysconfig/network
vi /etc/profile
/bin/hostname

ssh-keygen
chmod 700 .ssh
cd .ssh/
cp id_rsa.pub authorized_keys
ssh node3
ssh-copy-id -i id_rsa.pub node3
ssh-copy-id -i id_rsa.pub node4
yum install -y dialog
yum install -y pstack
yum install -y mcelog
yum install -y sysstat
rpm -Uvh vertica-9.1.1-0.x86_64.RHEL6.rpm
yum update tzdata

/opt/vertica/sbin/install_vertica -s node2,node3,node4 -r /root/vertica-9.1.1-0.x86_64.RHEL6.rpm
vi /etc/sysconfig/clock
vi /etc/sysctl.conf
vi /etc/selinux/config
setenforce 0
/opt/vertica/sbin/install_vertica -s node2,node3,node4 -r /root/vertica-9.1.1-0.x86_64.RHEL6.rpm --failure-threshold FAIL

rpm -Uvh vertica-console-9.1.1-0.x86_64.RHEL6.rpm 
cat /opt/vertica/config/apikeys.dat
