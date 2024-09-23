## Drain the Worker1 Node
Attempt to drain the worker1 node:
```
kubectl drain acgk8s-worker1
```
Override the errors and drain the node:
```
kubectl drain acgk8s-worker1 --delete-local-data --ignore-daemonsets --force
```
