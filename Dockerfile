FROM alpine:latest

# Установка пакетов с повторными попытками и кешированием
RUN apk update --no-cache && \
    apk add --no-cache --virtual .build-deps \
    curl \
    unzip && \
    # Повторные попытки загрузки V2Ray
    for i in 1 2 3; do \
        curl -L -o v2ray.zip https://github.com/v2fly/v2ray-core/releases/download/v5.12.1/v2ray-linux-64.zip && \
        unzip v2ray.zip && \
        break || sleep 2; \
    done && \
    mv v2ray /usr/local/bin/ && \
    mv v2ctl /usr/local/bin/ && \
    # Очистка
    rm -rf v2ray.zip geoip.dat geosite.dat && \
    apk del .build-deps && \
    rm -rf /var/cache/apk/*

COPY config.json /etc/v2ray/config.json

EXPOSE 8080

CMD ["/usr/local/bin/v2ray", "run", "-config", "/etc/v2ray/config.json"]