#!/bin/sh

# set timezone
uci set system.@system[0].zonename='Asia/Shanghai'
uci set system.@system[0].timezone='CST-8'

opkg update
opkg install luci luci-ssl ddns-scripts luci-app-ddns \
             luci-app-vnstat luci-app-upnp luci-app-wol \
             luci-app-hd-idle \
             screen vim-full git patch wget curl hd-idle msmtp rsync
opkg install shadowsocks-libev-polarssl

mkdir ~/download
mkdir -p /data/logs/vnstat
