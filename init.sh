#!/usr/bin/env bash
# First-time setup after clone: Prism only sees folders with instance.cfg as instances.
set -e
cd "$(dirname "$0")"
if [ -f instance.cfg ]; then
  echo "instance.cfg already exists, nothing to do."
  exit 0
fi
printf '[General]\nInstanceType=OneSix\nname=%s\n' "$(basename "$PWD")" > instance.cfg
echo "Created instance.cfg. Restart Prism Launcher to see the instance."
