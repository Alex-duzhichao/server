#!/bin/bash
cd ~/server
git checkout -f 
git pull
cp -fp ~/server/doc/zshrc ~/.zshrc
source ~/.zshrc