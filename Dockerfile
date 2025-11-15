FROM alpine:latest

RUN apk add --no-cache wireguard-tools

RUN mkdir -p /etc/wireguard && \
    cd /etc/wireguard && \
    umask 077 && \
    wg genkey | tee private.key | wg pubkey > public.key

CMD sh -c "\
  echo '=== WIREGUARD PUBLIC KEY ==='; \
  cat /etc/wireguard/public.key; \
  echo '============================='; \
  echo 'Container is running...'; \
  sleep infinity\
