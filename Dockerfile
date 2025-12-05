FROM caddy:builder AS builder

RUN xcaddy build \
    --with github.com/caddyserver/forwardproxy \
    --output /usr/bin/caddy

FROM caddy:latest

USER root

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
