#!/data/data/com.termux/files/usr/bin/bash

# Create directory if not exists
mkdir -p $HOME/python-lib-tools

# Make script executable
chmod +x $HOME/python-lib-tools/piptools.sh

# Create alias properly
echo "alias piptools='bash $HOME/python-lib-tools/piptools.sh'" >> $HOME/.bashrc

# Source bashrc
source $HOME/.bashrc

echo "Installation complete! Please restart Termux and type 'piptools' to start."