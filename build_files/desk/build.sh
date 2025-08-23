#!/bin/bash

set -ouex pipefail

# Desk-specific build steps can go here

# Source shared steps
source "$(dirname "$0")/../shared.sh"

# If DX build requested, source DX additions from top-level build_files/dx.sh
if [[ "${DX:-false}" == "true" ]]; then
	source "$(dirname "$0")/../dx.sh"
fi
