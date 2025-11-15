FROM linuxserver/wireguard:latest

# Устанавливаем дополнительные пакеты для отладки
RUN apk add --no-cache bash curl jq

# Копируем улучшенный скрипт
COPY setup.sh /setup.sh
RUN chmod +x /setup.sh

# Создаем директорию для конфигов
RUN mkdir -p /config/wireguard

EXPOSE 51820/udp

# Запускаем скрипт при старте
CMD ["/bin/bash", "/setup.sh"]
