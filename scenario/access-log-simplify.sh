curdir=$(cd $(dirname $0); pwd)

istioctl install -y --set profile=demo \
  --set meshConfig.accessLogFormat="[%START_TIME%] \"%REQ(:METHOD)% %REQ(X-ENVOY-ORIGINAL-PATH?:PATH)% %PROTOCOL%\" %RESPONSE_CODE%\n" \
	--set 'meshConfig.defaultConfig.proxyStatsMatcher.inclusionRegexps[0]=.*upstream_rq_total.*'

sh $curdir/../resources/skywalking/install.sh
sh $curdir/../resources/app/install.sh
sh $curdir/../resources/prometheus/install.sh
