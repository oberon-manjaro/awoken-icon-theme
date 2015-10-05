#!/bin/bash

echo Please provide root password

sudo mv /usr/share/liferea/pixmaps/available.png /usr/share/liferea/pixmaps/available-backup.png
sudo mv /usr/share/liferea/pixmaps/available_offline.png /usr/share/liferea/pixmaps/available_offline-backup.png
sudo mv /usr/share/liferea/pixmaps/empty.png /usr/share/liferea/pixmaps/empty-backup.png
sudo mv /usr/share/liferea/pixmaps/empty_offline.png /usr/share/liferea/pixmaps/empty_offline-backup.png
sudo cp extra/liferea/available.png /usr/share/liferea/pixmaps
sudo cp extra/liferea/available_offline.png /usr/share/liferea/pixmaps
sudo cp extra/liferea/empty.png /usr/share/liferea/pixmaps
sudo cp extra/liferea/empty_offline.png /usr/share/liferea/pixmaps

echo DONE
