#!/bin/bash
set -euo pipefail

sudo systemctl enable bluetooth.service
sudo systemctl start bluetooth.service
