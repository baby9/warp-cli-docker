#!/bin/bash

(
while ! warp-cli --accept-tos register; do
	sleep 1
	>&2 echo "Awaiting warp-svc become online..."
done
warp-cli --accept-tos set-license $1
warp-cli --accept-tos set-mode proxy
warp-cli --accept-tos set-proxy-port 40001
warp-cli --accept-tos connect
warp-cli enable-always-on
haproxy -f /etc/haproxy/haproxy.cfg
) &

exec warp-svc
warp-cli enable-always-on
