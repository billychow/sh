#!/bin/sh

opkg update
opkg install luci luci-ssl ddns-scripts luci-app-ddns luci-app-vnstat luci-app-upnp luci-app-wol msmtp screen
opkg install shadowsocks-libev-spec-polarssl