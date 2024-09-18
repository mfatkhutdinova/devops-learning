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

## Useful commands:
```
kubectl top pod -n beebox-mobile --sort-by cpu --selector app=auth
kubectl get pv --sort-by=.spec.capacity.storage
kubectl exec quark -n beebox-mobile -- cat /etc/key/key.txt
kubectl delete service beebox-auth-svc -n beebox-mobile

kubectl get pod beebox-shipping-data -o yaml > beebox-shipping-data.yml
kubectl edit deployment beebox-web
kubectl rollout status deployment.v1.apps/beebox-web
kubectl scale deployment.v1.apps/beebox-web --replicas=5

systemctl status kubelet 
systemctl start kubelet 
systemctl enable kubelet 

kubectl get pods -n kube-system
kubectl describe pod podname -n kube-system

sudo journalctl -u kubelet
kubectl exec podname -c containername -- command
kubectl exec podname -c containername --stdin --tty -- /bin/sh 

do curl auth-db.data.svc.cluster.local
```

## Log files
```
/var/log/kube-apiserver.log
/var/log/kube-scheduler.log
/var/log/kube-controller-manager.log
```

## Yaml examples
```
cloud_user@k8s-control:~$ cat pod-reader-role.yml
apiVersion: rbac.authorization.k8s.io/v1
kind: Role
metadata:
  namespace: beebox-mobile
  name: pod-reader
rules:
- apiGroups: [""]
  resources: ["pods", "pods/log"]
  verbs: ["get", "watch", "list"]

---
cloud_user@k8s-control:~$ cat pod-reader-rolebinding.yml
apiVersion: rbac.authorization.k8s.io/v1
kind: RoleBinding
metadata:
  name: pod-reader
  namespace: beebox-mobile
subjects:
- kind: User
  name: dev
  apiGroup: rbac.authorization.k8s.io
roleRef:
  kind: Role
  name: pod-reader
  apiGroup: rbac.authorization.k8s.io
  
 ---
cloud_user@k8s-control:~$ cat maintenance-pod.yml
apiVersion: v1
kind: Pod
metadata:
  name: maintenance-pod
spec:
  containers:
  - name: busybox
    image: busybox
    command: ['sh', '-c', 'while true; do echo Success! >> /output/output.txt; sleep 5; done']
    volumeMounts:
    - name: output-vol
      mountPath: /output
  volumes:
  - name: output-vol
    hostPath:
      path: /var/data

---  
cloud_user@k8s-control:~$ cat shared-data-pod.yml
apiVersion: v1
kind: Pod
metadata:
  name: shared-data-pod
spec:
  containers:
  - name: busybox1
    image: busybox
    command: ['sh', '-c', 'while true; do echo Success! >> /output/output.txt; sleep5; done']
    volumeMounts:
    - name: shared-vol
      mountPath: /output
  - name: busybox2
    image: busybox
    command: ['sh', '-c', 'while true; do cat /output/output.txt; sleep 5; done']
    volumeMounts:
    - name: shared-vol
      mountPath: /input
  volumes:
  - name: shared-vol
    emptyDir: {}

---
cloud_user@k8s-control:~$ cat localdisk.yml
apiVersion: storage.k8s.io/v1
kind: StorageClass
metadata:
  name: localdisk
provisioner: kubernetes.io/no-provisioner
allowVolumeExpansion: true

---
cloud_user@k8s-control:~$ cat host-pv.yml
kind: PersistentVolume
apiVersion: v1
metadata:
  name: host-pv
spec:
  storageClassName: localdisk
  persistentVolumeReclaimPolicy: Recycle
  capacity:
    storage: 1Gi
  accessModes:
    - ReadWriteOnce
  hostPath:
    path: /var/output
	
kind: PersistentVolumeClaim
apiVersion: v1
metadata:
  name: host-pvc
spec:
  storageClassName: localdisk
  accessModes:
    - ReadWriteOnce
  resources:
    requests:
      storage: 100Mi

--- 
cloud_user@k8s-control:~$ cat pv-pod.yml
apiVersion: v1
kind: Podmetadata:
  name: pv-pod
spec:
  containers:
  - name: busybox
    image: busybox
    command: ['sh', '-c', 'while true; do echo Success! >> /output/output.txt; sleep 5; done']
    volumeMounts:
    - name: pv-storage
      mountPath: /output
  volumes:
  - name: pv-storage
    persistentVolumeClaim:
      claimName: host-pvc
```
