#!/bin/bash

# Function to gather user information
gather_user_info() {
    read -p "What Will The Root Password Be? " root_password
    read -p "What Will The Primary Username Be? " username
    read -p "What Will The Password For $username Be? " user_password
    read -p "What Will The Host Name Be? (Name of The Computer) " hostname
}

# Function to continue with the installation
continue_with_installation() {
    echo "Continue with the installation..."
    # Place your installation script here
}

clear
echo "Welcome to Pale Leaf OS"
echo "Before installing, you should format your drive"
echo "If you have already done so, enter 1"
echo "If you would like to exit the script, enter 2"
echo "If you would like to have your drive WIPED and all DATA DESTROYED, enter 3:"

read -p "Enter your choice: " choice

if [ "$choice" = "1" ]; then
    gather_user_info
    continue_with_installation
elif [ "$choice" = "2" ]; then
    echo "Exiting the script..."
    exit 0

elif [ "$choice" = "3" ]; then
    echo "WARNING: Choosing option 3 will WIPE your drive and DESTROY all data."
    read -p "Are you sure you want to proceed? (yes/no): " confirm
    if [ "$confirm" = "yes" ]; then
        gather_user_info
        read -p "How Much Swap Space Would You Like? " swap_space
        continue_with_installation
    else
        echo "Exiting the script..."
        exit 0
    fi
else
    echo "Invalid choice. Please enter 1 or 3."
fi
