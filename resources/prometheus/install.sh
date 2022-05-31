curdir=$(cd $(dirname $0); pwd)

kubectl apply -f $curdir/prom.yaml
kubectl apply -f $curdir/grafana.yaml