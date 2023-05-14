#!/usr/bin/env sh

# use these settings to make
# macos a router.
mk_router() {
	sysctl -w net.ipv4.ip_forward=1
	pfctl -f /etc/pf.conf
	pfctl -e
}

mk_router
