#!/bin/bash
# install zsh and git to be able to clone oh-my-zsh
sudo apt-get install -y zsh git
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
# automatic updates
echo "DISABLE_UPDATE_PROMPT=true" >> ~/.zshrc
# pygments
sudo apt-get install -y python-pygments
echo 'alias dog="pygmentize -O style=native -f console256"' >> ~/.zshrc
# ack-grep alias
echo 'alias ack=ack-grep' >> ~/.zshrc
# change login shell
chsh -s /bin/zsh <<EOF
rca
EOF

# add our configurations to zshrc
echo "source ~/.rcarc" >> ~/.zshrc
