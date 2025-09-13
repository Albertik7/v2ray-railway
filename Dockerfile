FROM v2fly/v2fly-core:latest

# Копируем конфигурационный файл
COPY config.json /etc/v2ray/config.json

# Экспортируем порт
EXPOSE 8080

# Запускаем V2Ray
CMD ["v2ray", "-config=/etc/v2ray/config.json"]