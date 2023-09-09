#!/bin/sh
pushd ~/.dotfiles
nix build .#homeManagerConfigurations.never.activationPackage
./result/activate
popd
