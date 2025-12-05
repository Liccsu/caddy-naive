# 1. 使用 v2.7.6 的构建环境（这个版本最稳）
FROM caddy:2.7.6-builder AS builder

# 2. 编译
# 注意：不再用 latest，而是基于当前基础镜像编译
# 输出到 /usr/bin/caddy
RUN xcaddy build \
    --with github.com/caddyserver/forwardproxy=github.com/klzgrad/forwardproxy@caddy2 \
    --output /usr/bin/caddy

# 3. 运行环境也必须必须是 v2.7.6
FROM caddy:2.7.6

# 4. 复制编译好的程序
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
