#!/bin/bash
set -x

wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
rm -f packages.microsoft.gpg

sudo apt install -y apt-transport-https
sudo apt update
sudo apt install -y code # or code-insiders

runuser -l vagrant -c "code --force --install-extension mshr-h.veriloghdl"
runuser -l vagrant -c "code --force --install-extension ms-python.python"
runuser -l vagrant -c "code --force --install-extension ms-python.vscode-pylance"
runuser -l vagrant -c "code --force --install-extension ms-toolsai.jupyter"
runuser -l vagrant -c "code --force --install-extension ms-toolsai.jupyter-keymap"
runuser -l vagrant -c "code --force --install-extension ms-toolsai.jupyter-renderers"