set -o xtrace
kubectl run nginx --image nginx --replicas 3 --port 80
kubectl expose deploy nginx --port 80 --target-port 80 --type LoadBalancer
