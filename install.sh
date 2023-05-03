# Actualizando el sistema

sudo apt update

# Instalando dependencias de Entorno

sudo apt install -y build-essential git vim xcb libxcb-util0-dev libxcb-ewmh-dev libxcb-randr0-dev libxcb-icccm4-dev libxcb-keysyms1-dev libxcb-xinerama0-dev libasound2-dev libxcb-xtest0-dev libxcb-shape0-dev

# Instalando Requerimientos para la polybar
sudo apt-get install libcurl4=7.74.0-1.3+deb11u7

sudo apt install -y cmake cmake-data pkg-config python3-sphinx libcairo2-dev libxcb1-dev libxcb-util0-dev libxcb-randr0-dev libxcb-composite0-dev python3-xcbgen xcb-proto libxcb-image0-dev libxcb-ewmh-dev libxcb-icccm4-dev libxcb-xkb-dev libxcb-xrm-dev libxcb-cursor-dev libasound2-dev libpulse-dev libjsoncpp-dev libmpdclient-dev libuv1-dev libnl-genl-3-dev

# Dependencias de Picom

sudo apt install -y meson libxext-dev libxcb1-dev libxcb-damage0-dev libxcb-xfixes0-dev libxcb-shape0-dev libxcb-render-util0-dev libxcb-render0-dev libxcb-composite0-dev libxcb-image0-dev libxcb-present-dev libxcb-xinerama0-dev libpixman-1-dev libdbus-1-dev libconfig-dev libgl1-mesa-dev libpcre2-dev libevdev-dev uthash-dev libev-dev libx11-xcb-dev libxcb-glx0-dev libpcre3 libpcre3-dev

# Instalamos paquetes adionales

sudo apt install -y feh scrot scrub zsh rofi xclip bat locate neofetch wmname acpi bspwm sxhkd imagemagick ranger polybar

# Instalamos i3lock-fancy

sudo apt install -y i3lock-fancy

# Creando carpeta de Reposistorios

mkdir ~/github

# Descargar Repositorios Necesarios

cd ~/github
git clone --recursive https://github.com/polybar/polybar
git clone https://github.com/ibhagwan/picom.git

# Instalando Polybar

cd ~/github/polybar
mkdir build
cd build
cmake ..
make -j$(nproc)
sudo make install

# Instalando Picom

cd ~/github/picom
git submodule update --init --recursive
meson --buildtype=release . build
ninja -C build
sudo ninja -C build install

# Instalando p10k

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.powerlevel10k
echo 'source ~/.powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc

# Instalando p10k root

sudo git clone --depth=1 https://github.com/romkatv/powerlevel10k.git /root/.powerlevel10k

# Instalamos las HackNerdFonts

cp Hack.zip .
unzip Hack.zip
sudo mv *.ttf /usr/share/fonts
rm *.zip

# Copiando Archivos de Configuración

cp -r .config/* /home/$USER/.config/

# Asignamos Permisos a los Scritps
sudo su
sleep 2
exit
cd
sleep 1
chmod +x ~/.config/bspwm/bspwmrc
chmod +x ~/.config/bspwm/scripts/bspwm_resize
chmod +x ~/.config/bin/ethernet_status.sh
chmod +x ~/.config/bin/powermenu.sh
chmod +x ~/.config/bin/rofi-wifi-menu.sh
chmod +x ~/.config/polybar/launch.sh


# Plugins ZSH

sudo apt install -y zsh-syntax-highlighting zsh-autosuggestions zsh-autocomplete
sudo mkdir /usr/share/zsh-sudo
cd /usr/share/zsh-sudo
sudo wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/plugins/sudo/sudo.plugin.zsh

# Cambiando de SHELL a zsh

chsh -s /usr/bin/zsh
sudo usermod --shell /usr/bin/zsh root
sudo ln -s -fv ~/.zshrc /root/.zshrc

for user in /home/*; do sudo ln -s -f "$(eval echo ~$(basename $user))/".zshrc /root/.zshrc; done

for user in /home/*; do sudo usermod --shell /usr/bin/zsh "$(basename $user)"; done

for user in /home/*; do sudo chown -R "$(basename $user):$(basename $user)" /root; sudo chown -R "$(basename $user):$(basename $user)" /root/.cache; sudo chown -R "$(basename $user):$(basename $user)" /root/.local; done

# Asignamos Permisos a los Scritps

cd /
cd /home/$USER/
chmod +x ~/.config/bspwm/bspwmrc
chmod +x ~/.config/bspwm/scripts/bspwm_resize
chmod +x ~/.config/bin/ethernet_status.sh
chmod +x ~/.config/bin/powermenu.sh
chmod +x ~/.config/bin/rofi-wifi-menu.sh
chmod +x ~/.config/polybar/launch.sh

# Removiendo Repositorio

rm -rf ~/github


fi
