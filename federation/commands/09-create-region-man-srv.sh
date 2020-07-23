set -o xtrace
kubectl create -f yamls/region-man/region-man-service.yaml
gcloud compute firewall-rules create federated-ingress-firewall-rule --source-ranges 130.211.0.0/22 --allow tcp:30040 --network default
