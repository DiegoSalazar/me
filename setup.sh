#!/usr/bin/env bash

cd ~
sudo apt upgrade
sudo apt-get install gcc make ruby
sudo apt-get install -y libssl-dev libreadline-dev zlib1g-dev

echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile
echo 'eval "$(rbenv init -)"' >> ~/.bash_profile 
source ~/.bash_profile

git clone https://github.com/rbenv/rbenv.git ~/.rbenv
git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
cd ~/.rbenv && src/configure && make -C src
cd -

rbenv install 2.5.5
rbenv global 2.5.5

git config --global user.email 'me@diegosalazar,co'
git config --global user.name 'Diego Salazar'
