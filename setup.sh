#!/usr/bin/env bash

cd ~
sudo apt upgrade
sudo apt-get install gcc make ruby
sudo apt-get install -y libssl-dev libreadline-dev zlib1g-dev

git clone https://github.com/rbenv/rbenv.git ~/.rbenv
git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
cd ~/.rbenv && src/configure && make -C src && cd -
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile
echo 'eval "$(rbenv init -)"' >> ~/.bash_profile 
source ~/.bash_profile

# Setup Ruby
rbenv install 2.5.5
rbenv global 2.5.5
gem install bundler

# Setup git
git config --global user.email 'me@diegosalazar,co'
git config --global user.name 'Diego Salazar'

ssh-keygen -t rsa -b 4096 -C "mastermindxs@gmail.com"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa

# Download personal settings
wget -O ~/.inputrc https://raw.githubusercontent.com/DiegoSalazar/dotfiles/master/.inputrc
wget -O ~/.irbrc https://raw.githubusercontent.com/DiegoSalazar/dotfiles/master/.irbrc
wget -O ~/.bash_aliases https://raw.githubusercontent.com/DiegoSalazar/dotfiles/master/.aliases
