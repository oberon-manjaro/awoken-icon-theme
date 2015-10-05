#!/bin/bash
echo Please provide root password

sudo mv /usr/share/pixmaps/pidgin/status/ /usr/share/pixmaps/pidgin/statusbk
sudo mv /usr/share/pixmaps/pidgin/tray/ /usr/share/pixmaps/pidgin/traybk

sudo cp -rf extra/pidgin/status/ /usr/share/pixmaps/pidgin/status
sudo chmod 755 /usr/share/pixmaps/pidgin/status/22
sudo chmod 755 /usr/share/pixmaps/pidgin/status/32
sudo chmod 755 /usr/share/pixmaps/pidgin/status/48

sudo cp -rf extra/pidgin/tray/ /usr/share/pixmaps/pidgin/tray
sudo chmod 755 /usr/share/pixmaps/pidgin/tray/22
sudo chmod 755 /usr/share/pixmaps/pidgin/tray/32
sudo chmod 755 /usr/share/pixmaps/pidgin/tray/48

echo DONE
