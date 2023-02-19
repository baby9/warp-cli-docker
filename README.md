[![docker-ci](https://github.com/SCys/cloudflare_warp_proxy_docker/actions/workflows/docker-ci.yml/badge.svg)](https://github.com/SCys/cloudflare_warp_proxy_docker/actions/workflows/docker-ci.yml)
![Docker Pulls](https://img.shields.io/docker/pulls/scys/warp-proxy)
![Docker Image Size (latest by date)](https://img.shields.io/docker/image-size/scys/warp-proxy)

Docker image to run Cloudflare Warp in proxy mode. Image is rebuilt and updated every day.

## Usage

```
docker run -d -p 40000:40000 -e LICENSE="" --restart always zenexas/warp-cli:latest
```

Input your WARP PLUS LICENSE key

SOCKS5 proxy server will be listening at port 40000.

<br/><br/>
RUN :
```
curl -s4m8 -x socks5://127.0.0.1:40000 https://www.cloudflare.com/cdn-cgi/trace | grep warp | sed "s/warp=//g"
```

Test your WARP account type
