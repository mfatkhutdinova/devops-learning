## Create a PersistentVolume
Create a YAML file named localdisk.yml:
```
vim localdisk.yml:

apiVersion: storage.k8s.io/v1
kind: StorageClass
metadata:
  name: localdisk
provisioner: kubernetes.io/no-provisioner
allowVolumeExpansion: true
```
Create a storage class using the YAML file:
```
kubectl create -f localdisk.yml
```
Create a YAML file named host-storage-pv.yml:
```
vim host-storage-pv.yml:

apiVersion: v1
kind: PersistentVolume
metadata:
  name: host-storage-pv
spec:
  storageClassName: localdisk
  persistentVolumeReclaimPolicy: Recycle
  capacity:
    storage: 1Gi
  accessModes:
    - ReadWriteOnce
  hostPath:
    path: /etc/data
```
Create the PersistentVolume:
```
kubectl create -f host-storage-pv.yml
```
Check the status of the volume:
```
kubectl get pv host-storage-pv
```

## Create a Pod That Uses the PersistentVolume for Storage
Create a YAML file named host-storage-pvc.yml:
```
vim host-storage-pvc.yml:

apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: host-storage-pvc
  namespace: auth
spec:
  storageClassName: localdisk
  accessModes:
    - ReadWriteOnce
  resources:
    requests:
      storage: 100Mi
```
Create the PersistentVolumeClaim * in the same namespace as the pod:
```
kubectl create -f host-storage-pvc.yml
```
Check the status of the PersistentVolumeClaim:
```
kubectl get pv
```
Verify that the claim is bound to the volume:
```
kubectl get pvc -n auth
```
Create a YAML file named pv-pod.yml:
```
vim pv-pod.yml:

apiVersion: v1
kind: Pod
metadata:
  name: pv-pod
  namespace: auth
spec:
  containers:
  - name: busybox
    image: busybox
    command: ['sh', '-c', 'while true; do echo success > /output/output.log; sleep 5; done']
    volumeMounts:
    - name: pv-storage
      mountPath: /output
  volumes:
  - name: pv-storage
    persistentVolumeClaim:
      claimName: host-storage-pvc
```
Create the pod:
```
kubectl create -f pv-pod.yml
```
