FROM alpine:latest

RUN apk add --no-cache curl unzip && \
    curl -L -o v2ray.zip https://github.com/v2fly/v2ray-core/releases/download/v5.12.1/v2ray-linux-64.zip && \
    unzip v2ray.zip && \
    mv v2ray /usr/bin/ && \
    mv v2ctl /usr/bin/ && \
    rm -f v2ray.zip && \
    apk del curl unzip

COPY config.json /etc/v2ray/config.json

EXPOSE 8080

CMD ["v2ray", "run", "-config", "/etc/v2ray/config.json"]