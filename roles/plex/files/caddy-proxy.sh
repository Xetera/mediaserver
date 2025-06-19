#!/bin/bash

ip route del default || true
ip route add default via 10.8.0.2

# Start Caddy
caddy run --config /etc/caddy/Caddyfile --adapter caddyfile
