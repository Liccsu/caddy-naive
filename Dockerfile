# 1. 使用官方 Builder
FROM caddy:builder AS builder

# 2. 集成 klzgrad/forwardproxy 插件 (防探测版本)
RUN xcaddy build \
    --with github.com/caddyserver/forwardproxy=github.com/klzgrad/forwardproxy@caddy2

# 3. 产出最终镜像
FROM caddy:latest

# 4. 将编译好的 caddy 覆盖过去
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
