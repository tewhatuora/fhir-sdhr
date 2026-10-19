#!/bin/bash
set -euo pipefail
node "$(dirname "$0")/postprocess-artifacts.mjs" "${1:-output/artifacts.html}"
