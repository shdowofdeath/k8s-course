set -o xtrace

kubectl delete ns federation-system --context $US
kubectl delete ns federation-system --context $EUROPE
kubectl delete ns federation-system --context $ASIA

kubectl delete serviceaccount us-cluster-us-cluster -n federation-system --context $US

kubectl delete clusterrole federation-controller-manager:federation-us-cluster-us-cluster --context $US
kubectl delete clusterrole federation-controller-manager:federation-europe-cluster-us-cluster --context $EUROPE
kubectl delete clusterrole federation-controller-manager:federation-asia-cluster-us-cluster --context $ASIA

kubectl delete clusterrolebindings federation-controller-manager:federation-us-cluster-us-cluster --context $US
kubectl delete clusterrolebindings federation-controller-manager:federation-europe-cluster-us-cluster --context $EUROPE
kubectl delete clusterrolebindings federation-controller-manager:federation-asia-cluster-us-cluster --context $ASIA
