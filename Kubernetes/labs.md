## Performing a Kubernetes Upgrade with kubeadm 
```
sudo apt-get update && sudo apt-get install -y --allow-change-held-packages kubeadm=1.27.2-1.1
kubectl get nodes -o wide
kubectl drain k8s-control --ignore-daemonsets
sudo kubeadm upgrade plan v1.27.2
sudo kubeadm upgrade apply v1.27.2
sudo apt-get update && sudo apt-get install -y --allow-change-held-packages kubelet=1.27.2-1.1 kubectl=1.27.2-1.1
sudo systemctl daemon-reload
sudo systemctl restart kubelet
kubectl uncordon k8s-contol
kubectl get nodes
```

Worker node:
```
sudo apt-get update && sudo apt-get install -y --allow-change-held-packages kubeadm=1.27.2-1.1
sudo kubeadm upgrade node
sudo systemctl daemon-reload
sudo systemctl restart kubelet
```

## Backing up and Restoring Kubernetes Data in etcd
```
ETCDCTL_API=3 etcdctl get cluster.name --endpoints=https://10.0.1.101:2379 --cacert=/home/cloud_user/etcd-certs/etcd-ca.pem --cert=/home/cloud_user/etcd-certs/etcd-server.crt --key=/home/cloud_user/etcd-certs/etcd-server.key
ETCDCTL_API=3 etcdctl snapshot save /home/cloud_user/etcd_backup.db --endpoints=https://10.0.1.101:2379 --cacert=/home/cloud_user/etcd-certs/etcd-ca.pem --cert=/home/cloud_user/etcd-certs/etcd-server.crt --key=/home/cloud_user/etcd-certs/etcd-server.key
sudo systemctl stop etcd
sudo rm -rf /var/lib/etcd
sudo ETCDCTL_API=3 etcdctl snapshot restore /home/cloud_user/etcd_backup.db --initial-cluster etcd-restore=https://10.0.1.101:2380 --initial-advertise-peer-urls https://10.0.1.101:2380 --name etcd-restore --data-dir /var/lib/etcd
sudo chown -R etcd:etcd /var/lib/etcd
sudo systemctl start etcd
```
