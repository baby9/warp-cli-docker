
Docker image to run Cloudflare Warp in proxy mode.

## Usage

```
docker run -d -p 40000:40000 -e LICENSE="" --restart=unless-stopped zenexas/warp-cli:latest
```
Upgrade to warp plus if you have `LICENSE` key

HTTP & SOCKS5 proxy server will be listening at port 40000.
<br/><br/>
#### RUN :
```
curl -x socks5://127.0.0.1:40000 https://www.cloudflare.com/cdn-cgi/trace | grep warp
```
Print your warp account type
<br/><br/>
````
curl -s -x http://127.0.0.1:40000 https://ipinfo.io
````
Lookup your warp ip location
<br/><br/>
````
curl -x socks5://127.0.0.1:40000 https://speed.cloudflare.com/__down?bytes=1000000000 > /dev/null
````
Speedtest
