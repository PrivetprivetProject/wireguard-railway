FROM alpine:latest

RUN apk add --no-cache wireguard-tools

CMD ["sh", "-c", "
  cd /etc/wireguard &&
  umask 077 &&
  wg genkey | tee private.key | wg pubkey > public.key &&
  echo 'PUBLIC KEY:' &&
  cat public.key &&
  echo '' &&
  echo 'Starting sleep...' &&
  sleep infinity
"]
