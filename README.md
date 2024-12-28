# Caddy with Podman
## Install
```sh
git clone https://github.com/Noklm/caddy-pod.git
cd caddy-pod
./run.sh
```

## Reload Caddyfile
```sh
podman exec -w /etc/caddy caddy caddy reload
```