#!/bin/bash
set -xe
systemctl disable lightdm.service
# More packages could be removed if a GUI is not desired, e.g:
# 'compiz*' and 'unity-*'
apt purge -y \
  'account-plugin-*' \
  accountsservice \
  chromium-browser \
  firefox \
  'libreoffice-*' \
  lightdm \
  manpages \
  'remmina*' \
  'rhythmbox*' \
  'thunderbird*' \
  'update-manager-*' \
  'update-notifier-*'

apt update
apt install -y apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
add-apt-repository "deb [arch=arm64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
apt update
apt install -y docker-ce

apt autoremove -y --purge
