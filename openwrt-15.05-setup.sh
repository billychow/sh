#!/bin/sh

# set timezone
uci set system.@system[0].zonename='Asia/Shanghai'
uci set system.@system[0].timezone='CST-8'
uci commit

opkg update
opkg install luci luci-ssl luci-app-ddns \
             luci-app-vnstat luci-app-upnp luci-app-wol luci-app-qos \
             luci-app-hd-idle luci-app-privoxy luci-app-transmission \
             screen vim-full git patch wget curl hd-idle msmtp rsync \
             diffutils
opkg install shadowsocks-libev-polarssl

mkdir ~/download
mkdir -p /data/logs/vnstat

# apply patches
patch -p1 -d /usr/lib/lua/luci/view/admin_status/ < ~/target/openwrt/patches/add_hostname_to_associated_station.patch
