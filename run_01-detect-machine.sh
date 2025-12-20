#!/usr/bin/env bash
set -euo pipefail

hasBattery=false

# Battery-based detection (simple and pragmatic)
if compgen -G "/sys/class/power_supply/BAT*" > /dev/null; then
  hasBattery=true
fi

cat <<EOF
{
  "hasBattery": $hasBattery
}
EOF

