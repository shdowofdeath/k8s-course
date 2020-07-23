for region in US ASIA EUROPE EUROPE_D; do
  echo ''
  echo '=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-==-==-==-=-=--=-=-==-=-=-=-=-=-=-=-=-=-='
  echo $region
  kubectl get $1 --no-headers --context $(eval echo "$"$region) -n $2 | sed 's/^/        /'
  echo '=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-==-==-=-=-=-=-=-====-=-=-=--=-=-=-=-=-==-=-=-=-=-=-=-='
done
echo '' 
