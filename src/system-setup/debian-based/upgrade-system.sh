#!/usr/bin/env bash

echo "========== upgrade system =========="
sudo apt-get -y upgrade
sudo apt-get -y autoclean
sudo apt-get -y autoremove --purge
sudo journalctl --vacuum-time=1s
