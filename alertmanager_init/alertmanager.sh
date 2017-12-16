#!/bin/bash
apt-get install wget
wget https://github.com/prometheus/alertmanager/releases/download/v0.11.0/alertmanager-0.11.0.linux-amd64.tar.gz
tar xvf alertmanager-0.11.0.linux-amd64.tar.gz
useradd --no-create-home --system --shell /bin/false alertmanager
cp alertmanager-0.11.0.linux-amd64/alertmanager /usr/local/bin/
cp alertmanager-0.11.0.linux-amd64/amtool /usr/local/bin/
mkdir /etc/alertmanager
mkdir  /var/lib/alertmanager
chown alertmanager:alertmanager /etc/alertmanager  /var/lib/alertmanager

cat <<EOF > /etc/alertmanager/alertmanager.conf
OPTIONS="-config.file /etc/alertmanager/alertmanager.yml \
        -storage.path /var/lib/alertmanager/"
EOF

cp alertmanager_init  /etc/init.d/alertmanager
chmod +x /etc/init.d/alertmanager
update-rc.d alertmanager defaults
