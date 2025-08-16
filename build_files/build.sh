#!/bin/bash

set -ouex pipefail

dnf5 install -y rclone restic syncthing 

systemctl enable podman.socket
