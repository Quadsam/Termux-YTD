#!/data/data/com.termux/files/usr/bin/bash

# Project name : Termux-YTD
# Coded by: Khansaad1275 (You dont become a coder by just changing the credits)
# Github: https://github.com/khansaad1275/Termux-YTD
# Date : 14/4/2020

TERMUX_HOME="/data/data/com.termux/files/home"

# Causes the script to quit if an error occurs
set -e

# Make sure we are up to date, and have python, pip and youtube-dl installed.
printf '\e[01;36mRetriving package lists and installing dependencies\e[0m\n'
sleep 2
apt-get update -q
apt-get upgrade -y -q
apt-get install python{3,-pip} -y -q
pip install youtube-dl

# If the storage directory does not exist run termux-setup-storage.
if [[ ! -d ${TERMUX_HOME}/storage ]]; then
  printf '\e[0;36mRequesting access to storage\e[0m\n'
  sleep 2
  termux-setup-storage
fi

# Create needed directories.
for dir in "${TERMUX_HOME}/storage/shared/Termux-YTD" "${TERMUX_HOME}/.config/youtube-dl"; do
	printf '\e[0;36mCreating directory "%s"\e[0m\n' "${dir}"
	sleep 2
	install -d "${TERMUX_HOME}/${dir}"
done

# Install the url opener.
printf '\e[0;36mInstalling Termux-YTD\e[0m\n'
sleep 2
install -Dm755 "termux-url-opener" "${TERMUX_HOME}/bin"

printf '\n\e[0;36mInstallation Complete!\e[0m\n'
printf '\e[0;36mJust open the video you want to download in youtube, click share, select termux, choose a quality, and the download will start\e[0m\n'
printf '\e[0;32mFor More Awesome and Useful Tool like this Visit My website ©www.LearnTermux.tech\e[0m\n'
