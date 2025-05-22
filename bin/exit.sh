#!/bin/sh

#choice=$(echo "Shutdown\nReboot\nExit" | dmenu -i )

#[ $choice = "Shutdown" ] && doas   poweroff
#[ $choice = "Reboot" ] && doas  reboot
#[ $choice = "Exit" ] &&  pkill dwm


choice=$(echo  "Shutdown\nReboot\nExit" | dmenu -i)

case "$choice" in
    "Shutdown")
        confirm=$(echo  "No\nYes" | dmenu -i -p "Are you sure?")
        [ "$confirm" = "Yes" ] && doas poweroff
        ;;
    "Reboot")
        confirm=$(echo  "No\nYes" | dmenu -i -p "Are you sure?")
        [ "$confirm" = "Yes" ] && doas reboot
        ;;
    "Exit")
        confirm=$(echo  "No\nYes" | dmenu -i -p "Are you sure?")
        [ "$confirm" = "Yes" ] && pkill dwm
        ;;
esac

