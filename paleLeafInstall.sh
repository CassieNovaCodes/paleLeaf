#!/bin/bash

echo "Welcome to Pale Leaf OS"
echo "Before installing, you should format your drive"

while true; do
    echo "If you have already done so, enter 1"
    echo "If you have not yet and wish to, enter 2"
    echo "If you would like to have your drive WIPED and all DATA DESTROYED, enter 3:"
    
    read -p "Enter your choice: " choice
    
    case $choice in
        1)
            echo "1"
            break
            ;;
        2)
            echo "Exiting the script..."
            exit 0
            ;;
        3)
            echo "3"
            break
            ;;
        *)
            echo "Invalid input. Please enter 1, 2, or 3."
            ;;
    esac
done
