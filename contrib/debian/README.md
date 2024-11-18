
Debian
====================
This directory contains files used to package ethanexod/ethanexo-qt
for Debian-based Linux systems. If you compile ethanexod/ethanexo-qt yourself, there are some useful files here.

## ethanexo: URI support ##


ethanexo-qt.desktop  (Gnome / Open Desktop)
To install:

	sudo desktop-file-install ethanexo-qt.desktop
	sudo update-desktop-database

If you build yourself, you will either need to modify the paths in
the .desktop file or copy or symlink your ethanexo-qt binary to `/usr/bin`
and the `../../share/pixmaps/ethanexo128.png` to `/usr/share/pixmaps`

ethanexo-qt.protocol (KDE)

