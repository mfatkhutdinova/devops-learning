## Create a Networkpolicy That Denies All Access to the Maintenance Pod

Create a new YAML file named np-maintenance.yml:
```
vim np-maintenance.yml:

apiVersion: networking.k8s.io/v1
kind: NetworkPolicy
metadata:
  name: np-maintenance
  namespace: foo
spec:
  podSelector:
    matchLabels:
      app: maintenance
  policyTypes:
  - Ingress
  - Egress
```

Create the NetworkPolicy:
```
kubectl create -f np-maintenance.yml
```

## Create a Networkpolicy That Allows All Pods in the users-backend Namespace to Communicate with Each Other Only on a Specific Port
Label the users-backend namespace:
```
kubectl label namespace users-backend app=users-backend
```
Create a YAML file named np-users-backend-80.yml:
```
vim np-users-backend-80.yml:

apiVersion: networking.k8s.io/v1
kind: NetworkPolicy
metadata:
  name: np-users-backend-80
  namespace: users-backend
spec:
  podSelector: {}
  policyTypes:
  - Ingress
  ingress:
  - from:
    - namespaceSelector:
        matchLabels:
          app: users-backend
    ports:
    - protocol: TCP
      port: 80
```
Create the NetworkPolicy:
```
kubectl create -f np-users-backend-80.yml
```
