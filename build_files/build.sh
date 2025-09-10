#!/bin/bash

set -ouex pipefail

dnf5 install -y racket rclone restic syncthing git git-lfs git dnf5-plugins --skip-unavailable

systemctl enable podman.socket
