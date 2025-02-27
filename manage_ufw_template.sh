#!/bin/bash

# Function to display usage
usage() {
    echo "Usage: $0 {open|block|status|enable|disable|show} [port]"
    echo "Commands:"
    echo "  open   - Open a port"
    echo "  block  - Block a port"
    echo "  status  - Show UFW status"
    echo "  enable  - Enable UFW"
    echo "  disable - Disable UFW"
    echo "  show    - Show current rules"
    exit 1
}

# Check if the script is run as root
if [ "$EUID" -ne 0 ]; then
    echo "Please run as root"
    exit 1
fi

# Check for at least one argument
if [ $# -lt 1 ]; then
    usage
fi

# Parse the command
COMMAND=$1
PORT=$2

case $COMMAND in
    open)
        if [ -z "$PORT" ]; then
            echo "Please specify a port to open."
            exit 1
        fi
        ufw allow "$PORT"
        echo "Port $PORT opened."
        ;;
    block)
        if [ -z "$PORT" ]; then
            echo "Please specify a port to block."
            exit 1
        fi
        ufw deny "$PORT"
        echo "Port $PORT blocked."
        ;;
    status)
        ufw status
        ;;
    enable)
        ufw enable
        echo "UFW enabled."
        ;;
    disable)
        ufw disable
        echo "UFW disabled."
        ;;
    show)
        ufw status numbered
        ;;
    *)
        usage
        ;;
esac