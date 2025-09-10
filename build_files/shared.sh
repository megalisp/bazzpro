#!/bin/bash

# Shared package installation for bazzpro builds

dnf5 install -y racket chez-scheme chezmoi rclone restic syncthing vorta git git-lfs git dnf5-plugins --skip-unavailable

systemctl enable podman.socket

# Install kando from RPM
if ! command -v kando &> /dev/null; then
	curl -L -o /tmp/kando.rpm "https://github.com/kando-menu/kando/releases/download/v2.0.0/kando-2.0.0-1.x86_64.rpm"
	dnf5 install -y /tmp/kando.rpm || dnf install -y /tmp/kando.rpm
fi

# Disable for now; Fails because needs catt which is unmet.
# dnf copr enable -y agundur/KCast
# dnf5 install -y kcast
