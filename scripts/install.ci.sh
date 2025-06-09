#!/bin/bash
# Script to install and configure the project CI environment setup

set -e
chmode +x scripts/utils/basic-install.sh
./scripts/utils/basic-install.sh
