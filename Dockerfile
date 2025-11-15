FROM alpine:latest

RUN apk add --no-cache wireguard-tools bash

COPY generate-keys.sh /generate-keys.sh
RUN chmod +x /generate-keys.sh

CMD ["/generate-keys.sh"]
