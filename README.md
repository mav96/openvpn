# openvpn
OpenVPN in Docker

## Create and copy keys to openvpn folder
```
ca.crt
server.crt 
server.key
dh2048.pem
ta.key
```

See https://www.digitalocean.com/community/tutorials/how-to-set-up-an-openvpn-server-on-ubuntu-16-04

## Build and start
```
cd openvpn
docker build . -t openvpn
docker run --name openvpn -v /etc/localtime:/etc/localtime:ro -d -p 443:443 --cap-add=NET_ADMIN --device=/dev/net/tun openvpn
```
