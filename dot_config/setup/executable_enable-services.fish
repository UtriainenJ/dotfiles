#!/usr/bin/env fish
# enable-services.fish

# Paths to your service lists
set USER_SERVICES "$HOME/.config/setup/user-services.txt"
set SYSTEM_SERVICES "$HOME/.config/setup/system-services.txt"

# Enable user-level services
if test -f $USER_SERVICES
    for svc in (cat $USER_SERVICES)
        echo "Enabling user service: $svc"
        systemctl --user enable $svc --now
    end
else
    echo "user-services.txt not found"
end

# Enable system-level services
if test -f $SYSTEM_SERVICES
    for svc in (cat $SYSTEM_SERVICES)
        echo "Enabling system unit: $svc"
        sudo systemctl enable $svc --now
    end
else
    echo "system-services.txt not found"
end

echo "All listed services and timers have been enabled."
