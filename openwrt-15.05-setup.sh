#!/bin/sh

# set timezone
uci set system.@system[0].zonename='Asia/Shanghai'
uci set system.@system[0].timezone='CST-8'
uci commit

mkdir ~/download

echo "src/gz openwrt_dist http://openwrt-dist.sourceforge.net/releases/ar71xx/packages" >> /etc/opkg.conf
echo "src/gz openwrt_dist_luci http://openwrt-dist.sourceforge.net/releases/luci/packages" >> /etc/opkg.conf

opkg update
opkg install luci luci-ssl luci-app-ddns \
             luci-app-upnp luci-app-wol luci-app-qos \
             #luci-app-redsocks2 \
             #luci-app-privoxy \
             luci-app-transmission transmission-web \
             screen vim-full git-http patch wget curl msmtp rsync \
             diffutils \
             openssh-client \
             openssh-sftp-server \
             kmod-usb-core kmod-usb2 kmod-usb3 kmod-usb-storage kmod-usb-storage-extras \
             block-mount kmod-fs-ext4 kmod-fs-exfat kmod-fs-vfat luci-app-samba \
             hd-idle \
             luci-app-hd-idle \
             kmod-nf-nathelper-extra \
             shadowsocks-libev-polarssl \
             luci-app-shadowsocks \
             luci-app-chinadns

opkg install luci-app-vnstat && mkdir -p /data/logs/vnstat

# apply patches
patch -p1 -d /usr/lib/lua/luci/view/admin_status/ < ../target/openwrt/patches/add_hostname_to_associated_station.patch
