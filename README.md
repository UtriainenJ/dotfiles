# Simple setup for Arch-based Linux distros.

Dotfiles managed with chezmoi.

**Disclaimer** These dots are mainly meant for my personal setups and learning. Your mileage may vary, use at your own risk.
These dotfiles have been created, tested, and used using Arch linux. I do not guarantee other distros will work.

To install packages listed in `.config/setup/pkglist.txt` (includes requirements for the dots):
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
