# 第一阶段：构建
FROM caddy:builder AS builder

# 关键：编译并输出到一个独一无二的文件名 /caddy_custom
RUN xcaddy build --with github.com/caddyserver/forwardproxy=github.com/klzgrad/forwardproxy@caddy2 --output /caddy_custom

# 第二阶段：运行
FROM caddy:latest

# 关键：从上个阶段把那个独一无二的文件复制过来，覆盖掉系统原本的 caddy
COPY --from=builder /caddy_custom /usr/bin/caddy
