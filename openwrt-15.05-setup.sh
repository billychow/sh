#!/bin/sh

opkg update
opkg install luci luci-ssl ddns-scripts luci-app-ddns \
             luci-app-vnstat luci-app-upnp luci-app-wol \
             luci-app-hd-idle \
             screen vim-full git patch wget curl hd-idle msmtp rsync
opkg install shadowsocks-libev-polarssl
