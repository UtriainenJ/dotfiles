# Simple setup for Arch-based Linux distros.
Dotfiles managed with chezmoi.

Includes configs and setup for a Hyprland experience.
## Features

- **Automatic theming** for:
  - Yazi
  - Ghostty
  - Hyprland
  - Waybar
  - VSCode (requires Wal theme extension from vscode extensions marketplace)
  - Dunst
  - Fuzzel  
  Colors are automatically generated using **Wallust** from a wallpaper image.

- **`ycd` Fish function** for interactively changing folders with Yazi.
- **`change-theme path/to/img` function** to change a wallpaper and generate a new system theme color palette 

- **Fixes and improvements**:
  - Wayland hints to resolve compatibility issues.
  - Fcitx5 systemd service to fix dead keys and input issues in apps without full input method frameworks (e.g., [Ghostty](https://github.com/ghostty-org/ghostty/discussions/8899)).

- **Utilities**:
  - **Fuzzel** for running apps and clipboard management with images.
  - **Dunst** for notifications.

## Installation

To install packages listed in `.config/setup/pkglist.txt` (includes requirements for the setup):
1. Install an AUR helper (paru/yay/etc.)
2. run: `paru -S --needed $(cat ~/.config/setup/pkglist.txt)`
3. run `enable_services` script located in `.config/setup/`
  both .fish and .sh are included
4. run `fisher update` to install fisher plugins
  you can then configure your prompt with `tide configure`

To apply dots:
1. Install chezmoi with the method of your choosing (https://www.chezmoi.io/)
2. Use:
  `chezmoi init https://github.com/UtriainenJ/dotfiles.git`
* Optionally to view the changes:
  `chezmoi diff`
3. To apply the dots
  `chezmoi apply`

**Disclaimer** These dots are mainly meant for my personal setups and learning. Your mileage may vary, use at your own risk.
These dotfiles have been created, tested, and used using Arch linux and CachyOs (also arch based). I do not guarantee other distros will work.
