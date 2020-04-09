#!/bin/bash
if ! [ $(id -u) = 0 ]; then
   echo "This script must be run as root"
   exit 1
fi
set -eux
# TODO: переделать установку node-exporter
curl -sSfL https://github.com/prometheus/node_exporter/releases/download/v0.18.1/node_exporter-0.18.1.linux-amd64.tar.gz -o- | \
tar -xzf - -C /tmp --strip-components=1 --wildcards --no-anchored 'node_exporter'
cp /tmp/node_exporter /usr/bin/prometheus-node-exporter
cp ./node-exporter/node-exporter-default-config /etc/default/prometheus-node-exporter
cp ./node-exporter/prometheus-node-exporter.service /etc/systemd/system/prometheus-node-exporter.service

useradd --comment "Prometheus daemon" --home-dir /var/lib/prometheus --create-home --system --shell /usr/sbin/nologin prometheus

systemctl daemon-reload
systemctl enable prometheus-node-exporter.service
systemctl start prometheus-node-exporter.service
