#!/bin/sh

if command -v pacman 2>&1 >/dev/null; then
    pacman -Sy ansible
elif command -v dnf 2>&1 >/dev/null; then
    dnf install -y ansible
elif command -v apt 2>&1 >/dev/null; then
    apt install -y ansible
else
    echo "Failed: No pacman, dnf or apt on this system"
    exit 1
fi
