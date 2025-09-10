#!/bin/bash

# DX-specific packages for bazzpro (desktop experience)

dnf5 install -y xorg-x11-server-Xwayland xdg-desktop-portal-wlr wlroots sway waybar grim slurp mako clipman --skip-unavailable || true

# Any DX-specific services to enable can be added here
export DNF5_ASSUME_ALWAYS_YES=true
export DNF5_DISABLE_REPO_EXCLUDES=all

dnf5 config-manager addrepo --from-repofile=https://cli.github.com/packages/rpm/gh-cli.repo
dnf5 install -y gh --repo gh-cli

rpm --import https://packages.microsoft.com/keys/microsoft.asc
tee /etc/yum.repos.d/vscode.repo > /dev/null <<EOF
[code]
name=Visual Studio Code
baseurl=https://packages.microsoft.com/yumrepos/vscode
enabled=1
autorefresh=1
type=rpm-md
gpgcheck=1
gpgkey=https://packages.microsoft.com/keys/microsoft.asc
EOF

dnf5 install -y code --repo code
