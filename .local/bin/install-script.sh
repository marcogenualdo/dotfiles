#! /bin/sh

set -e

if [ $USER == "root" ]; then
    echo "Do not sudo this script."
    echo "This script must be executed by the end user of this machine."
    exit
fi

# installing needed packages
su -c "pacman -Syu && pacman -S base-devel git"

git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ..
rm -rf yay/

# importing configs
git init --bare $HOME/.dotrepo
alias gitdot='/usr/bin/git --git-dir=$HOME/.dotrepo/ --work-tree=$HOME'
gitdot config --local status.showUntrackedFiles no

gitdot remote add origin https://github.com/marcogenualdo/dotfiles.git
gitdot pull origin dev

# base packages
yay -S --needed - < $HOME/.config/packages/base.txt

# shell plugins
fish -c "cat $HOME/.config/fish/fish_plugins | tr '\n' ' ' | fisher install"

# neovim Plug
curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# wrapping up
chsh -s `which fish`

printf "
All done!\n
You can disable sudo password by executing\n
      sudo visudo
\nand appending the line\n
      <your-username> ALL=(ALL) NOPASSWD: ALL
\nto the opened vi buffer.
"
