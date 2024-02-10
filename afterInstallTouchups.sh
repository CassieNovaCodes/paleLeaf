sudo pacman -S xorg xorg-xinit xf86-video-fbdev picom nitrogen lxqt firefox --noconfirm
echo "\n" | pacman -S base-devel --noconfirm
cd ~/
cp /etc/X11/xinit/xinitrc ~/.xinitrc
head -n -5 ~/.xinitrc > ~/.xinitrc.tmp && mv ~/.xinitrc.tmp ~/.xinitrc
echo "$lines_to_add" >> ~/.xinitrc
lines_to_add="picom&\n
nitrogen&\n
exec startlxqt"
