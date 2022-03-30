#!/usr/bin/env sh
gsettings reset org.gnome.desktop.input-sources sources
gsettings reset org.gnome.desktop.input-sources xkb-options
nixos-rebuild switch --flake '.#rio'
