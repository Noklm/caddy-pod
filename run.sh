#!/bin/bash

podman run -d \
    --name caddy \
    --publish 80:80 \
    --publish 443:443 \
    --restart always \
    --network slirp4netns \
    --mount type=bind,source=$PWD/Caddyfile,target=/etc/caddy/Caddyfile,readonly,relabel=private \
    --mount type=volume,source=caddy_data,target=/data,relabel=private \
    --mount type=bind,source=/media/nextcloud,target=/var/www/html,relabel=shared \
    caddy:2.9.1-alpine

podman logs -f caddy