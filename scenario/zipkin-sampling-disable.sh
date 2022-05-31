curdir=$(cd $(dirname $0); pwd)

istioctl install -y --set profile=demo \
	--set 'meshConfig.enableTracing=false' \
	--set 'meshConfig.defaultConfig.tracing.sampling=0.0' \
	--set 'meshConfig.defaultConfig.proxyStatsMatcher.inclusionRegexps[0]=.*upstream_rq_total.*'

sh $curdir/../resources/skywalking/install.sh
sh $curdir/../resources/app/install.sh
sh $curdir/../resources/prometheus/install.sh
