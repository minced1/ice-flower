#!/bin/sh
pushd ~/.dotfiles
home-manager switch -f ./users/never/home.nix
popd
