    read -p "What Will The Root Password Be? " root_password
    read -p "What Will The Primary Username Be? " username
    read -p "What Will The Password For $username Be? " user_password
    read -p "What Will The Host Name Be? (Name of The Computer) " hostname
    clear
    echo "Setting TimeZone"
    ln -sf /usr/share/zoneinfo/America/Chicago /etc/localtime
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
    sudo useradd -m -G wheel,audio,video,optical,storage "$username"
    echo -e "$user_password\n$user_password" | sudo passwd "$username"
    clear
    echo "Adding Hosts"
    echo "127.0.0.1    localhost" | sudo tee -a /etc/hosts >/dev/null
    echo "::1          localhost" | sudo tee -a /etc/hosts >/dev/null
    echo "127.0.1.1    ${hostname}.localdomain ${hostname}" | sudo tee -a /etc/hosts >/dev/null
    clear
    echo "Adding Privlages"
    pacman -S sudo --noconfirm
    #ADDD PRIVLAGES TO USER!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    clear
    echo "Installing Grub"
    pacman -S grub efibootmgr dosfstools os-prober mtools --noconfirm
    mkdir /boot/EFI
    mount /dev/sda1 /boot/EFI
    grub-install --target=x86_64-efi --bootloader-id=grub_uefi --recheck
