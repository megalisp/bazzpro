#!/bin/bash

set -ouex pipefail

# Deck-specific bundling steps can go here

# Source shared steps
source "$(dirname "$0")/../shared.sh"

# Optional: call devel helper if present
if [ -f "$(dirname "$0")/devel.sh" ]; then
  source "$(dirname "$0")/devel.sh"
fi
