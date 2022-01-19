# dotfiles

To install these dotfiles you shall execute the following steps:

```bash
git clone --bare git@gitlab.com:alk-alyss/dotfiles $HOME/.files

alias dots='/usr/bin/git --git-dir=$HOME/.files/ --work-tree=$HOME'

dots checkout

dots config --local status.showUntrackedFiles no
```

If any errors occur, that means that you have conflicting dotfiles. Back them up and do dots checkout again.

## Dependencies

| Program                  | Description                              |
| ------------------------ | ---------------------------------------- |
| `alacritty`              | Terminal emulator                        |
| `bluez-utils`            | Bluetooth utilities                      |
| `dmenu`                  | Needed for network menu                  |
| `feh`                    | Image viewer / Background manager        |
| `flameshot`              | Screenshot tool                          |
| `icomoon-feather`        | Icon font                                |
| `nerd-fonts-dejavu`      | Font                                     |
| `nerd-fonts-inconsolata` | Font                                     |
| `nerd-fonts-mononoki`    | Font                                     |
| `networkmanager-dmenu`   | Network menu based on dmenu              |
| `picom-ibhagwan`         | Compositor                               |
| `polybar`                | Status bar                               |
| `qtile`                  | Window manager written in Python         |
| `rofi`                   | Application launcher / dmenu replacement |
| `rofi-bluetooth`         | Bluetooth menu based on rofi             |
| `touchegg`               | Touchpad / Touchscreen gestures          |
| `xcape`                  | Tool to map CapsLock to Super and Escape |
| `zsh`                    | Better shell                             |
