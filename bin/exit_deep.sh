#!/bin/sh

# Check if dmenu is installed
if ! command -v dmenu > /dev/null 2>&1; then
    echo "dmenu is not installed. Please install dmenu to use this script."
    exit 1
fi

Choices="Shutdown\nReboot\nExit"
# Display options and get user choice
chosen=$(echo -e "$Choices" | dmenu -i -p  "Power Menu:")

# Handle the user's choice
case "$chosen" in
    "Shutdown")
        if sudo -n poweroff 2>/dev/null; then
            echo "Shutting down..."
        else
            echo "Error: You do not have permission to shut down the system."
        fi
        ;;
    "Reboot")
        if sudo -n reboot 2>/dev/null; then
            echo "Rebooting..."
        else
            echo "Error: You do not have permission to reboot the system."
        fi
        ;;
    "Exit")
        pkill dwm || echo "Error: Failed to exit dwm."
        ;;
    *)
        echo "No valid option selected or operation canceled."
        ;;
esac
