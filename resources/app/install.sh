curdir=$(cd $(dirname $0); pwd)

kubectl create ns test
kubectl label namespace test istio-injection=enabled

kubectl apply -f $curdir/nginx.yaml
kubectl apply -f $curdir/traffic-gen.yaml