# Setup zsh as default shell
chsh -s /bin/zsh

# Install Oh My Zsh
curl -L http://install.ohmyz.sh | sh

# Link zshrc
ln -fs ~/.dotfiles/zshrc ~/.zshrc

# Link vim
ln -fs ~/.dotfiles/vimrc ~/.vimrc
ln -fs ~/.dotfiles/vim ~/.vim
