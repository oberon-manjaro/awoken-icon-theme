#!/bin/bash
echo Please provide root password

sudo mv /usr/share/icons/hicolor/scalable/apps/screenlets.svg /usr/share/icons/hicolor/scalable/apps/screenlets-backup.svg
sudo cp extra/screenlets/screenlets.png /usr/share/icons/hicolor/scalable/apps

echo DONE
