#!/bin/bash

## Author  : Aditya Shakya
## Mail    : adi1090x@gmail.com
## Github  : @adi1090x
## Twitter : @adi1090x

uptime=$(uptime -p | sed -e 's/up //g')

rofi_command="rofi -theme powermenu.rasi"

# Options
icons="     "
shutdowncmd="Shutdown"
rebootcmd="Reboot"
lockcmd="Lock"
suspendcmd="Sleep"
logoutcmd="Logout"

shutdown="$shutdowncmd\0icon\x1fsystem-shutdown"
reboot="$rebootcmd\0icon\x1fsystem-reboot"
lock="$lockcmd\0icon\x1fsystem-lock-screen"
suspend="$suspendcmd\0icon\x1fsystem-suspend"
logout="$logoutcmd\0icon\x1fsystem-log-out"

# Variable passed to rofi
options="$shutdown\n$lock\n$suspend\n$logout\n$reboot"

chosen="$(echo -e "$options" | $rofi_command -p -dmenu -selected-row 0)"
case $chosen in
    $shutdowncmd) systemctl poweroff ;;
    $rebootcmd) systemctl reboot ;;
    $lockcmd)
		if [[ -f /usr/bin/i3lock ]]; then
			i3lock
		elif [[ -f /usr/bin/betterlockscreen ]]; then
			betterlockscreen -l
		elif [[ -f /usr/bin/slock ]]; then
			slock
		fi
        ;;
    $suspendcmd)
		mpc -q pause
		systemctl suspend-then-hibernate
        ;;
    $logoutcmd)
		if [[ "$DESKTOP_SESSION" == "Openbox" ]]; then
			openbox --exit
		elif [[ "$DESKTOP_SESSION" == "bspwm" ]]; then
			bspc quit
		elif [[ "$DESKTOP_SESSION" == "i3" ]]; then
			i3-msg exit
		elif [[ "$DESKTOP_SESSION" == "qtile" ]]; then
			killall qtile
		fi
        ;;
esac
