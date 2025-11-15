#!/bin/bash

mkdir -p /config/wireguard

if [ ! -f /config/wireguard/server_private.key ]; then
    cd /config/wireguard
    umask 077
    
    wg genkey | tee server_private.key | wg pubkey > server_public.key
    
    cat > wg0.conf << EOF
[Interface]
PrivateKey = $(cat server_private.key)
Address = 10.8.0.1/24
ListenPort = 51820
SaveConfig = true
EOF

    echo "=== WIREGUARD SERVER SETUP COMPLETE ==="
    echo "Public Key: $(cat server_public.key)"
    echo "========================================"
fi

wg-quick up wg0

while true; do
    sleep 3600
done
