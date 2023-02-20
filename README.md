
Docker image to run Cloudflare Warp in proxy mode.

## Usage

```
docker run -d -p 40000:40000 -e LICENSE="" --restart=unless-stopped zenexas/warp-cli:latest
```

Input your WARP PLUS LICENSE key

SOCKS5 proxy server will be listening at port 40000.

<br/><br/>
RUN :
```
curl -s4m8 -x socks5://127.0.0.1:40000 https://www.cloudflare.com/cdn-cgi/trace | grep warp | sed "s/warp=//g"
```

Test your WARP account type
