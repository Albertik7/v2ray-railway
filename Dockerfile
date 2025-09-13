FROM alpine:latest

RUN apk add --no-cache curl unzip && \
    curl -L -o v2ray.zip https://github.com/v2fly/v2ray-core/releases/download/v5.12.1/v2ray-linux-64.zip && \
    unzip v2ray.zip && \
    mv v2ray /usr/local/bin/ && \
    mv v2ctl /usr/local/bin/ && \
    rm -rf v2ray.zip geoip.dat geosite.dat && \
    apk del curl unzip

COPY config.json /etc/v2ray/config.json

EXPOSE 8080

CMD ["/usr/local/bin/v2ray", "run", "-config", "/etc/v2ray/config.json"]