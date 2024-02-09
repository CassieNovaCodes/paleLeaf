#!/bin/bash

echo "Welcome to Pale Leaf OS"
echo "Before installing, you should format your drive"
echo "If you have already done so, enter 1"
echo "If you have not yet and wish to, enter 2"
echo "If you would like to have your drive WIPED and all DATA DESTROYED, enter 3:"

read -p "Enter your choice: " choice

if [ "$choice" = "1" ]; then
    echo "1"
elif [ "$choice" = "2" ]; then
    echo "Exiting the script..."
    exit 0
elif [ "$choice" = "3" ]; then
    echo "3"
fi
