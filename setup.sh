#!/bin/bash

echo "=== STARTING WIREGUARD SETUP ==="

# Создаем директорию для конфигов
mkdir -p /config/wireguard
cd /config/wireguard

# Генерируем ключи с подробным выводом
echo "Generating server keys..."
umask 077

# Генерируем приватный ключ
wg genkey | tee server_private.key

# Генерируем публичный ключ из приватного
wg genkey | tee server_private.key | wg pubkey > server_public.key

# Создаем базовый конфиг
cat > wg0.conf << EOF
[Interface]
PrivateKey = $(cat server_private.key)
Address = 10.8.0.1/24
ListenPort = 51820
SaveConfig = true
PostUp = echo "WireGuard interface is up!"
PostDown = echo "WireGuard interface is down!"
EOF

echo "=== SERVER CONFIGURATION COMPLETE ==="
echo "Server Public Key: $(cat server_public.key)"
echo "Server Private Key: $(cat server_private.key)"
echo "Config file created: /config/wireguard/wg0.conf"
echo "=== END OF SETUP ==="

# Запускаем WireGuard
echo "Starting WireGuard..."
wg-quick up wg0

# Проверяем статус
echo "WireGuard status:"
wg show

# Бесконечный цикл
echo "Entering maintenance mode..."
while true; do
    sleep 3600
done
