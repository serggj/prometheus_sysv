#!/bin/bash
wget https://github.com/dcu/mongodb_exporter/releases/download/v1.0.0/mongodb_exporter-linux-amd64
useradd --no-create-home --system --shell /bin/false mongodb_exporter
cp mongodb_exporter-linux-amd64 /usr/local/bin/mongodb_exporter
chmod +x /usr/local/bin/mongodb_exporter
mkdir /etc/mongodb_exporter
chown mongodb_exporter:mongodb_exporter /usr/local/bin/mongodb_exporter
chown mongodb_exporter:mongodb_exporter /etc/mongodb_exporter

cat <<EOF > /etc/mongodb_exporter/mongodb_exporter.conf
OPTIONS=""
EOF
cp mongodb_exporter_init  /etc/init.d/mongodb_exporter
chmod +x /etc/init.d/mongodb_exporter
update-rc.d mongodb_exporter defaults
