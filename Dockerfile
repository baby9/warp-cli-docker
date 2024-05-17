ARG DEBIAN_RELEASE=bullseye
FROM docker.io/debian:$DEBIAN_RELEASE-slim
ARG DEBIAN_RELEASE
COPY entrypoint.sh /
ENV DEBIAN_FRONTEND noninteractive
RUN true && \
    apt update && \
    apt install -y gnupg ca-certificates curl socat && \
    curl https://pkg.cloudflareclient.com/pubkey.gpg | gpg --yes --dearmor --output /usr/share/keyrings/cloudflare-warp-archive-keyring.gpg && \
    echo "deb [arch=amd64 signed-by=/usr/share/keyrings/cloudflare-warp-archive-keyring.gpg] https://pkg.cloudflareclient.com/  $DEBIAN_RELEASE main" | tee /etc/apt/sources.list.d/cloudflare-client.list && \
    apt update && \
    apt install cloudflare-warp -y --no-install-recommends && \
    apt autoremove --yes && \
    apt clean -y && \
    rm -rf /var/lib/apt/lists/* && \
    chmod +x /entrypoint.sh
    
EXPOSE 40000
ENTRYPOINT [ "/entrypoint.sh" ]
