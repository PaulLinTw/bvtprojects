source /vagrant/incl.sh

echo "=== Start docker and kubelet services ==="
systemctl start docker && systemctl enable docker
systemctl start kubelet && systemctl enable kubelet

echo "=== Change the cgroup-driver ==="
docker info | grep -i cgroup
sed -i 's/cgroup-driver=systemd/cgroup-driver=cgroupfs/g' /etc/systemd/system/kubelet.service.d/10-kubeadm.conf
systemctl daemon-reload
systemctl restart kubelet
