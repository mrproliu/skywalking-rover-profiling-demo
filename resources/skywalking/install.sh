rm -rf skywalking-kubernetes && git clone https://github.com/apache/skywalking-kubernetes.git
cd skywalking-kubernetes/chart
helm dep up skywalking
helm -n istio-system install skywalking skywalking \
                       --set elasticsearch.imageTag=7.5.1 \
                       --set oap.replicas=1 \
                       --set elasticsearch.replicas=1 \
                       --set ui.image.tag=9.1.0 \
                       --set oap.image.tag=9.1.0 \
                       --set oap.storageType=elasticsearch

curdir=$(cd $(dirname $0); pwd)
kubectl apply -f $curdir/rover.yaml