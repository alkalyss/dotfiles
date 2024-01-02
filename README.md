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
| `brightnessctl`          | Brightness control                       |
| `dmenu`                  | Needed for network menu                  |
| `feh`                    | Image viewer / Background manager        |
| `flameshot`              | Screenshot tool                          |
| `icomoon-feather`        | Icon font                                |
| `nerd-fonts-dejavu`      | Font                                     |
| `nerd-fonts-inconsolata` | Font                                     |
| `nerd-fonts-mononoki`    | Font                                     |
| `networkmanager-dmenu`   | Network menu based on dmenu              |
| `picom-ibhagwan`         | Compositor                               |
| `playerctl`              | Multimedia controls                      |
| `polybar`                | Status bar                               |
| `qtile`                  | Window manager written in Python         |
| `rofi`                   | Application launcher / dmenu replacement |
| `rofi-bluetooth`         | Bluetooth menu based on rofi             |
| `thunar`                 | File Manager                             |
| `touchegg`               | Touchpad / Touchscreen gestures          |
| `xcape`                  | Tool to map CapsLock to Super and Escape |
| `zsh`                    | Better shell                             |

## Features

- CapsLock is mapped to Super key when held and Escape when pressed momentarilly

| Shortcut          | Description                        |
| ----------------- | ---------------------------------- |
| `Super+1-5`       | Go to workspace 1-5                |
| `Super+Shift+1-5` | Send window to workspace 1-5       |
| `Super+h`         | Move focus left                    |
| `Super+j`         | Move focus down                    |
| `Super+k`         | Move focus up                      |
| `Super+l`         | Move focus right                   |
| `Super+Shift+h`   | Move window left                   |
| `Super+Shift+j`   | Move window down                   |
| `Super+Shift+k`   | Move window up                     |
| `Super+Shift+l`   | Move window right                  |
| `Super+Ctrl+h`    | Grow window to the left            |
| `Super+Ctrl+j`    | Grow window to the down            |
| `Super+Ctrl+k`    | Grow window to the up              |
| `Super+Ctrl+l`    | Grow window to the right           |
| `Super+n`         | Normalize layout                   |
| `Super+Tab`       | Next layout                        |
| `Super+Shift+Tab` | Previous layout                    |
| `Super+t`         | Launch terminal                    |
| `Super+r`         | Launch rofi                        |
| `Super+b`         | Launch brownser (Firefox)          |
| `Super+f`         | Launch filemanager (thunar)        |
| `Super+c`         | Launch Codium                      |
| `Super+s`         | Launch Spotify                     |
| `Super+d`         | Launch Discord                     |
| `Super+x`         | Launch Xournal++                   |
| `PrintScreen`     | Launch screenshot tool (Flameshot) |
| `Super+Shift+f`   | Toggle floating window             |
| `Super+Mouse 1`   | Drag floating window               |
