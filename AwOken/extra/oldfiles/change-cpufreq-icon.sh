#!/bin/bash

echo Please provide root password

sudo mv usr/share/pixmaps/cpufreq-applet/cpufreq-25.png usr/share/pixmaps/cpufreq-applet/cpufreq-25-backup.png
sudo mv usr/share/pixmaps/cpufreq-applet/cpufreq-50.png usr/share/pixmaps/cpufreq-applet/cpufreq-50-backup.png
sudo mv usr/share/pixmaps/cpufreq-applet/cpufreq-75.png usr/share/pixmaps/cpufreq-applet/cpufreq-75-backup.png
sudo mv usr/share/pixmaps/cpufreq-applet/cpufreq-100.png usr/share/pixmaps/cpufreq-applet/cpufreq-100-backup.png
sudo mv usr/share/pixmaps/cpufreq-applet/cpufreq-na.png usr/share/pixmaps/cpufreq-applet/cpufreq-na-backup.png
sudo cp extra/cpufreq-applet/cpufreq-25.png /usr/share/pixmaps/cpufreq-applet/
sudo cp extra/cpufreq-applet/cpufreq-50.png /usr/share/pixmaps/cpufreq-applet/
sudo cp extra/cpufreq-applet/cpufreq-75.png /usr/share/pixmaps/cpufreq-applet/
sudo cp extra/cpufreq-applet/cpufreq-100.png /usr/share/pixmaps/cpufreq-applet/
sudo cp extra/cpufreq-applet/cpufreq-na.png /usr/share/pixmaps/cpufreq-applet/

echo DONE
