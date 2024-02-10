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
