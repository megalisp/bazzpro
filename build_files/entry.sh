#!/bin/bash

# Dispatcher inside container: choose desk or deck build script
set -euo pipefail

VARIANT=${VARIANT:-desk}
DX=${DX:-false}

case "$VARIANT" in
  desk* ) /ctx/desk/build.sh ;;
  deck* ) /ctx/deck/build.sh ;;
  * ) /ctx/desk/build.sh ;;
esac
