## Upgrade All Kubernetes Components on the Control Plane Node
Upgrade kubeadm:
```
sudo apt-get update && \
sudo apt-get install -y --allow-change-held-packages kubeadm=1.27.2-1.1
```
Drain the control plane node:
```
kubectl drain acgk8s-control --ignore-daemonsets
```
Plan the upgrade:
```
sudo kubeadm upgrade plan v1.27.2
```
Apply the upgrade:
```
sudo kubeadm upgrade apply v1.27.2
```
Upgrade kubelet and kubectl:
```
sudo apt-get update && \
sudo apt-get install -y --allow-change-held-packages kubelet=1.27.2-1.1 kubectl=1.27.2-1.1
```
Reload:
```
sudo systemctl daemon-reload
```
Restart kubelet:
```
sudo systemctl restart kubelet
```
Uncordon the control plane node:
```
kubectl uncordon acgk8s-control
```

## Upgrade All Kubernetes Components on the Worker Nodes
Drain the worker1 node:
```
kubectl drain acgk8s-worker1 --ignore-daemonsets --force
```
SSH into the node:
```
ssh acgk8s-worker1
```
Install a new version of kubeadm:
```
sudo apt-get update && \
sudo apt-get install -y --allow-change-held-packages kubeadm=1.27.2-1.1
```
Upgrade the node:
```
sudo kubeadm upgrade node
```
Upgrade kubelet and kubectl:
```
sudo apt-get update && \
sudo apt-get install -y --allow-change-held-packages kubelet=1.27.2-1.1 kubectl=1.27.2-1.1
```
Reload:
```
sudo systemctl daemon-reload
```
Restart kubelet:
```
sudo systemctl restart kubelet
```
Type exit to exit the node.

Uncordon the node:
```
kubectl uncordon acgk8s-worker1
```
