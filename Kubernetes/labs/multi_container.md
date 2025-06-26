## Create a Multi-Container Pod
Create a YAML file named multi.yml:
```
apiVersion: v1
kind: Pod
metadata:
  name: multi
  namespace: baz
spec:
  containers:
  - name: nginx
    image: nginx
  - name: redis
    image: redis
```
Create the multi-container pod:
```
kubectl create -f multi.yml
```
Check the status of the pod:
```
kubectl get pods -n baz
```

## Create a Pod Which Uses a Sidecar to Expose the Main Container's Log File to Stdout
Create a YAML file named logging-sidecar.yml:
```
vim logging-sidecar.yml:

apiVersion: v1
kind: Pod
metadata:
  name: logging-sidecar
  namespace: baz
spec:
  containers:
  - name: busybox1
    image: busybox
    command: ['sh', '-c', 'while true; do echo Logging data > /output/output.log; sleep 5; done']
    volumeMounts:
    - name: sharedvol
      mountPath: /output
  - name: sidecar
    image: busybox
    command: ['sh', '-c', 'tail -f /input/output.log']
    volumeMounts:
    - name: sharedvol
      mountPath: /input
  volumes:
  - name: sharedvol
    emptyDir: {}
```
Create the logging-sidecar pod:
```
kubectl create -f logging-sidecar.yml
```
Check the status of the pod:
```
kubectl get pods -n baz
```
Check the logging-sidecar logs:
```
kubectl logs logging-sidecar -n baz -c sidecar
```
