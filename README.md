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
gpg -d secure.tar.gz.gpg | tar xzvf -
docker build . -t openvpn
docker run --restart=always --name openvpn -v /etc/localtime:/etc/localtime:ro -d -p 443:443 --cap-add=NET_ADMIN --device=/dev/net/tun openvpn
```


## P.S.
To create an encrypted compressed tar archive with GnuPG:
```
tar czvpf - ca.crt ca.key dh2048.pem server.crt server.key ta.key | gpg --symmetric --cipher-algo aes256 -o secure.tar.gz.gpg
```

To uncompress an archive file encrypted with GnuPG:
```
gpg -d secure.tar.gz.gpg | tar xzvf - 
```
