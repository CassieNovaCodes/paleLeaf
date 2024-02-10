sudo pacman -S xorg xorg-xinit xf86-video-fbdev picom nitrogen cinnamon firefox --noconfirm
echo "\n" | pacman -S base-devel --noconfirm
cd ~/
cp /etc/X11/xinit/xinitrc ~/.xinitrc
head -n -5 ~/.xinitrc > ~/.xinitrc.tmp && mv ~/.xinitrc.tmp ~/.xinitrc
lines_to_add="picom&\n
nitrogen&\n
exec cinnamon-session"
echo "$lines_to_add" >> ~/.xinitrc
cd paleLeaf
tar -xzvf local.tar.gz
tar -xzvf config.tar.gz
mv .config ~/
mv .local ~/
echo "reboot by typing reboot"
