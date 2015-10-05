#!/bin/bash

echo Please provide root password

sudo rm -rf /usr/share/emesene/themes/default/*
sudo cp /usr/share/emesene/themes/default_bk/* /usr/share/emesene/themes/default/
sudo rm -rf /usr/share/emesene/themes/default_bk

echo DONE
