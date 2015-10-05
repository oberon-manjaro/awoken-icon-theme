#!/bin/bash
echo Please provide root password

sudo rm -rf  /usr/share/pixmaps/pidgin/status
sudo rm -rf  /usr/share/pixmaps/pidgin/tray
sudo mv /usr/share/pixmaps/pidgin/statusbk/ /usr/share/pixmaps/pidgin/status
sudo mv /usr/share/pixmaps/pidgin/traybk/ /usr/share/pixmaps/pidgin/tray

echo DONE
