#!/usr/bin/env bash
# enable-services.sh

USER_SERVICES="$HOME/.config/setup/user-services.txt"
SYSTEM_SERVICES="$HOME/.config/setup/system-services.txt"

# Enable user-level services
if [[ -f "$USER_SERVICES" ]]; then
    while IFS= read -r svc; do
        [[ -n "$svc" ]] || continue
        echo "Enabling user service: $svc"
        systemctl --user enable "$svc" --now
    done < "$USER_SERVICES"
else
    echo "user-services.txt not found"
fi

# Enable system-level services
if [[ -f "$SYSTEM_SERVICES" ]]; then
    while IFS= read -r svc; do
        [[ -n "$svc" ]] || continue
        echo "Enabling system unit: $svc"
        sudo systemctl enable "$svc" --now
    done < "$SYSTEM_SERVICES"
else
    echo "system-services.txt not found"
fi

echo "All listed services and timers have been enabled."

