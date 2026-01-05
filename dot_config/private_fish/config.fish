if status is-interactive
    # Commands to run in interactive sessions can go here

    #found in .bash_profile, adjusted for fish
    dbus-update-activation-environment --systemd --all
    # Aliases
    alias ls='ls -v --color=auto'
    alias grep='grep --color=auto'
    alias less='less -RSmi'
    alias bye='systemctl poweroff'
    alias shut='systemctl poweroff'
    alias yeet='sudo pacman -Rns'

    # fuzzy search file to ctrl+f and variables to alt+ctrl+v
    fzf_configure_bindings --directory=\cf --variables=\e\cv

end

#############################
# PATH additions (prepend -p)
#############################
fish_add_path -p $HOME/.local/bin $HOME/.cargo/bin

# ASDF configuration code
if test -z $ASDF_DATA_DIR
    set _asdf_shims "$HOME/.asdf/shims"
else
    set _asdf_shims "$ASDF_DATA_DIR/shims"
end

# Do not use fish_add_path (added in Fish 3.2) because it
# potentially changes the order of items in PATH
if not contains $_asdf_shims $PATH
    set -gx --prepend PATH $_asdf_shims
end
set --erase _asdf_shims
##########################

