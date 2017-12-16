#!/bin/bash
wget https://github.com/prometheus/node_exporter/releases/download/v0.15.2/node_exporter-0.15.2.linux-amd64.tar.gz
useradd --no-create-home --system --shell /bin/false node_exporter
tar xvf node_exporter-0.15.2.linux-amd64.tar.gz
cp node_exporter-0.15.2.linux-amd64/node_exporter /usr/local/bin/
mkdir /etc/node_exporter
chown node_exporter:node_exporter /usr/local/bin/node_exporter
chown node_exporter:node_exporter /etc/node_exporter

cat <<EOF > /etc/node_exporter/node_exporter.conf
OPTIONS=""
EOF

cp node_exporter_init  /etc/init.d/node_exporter
chmod +x /etc/init.d/node_exporter
update-rc.d node_exporter defaults
