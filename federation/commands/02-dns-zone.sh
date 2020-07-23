set -o xtrace
gcloud dns managed-zones create federation --description "Federation DNS Zone" --dns-name innercloud.com
