#!/bin/bash
apt-get install wget
wget https://github.com/prometheus/prometheus/releases/download/v2.0.0/prometheus-2.0.0.linux-amd64.tar.gz
useradd --no-create-home --system --shell /bin/false prometheus
tar xvf  prometheus-2.0.0.linux-amd64.tar.gz
cp prometheus-2.0.0.linux-amd64/prometheus /usr/local/bin/
cp prometheus-2.0.0.linux-amd64/promtool /usr/local/bin/
mkdir /etc/prometheus /var/lib/prometheus

chown prometheus:prometheus /usr/local/bin/prometheus /usr/local/bin/promtool
chown prometheus:prometheus  /etc/prometheus /var/lib/prometheus

cat <<EOF > /etc/prometheus/prometheus.conf
OPTIONS="--config.file /etc/prometheus/prometheus.yml \
    --storage.tsdb.path /var/lib/prometheus/ \
    --web.external-url http://127.0.0.1:80"
EOF

cp prometheus_init  /etc/init.d/prometheus
update-rc.d prometheus defaults
