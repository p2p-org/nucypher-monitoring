#!/bin/bash
if ! [ $(id -u) = 0 ]; then
   echo "This script must be run as root"
   exit 1
fi
set -eux
curl -sSfL https://github.com/prometheus/node_exporter/releases/download/v0.18.1/node_exporter-0.18.1.linux-amd64.tar.gz -o- | \
tar -xzf - -C /usr/bin/ --strip-components=1 --wildcards --no-anchored 'node_exporter'
cp ./node-exporter/node-exporter-default-config /etc/default/prometheus-node-exporter
cp ./node-exporter/prometheus-node-exporter.service /etc/system/systemd/prometheus-node-exporter.service

systemd daemon-reload
systemd enable prometheus-node-exporter.service
systemd start prometheus-node-exporter.service
