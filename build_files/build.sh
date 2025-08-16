#!/bin/bash

set -ouex pipefail

dnf5 install -y racket-minimal rclone restic syncthing git git-lfs git dnf5-plugins --skip-unavailable

systemctl enable podman.socket
