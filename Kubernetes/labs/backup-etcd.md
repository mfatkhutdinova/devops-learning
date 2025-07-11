## Back Up the etcd Data
Back up the etcd data:
```
ETCDCTL_API=3 etcdctl snapshot save /home/cloud_user/etcd_backup.db \
--endpoints=https://etcd1:2379 \
--cacert=/home/cloud_user/etcd-certs/etcd-ca.pem \
--cert=/home/cloud_user/etcd-certs/etcd-server.crt \
--key=/home/cloud_user/etcd-certs/etcd-server.key
```
Restore the etcd Data from the Backup
Stop etcd:
```
sudo systemctl stop etcd
```
Delete the existing etcd data:
```
sudo rm -rf /var/lib/etcd
```
Restore etcd data from a backup:
```
sudo ETCDCTL_API=3 etcdctl snapshot restore /home/cloud_user/etcd_backup.db \
--initial-cluster etcd-restore=https://etcd1:2380 \
--initial-advertise-peer-urls https://etcd1:2380 \
--name etcd-restore \
--data-dir /var/lib/etcd
```
Set database ownership:
```
sudo chown -R etcd:etcd /var/lib/etcd
```
Start etcd:
```
sudo systemctl start etcd
```
Verify the system is working:
```
ETCDCTL_API=3 etcdctl get cluster.name \
--endpoints=https://etcd1:2379 \
--cacert=/home/cloud_user/etcd-certs/etcd-ca.pem \
--cert=/home/cloud_user/etcd-certs/etcd-server.crt \
--key=/home/cloud_user/etcd-certs/etcd-server.key
```
