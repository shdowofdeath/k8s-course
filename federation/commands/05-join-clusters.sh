set -o xtrace
kubefed join us-cluster --cluster-context=$US --host-cluster-context=$US
kubefed join europe-cluster --cluster-context=$EUROPE --host-cluster-context=$US
kubefed join europe-d-cluster --cluster-context=$EUROPE_D --host-cluster-context=$US
kubefed join asia-cluster --cluster-context=$ASIA --host-cluster-context=$US

kubectl create namespace default
