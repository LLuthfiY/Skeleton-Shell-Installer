#!/bin/bash

# This script will install the Skeleton Shell

git clone https://github.com/LLuthfiY/Skeleton-Shell $HOME/.local/share/Skeleton-Shell

function asking {
    if [ -d "$HOME/.config/$1" ]; then
      read -p "Replace $1 folder?(y/N) " -n 1 -r
      echo    # (optional) move to a new line
      if [[ $REPLY =~ ^[Yy]$ ]] 
      then
          mv $HOME/.config/$1 $HOME/.config/$1-$(date +%Y-%m-%d-%H-%M-%S)
          cp -r $PWD/$1 $HOME/.config
      else
          echo "Skipping $1"
      fi
    else
      cp -r $PWD/$1 $HOME/.config
    fi

}

asking "Skeleton-Shell"
asking "gtk-3.0"
asking "gtk-4.0"
asking "kitty"


qs -p $HOME/.local/share/Skeleton-Shell & disown
sleep 1
pkill qs
qs -p $HOME/.local/share/Skeleton-Shell & disown
hyprctl reload

cat ~/.config/hypr/hyprland.conf | grep "Skeleton-Shell" echo "source = ~/.cache/quickshell/Skeleton-Shell/ConfigFolder/hyprland/skeleton-shell.conf" >> ~/.config/hypr/hyprland.conf
echo "Done!"
