set -o xtrace
gcloud container clusters create us-cluster --zone us-west1-a --scopes \
"cloud-platform,storage-ro,logging-write,monitoring-write,service-control,service-management,https://www.googleapis.com/auth/ndev.clouddns.readwrite" &

gcloud container clusters create europe-cluster --zone europe-west1-b --scopes \
"cloud-platform,storage-ro,logging-write,monitoring-write,service-control,service-management,https://www.googleapis.com/auth/ndev.clouddns.readwrite" &

gcloud container clusters create europe-cluster --zone europe-west1-d --scopes \
"cloud-platform,storage-ro,logging-write,monitoring-write,service-control,service-management,https://www.googleapis.com/auth/ndev.clouddns.readwrite" &


gcloud container clusters create asia-cluster --zone asia-east1-a --scopes \
"cloud-platform,storage-ro,logging-write,monitoring-write,service-control,service-management,https://www.googleapis.com/auth/ndev.clouddns.readwrite"





