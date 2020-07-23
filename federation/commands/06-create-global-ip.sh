set -o xtrace

gcloud compute addresses create global-ingress --global
gcloud compute addresses describe global-ingress --global
