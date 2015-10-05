#!/bin/bash

echo Please provide root password

sudo rm -rf /usr/share/pixmaps/wicd_bk
sudo mkdir /usr/share/pixmaps/wicd_bk
sudo cp /usr/share/pixmaps/wicd/* /usr/share/pixmaps/wicd_bk/
sudo cp extra/wicd/* /usr/share/pixmaps/wicd/

echo DONE
