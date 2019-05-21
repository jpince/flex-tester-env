#!/bin/bash
echo -e "\e[1;31mmap keys\e[0m"
# gsettings set org.gnome.desktop.input-sources xkb-options "['ctrl:swapcaps']"
sudo xdg-open /usr/share/X11/xkb/symbols/pc
-rf /var/lib/xkb/*
echo -e "\e[1;32mapt update\e[0m"
apt update
apt upgrade
echo -e "\e[1;33mdocker\e[0m"
apt install \
    apt-transport-https \
#    ca-certificates \
    curl \
#    software-properties-common -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
apt install docker-ce -y
echo -e "\e[1;34mchrome\e[0m"
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
dpkg -i google-chrome-stable_current_amd64.deb
rm google-chrome-stable_current_amd64.deb
echo -e "\e[1;35mother programs\e[0m"
snap install skype --classic
snap install slack --classic
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | apt-key add -
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
apt install sublime-text -y
echo -e "\e[1;36mjava\e[0m"
apt install default-jre -y
echo -e "\e[1;31mimages\e[0m"
wget https://cdn.dribbble.com/users/109322/screenshots/2114299/attachments/383208/Liferay_wall_1920_1200.jpg
cp Liferay_wall_1920_1200.jpg /usr/share/backgrounds/
rm Liferay_wall_1920_1200.jpg
gsettings set org.gnome.desktop.background picture-uri file:///usr/share/backgrounds/Liferay_wall_1920_1200.jpg
wget http://alterform.com/liferay/liferay_of_life_1920x1200.jpg
cp liferay_of_life_1920x1200.jpg /usr/share/backgrounds/
rm liferay_of_life_1920x1200.jpg
env XDG_CURRENT_DESKTOP=GNOME gnome-control-center background
echo -e "\e[1;33mupgrade\e[0m"
apt update
apt upgrade
echo -e "\e[1;33mmysql\e[0m"
apt install mysql-server -y
# mysql_secure_installation
reboot