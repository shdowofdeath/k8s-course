set -o xtrace
kubefed init federation --host-cluster-context=$US --dns-zone-name=innercloud.com. --dns-provider 'google-clouddns'
kubectl config use-context federation
