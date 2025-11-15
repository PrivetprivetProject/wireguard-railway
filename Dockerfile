FROM linuxserver/wireguard:latest

RUN apk add --no-cache curl bash

COPY setup.sh /setup.sh
RUN chmod +x /setup.sh

EXPOSE 51820/udp

CMD ["/bin/bash", "/setup.sh"]
