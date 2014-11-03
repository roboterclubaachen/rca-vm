#!/bin/bash
# Some Basic Tools:
# Terminal Emulator: xfce4-terminal
# Picture-Viewer: ristretto
# Browser: firefox


apt-get install -y xfce4-terminal ristretto firefox python-serial evince

# install grabserial
cd ~
git clone https://github.com/tbird20d/grabserial.git
cd grabserial/
sudo python setup.py install
cd ~
rm -rf ~/grabserial

