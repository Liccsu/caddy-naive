# 1. 使用官方构建环境
FROM caddy:builder AS builder

# 2. 编译
# 输出到 /usr/bin/caddy
RUN xcaddy build \
    --with github.com/caddyserver/forwardproxy \
    --output /usr/bin/caddy

# 3. 运行环境
FROM caddy:latest

# 4. 复制编译好的程序
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
