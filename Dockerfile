FROM caddy:builder AS builder

RUN xcaddy build \
    --with github.com/greenpau/caddy-auth-jwt \
    --with github.com/greenpau/caddy-auth-portal

FROM caddy:latest

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
