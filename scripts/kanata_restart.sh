#!/bin/bash
set -euo pipefail

sudo systemctl restart kanata
sleep 3
setxkbmap us -variant intl
