#!/bin/bash

# Rofi Power Menu Script

options="Shutdown\nReboot\nLock\nLog Out\nSuspend\nHibernate"

chosen=$(echo -e "$options" | rofi -dmenu -p "Power Menu")

case $chosen in
    "Shutdown")
        # Shutdown command
        hyprctl -j clients | jq -r '.[] | "dispatch closewindow address:\(.address)"' | xargs -I {} hyprctl {} & systemctl poweroff
        ;;
    "Reboot")
        # Reboot command
        hyprctl -j clients | jq -r '.[] | "dispatch closewindow address:\(.address)"' | xargs -I {} hyprctl {} & systemctl reboot
        ;;
    "Log Out")
        # Log out command
        loginctl terminate-user ""
        ;;
    "Lock")
        # Lock screen command (adjust for your lock screen tool)
        loginctl lock-user ""
        ;;
    "Suspend")
        # Suspend command
        systemctl suspend
        ;;
    "Hibernate")
        # Hibernate command
        systemctl hibernate
        ;;
    *)
        exit 1
        ;;
esac
