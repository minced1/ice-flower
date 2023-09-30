#!/usr/bin/env bash
shopt -s globstar

if [ "$1" = "--update" ]; then
  #sudo nix-channel --update
  nix flake update
elif [ "$1" = "--insert" ]; then
  for f in data/**/*; do
    if [ -f "$f" ]; then
      sed -i "s|##${f#data/}##|$(cat $f)|g" **/*.nix
    fi
  done
elif [ "$1" = "--clean" ]; then
  for f in data/**/*; do
    if [ -f "$f" ]; then
      sed -i "s|$(cat $f)|##${f#data/}##|g" **/*.nix
    fi
  done
elif [ "$1" = "--switch" ]; then
  sudo nixos-rebuild switch --flake .#
elif [ "$1" = "--boot" ]; then
  sudo nixos-rebuild boot --flake .#
else
  echo "Usage: ice-flake.sh [OPTION]

Options:

--update	Update Nix channels and the flake inputs
--insert	Insert data folder contents to the placeholders
--clean		Clean data folder contents from the placeholders
--switch	Switch to the configuration immediately
--boot		Switch to the configuration on boot"
fi
