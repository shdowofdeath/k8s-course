gcloud container clusters delete us-cluster --zone us-west1-a --quiet &
gcloud container clusters delete europe-cluster --zone europe-west1-b --quiet &
gcloud container clusters delete europe-d-cluster --zone europe-west1-d --quiet &
gcloud container clusters delete asia-cluster --zone asia-east1-a --quiet
gcloud compute addresses delete global-ingress --global --quiet 
gcloud compute firewall-rules delete federated-ingress-firewall-rule --quiet
gcloud dns managed-zones delete federation --quiet

say clusters deleted

kubectl config delete-context federation 
kubectl config delete-context $US
kubectl config delete-context $EUROPE
kubectl config delete-context $ASIA
