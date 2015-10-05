#!/bin/bash

cd /usr/share/liferea/pixmaps
echo Please provide root password

sudo rm available.png
sudo rm available_offline.png
sudo rm empty.png
sudo rm empty_offline.png
sudo mv available-backup.png available.png
sudo mv available_offline-backup.png available_offline.png
sudo mv empty-backup.png empty.png
sudo mv empty_offline-backup.png empty_offline.png

echo DONE
