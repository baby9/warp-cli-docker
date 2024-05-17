#!/bin/bash

(
    if [ ! -f /var/lib/cloudflare-warp/reg.json ]; then
        while ! warp-cli --accept-tos register; do
            sleep 1
            >&2 echo "Awaiting warp-svc become online..."
        done
    fi

    if [ ! -z $LICENSE ]; then
        warp-cli --accept-tos set-license $LICENSE
    fi

    warp-cli --accept-tos set-mode proxy
    warp-cli --accept-tos set-proxy-port 40001
    warp-cli --accept-tos connect
    
    # socat is used to redirect traffic from 40000 to 40001
    socat TCP-LISTEN:40000,fork TCP:localhost:40001 &
) &

exec warp-svc
