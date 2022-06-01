rm -rf skywalking-kubernetes && git clone https://github.com/apache/skywalking-kubernetes.git
cd skywalking-kubernetes/chart
helm dep up skywalking
helm -n istio-system install skywalking skywalking \
                       --set fullnameOverride=skywalking \
                       --set elasticsearch.replicas=2 \
                       --set elasticsearch.minimumMasterNodes=1 \
                       --set elasticsearch.imageTag=7.5.1 \
                       --set elasticsearch.nodeSelector.role=skywalking \
                       --set oap.replicas=2 \
                       --set oap.nodeSelector.role=skywalking \
                       --set ui.image.repository=gcr.io/hanliu-20211231-155028/ui \
                       --set ui.image.tag=latest \
                       --set ui.image.pullPolicy=Always \
                       --set ui.nodeSelector.role=skywalking \
                       --set oap.image.tag=latest \
                       --set oap.image.pullPolicy=Always \
                       --set oap.image.repository=gcr.io/hanliu-20211231-155028/oap \
                       --set oap.storageType=elasticsearch

curdir=$(cd $(dirname $0); pwd)
kubectl apply -f $curdir/rover.yaml