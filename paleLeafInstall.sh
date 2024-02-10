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
    echo "Continuing with the installation..."

    echo "Formatting /dev/sda to GPT..."
    echo -e "g\nw" | fdisk /dev/sda
    echo "Adding partitions..."
    echo -e "n\n\n\n+551M\nn\n\n\n+4G\nn\n\n\n\nw" | fdisk /dev/sda
    clear
    echo "Changing partition types..."
    echo -e "t\n1\n1\nt\n2\n19\nw" | fdisk /dev/sda
    clear
    echo "Formatting partitions..."
    mkfs.fat -F32 /dev/sda1
    mkswap /dev/sda2
    swapon /dev/sda2
    clear
    echo "Writing changes to disk..."
    partprobe /dev/sda

    #Partioning Segment End
   
    #Begin Arch Install
    clear
    echo "Setting ntp"
    timedatectl set-ntp true
    clear
    echo "pacstraping packages"
    mount /dev/sda3 /mnt
    mount --mkdir /dev/sda1 /mnt/boot
    pacstrap -K /mnt base linux linux-firmware
    clear
    echo "Generating File System"
    genfstab -U /mnt >> /mnt/etc/fstab
    clear
    echo "Setting TimeZone"
    ln -sf /usr/share/zoneinfo/America/Chicago /etc/localtime
    clear
    echo "Mounting System"
    arch-chroot /mnt
    clear
    echo "Generating Locales"
    hwclock --systohc
    sed -i '/^# *en_US.UTF-8/s/^# *//' /etc/locale.gen
    locale-gen
    clear
    echo "Setting Up Hostname"
    echo "$hostname" | sudo tee /etc/hostname >/dev/null
    clear
    echo "Setting Passwords"
    echo -e "$root_password\n$root_password" | passwd
    
    
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
