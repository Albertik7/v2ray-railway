FROM v2fly/v2fly-core:latest

# Копируем конфиг
COPY config.json /etc/v2ray/config.json

# Запускаем V2Ray
CMD ["v2ray", "-config=/etc/v2ray/config.json"]
