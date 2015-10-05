#!/bin/bash
echo Please provide root password

sudo mkdir /usr/share/emesene/themes/default_bk/
sudo mv /usr/share/emesene/themes/default/* /usr/share/emesene/themes/default_bk/
sudo cp extra/emesene/* /usr/share/emesene/themes/default/

#echo "emesene" >> DO_NOT_REMOVE
echo DONE
