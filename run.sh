#!/bin/bash

podman run -d \
    --name caddy \
    --publish 8080:80 \
    --restart always \
    --mount type=bind,source=$PWD/Caddyfile,target=/etc/caddy/Caddyfile,readonly,relabel=private \
    --mount type=volume,source=caddy_data,target=/data,relabel=private \
    caddy:2.8.4-alpine

podman logs -f caddy