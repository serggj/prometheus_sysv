#!/bin/bash
wget https://github.com/prometheus/haproxy_exporter/releases/download/v0.8.0/haproxy_exporter-0.8.0.linux-amd64.tar.gz
useradd --no-create-home --system --shell /bin/false haproxy_exporter
tar xvf haproxy_exporter-0.8.0.linux-amd64.tar.gz
cp haproxy_exporter-0.8.0.linux-amd64/haproxy_exporter /usr/local/bin/
chown haproxy_exporter:haproxy_exporter /usr/local/bin/haproxy_exporter
adduser haproxy_exporter haproxy
cat <<EOF > /etc/default/haproxy_exporter
OPTIONS="--haproxy.scrape-uri=unix:/run/haproxy/admin.sock"
EOF
cp haproxy_exporter_init  /etc/init.d/haproxy_exporter
update-rc.d haproxy_exporter defaults

