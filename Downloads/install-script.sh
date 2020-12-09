#! /bin/sh

set -e

if [ $USER == "root" ]; then
    echo "Do not sudo this script."
    echo "This script must be executed by the end user of this machine."
    exit
fi

# installing basic packages
sudo pacman -Syu
sudo pacman -S base-devel git

git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ..
rm -rf yay/

sudo yay -S --needed - < base-packages.txt

# neovim Plug
curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# importing configs
git init --bare $HOME/.dotrepo
alias gitdot='/usr/bin/git --git-dir=$HOME/.dotrepo/ --work-tree=$HOME'
gitdot config --local status.showUntrackedFiles no

gitdot remote add origin https://github.com/marcogenualdo/dotfiles.git
gitdot pull origin dev

# ranger: move to trash bind
echo "
map DD shell mv %s /home/\${USER}/.local/share/Trash/files/" >> ~/.config/ranger/rc.conf

# gnome settings
gsettings set org.gnome.shell.app-switcher current-workspace-only true

# wrapping up
chsh -s `which fish`

printf "\nAll done!\n\nYou can disable sudo password by executing\n"
echo "  sudo visudo"
printf "and appending the line\n"
echo "  <your-username> ALL=(ALL) NOPASSWD: ALL"
printf "to the opened vi buffer."
