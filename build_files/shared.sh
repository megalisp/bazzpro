#!/bin/bash

# Shared package installation for bazzpro builds

dnf5 install -y racket rclone restic syncthing git git-lfs git dnf5-plugins --skip-unavailable

systemctl enable podman.socket
