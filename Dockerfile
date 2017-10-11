FROM ubuntu
RUN apt-get update && \
    apt-get install -y  build-essential openvpn iptables

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x  /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
ADD  . /etc/openvpn
WORKDIR /etc/openvpn
CMD openvpn --config /etc/openvpn/server.conf 
