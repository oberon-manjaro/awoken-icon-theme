#!/bin/bash

cd /usr/share/pixmaps/cpufreq-applet
echo Please provide root password
sudo rm cpufreq-25.png
sudo rm cpufreq-50.png
sudo rm cpufreq-75.png
sudo rm cpufreq-100.png
sudo rm cpufreq-na.png
sudo mv cpufreq-25-backup.png cpufreq-25.png
sudo mv cpufreq-50-backup.png cpufreq-50.png
sudo mv cpufreq-75-backup.png cpufreq-75.png
sudo mv cpufreq-100-backup.png cpufreq-100.png
sudo mv cpufreq-na-backup.png cpufreq-na.png

echo DONE
