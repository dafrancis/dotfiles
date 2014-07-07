# Setup zsh as default shell
chsh -s /bin/zsh

# Install Oh My Zsh
curl -L http://install.ohmyz.sh | sh

# Link zshrc
ln -fs ~/.dotfiles/zshrc ~/.zshrc

# Link vim
ln -fs ~/.dotfiles/vimrc ~/.vimrc
ln -fs ~/.dotfiles/vim ~/.vim

# Would you believe that neovim is literally the same as vim?
# yes. yes you would.
ln -fs ~/.dotfiles/vimrc ~/.nvimrc
ln -fs ~/.dotfiles/vim ~/.nvim

# So how about them window managers
ln -fs ~/.dotfiles/hydra ~/.hydra
