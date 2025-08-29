#!/bin/bash

# Shared package installation for bazzpro builds

dnf5 install -y racket rclone restic syncthing git git-lfs git dnf5-plugins --skip-unavailable

# Kando dependencies
dnf5 install -y nodejs cmake libX11-devel libXtst-devel wayland-devel libxkbcommon-devel --skip-unavailable

systemctl enable podman.socket

# Install kando
if ! command -v kando &> /dev/null; then
	if [ ! -d "/opt/kando" ]; then
		git clone https://github.com/kando-menu/kando.git /opt/kando
		cd /opt/kando
		npm install
		npm run package
		# Optionally, link the executable to /usr/local/bin
		if [ -f out/kando/kando ]; then
			ln -sf /opt/kando/out/kando/kando /usr/local/bin/kando
		fi
	fi
fi
