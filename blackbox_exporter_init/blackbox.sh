#!/bin/bash
wget https://github.com/prometheus/blackbox_exporter/releases/download/v0.11.0/blackbox_exporter-0.11.0.linux-amd64.tar.gz
useradd --no-create-home --system --shell /bin/false blackbox_exporter
tar xvf blackbox_exporter-0.11.0.linux-amd64.tar.gz
cp blackbox_exporter-0.11.0.linux-amd64/blackbox_exporter /usr/local/bin/
mkdir /etc/blackbox_exporter
cp blackbox_exporter-0.11.0.linux-amd64/blackbox.yml  /etc/blackbox_exporter/blackbox_exporter.yml

chown blackbox_exporter:blackbox_exporter  /etc/blackbox_exporter
chown blackbox_exporter:blackbox_exporter  /usr/local/bin/blackbox_exporter

cat <<EOF > /etc/blackbox_exporter/blackbox_exporter.conf
OPTIONS"--config.file='/etc/blackbox_exporter/blackbox_exporter.yml'"
EOF

cp blackbox_exporter_init  /etc/init.d/blackbox_exporter
chmod +x /etc/init.d/blackbox_exporter
update-rc.d blackbox_exporter defaults
setcap cap_net_raw+ep /usr/local/bin/blackbox_exporter
