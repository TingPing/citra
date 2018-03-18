#!/bin/bash -ex

cd /citra

dnf install -y flatpak-builder git

COMMIT=`git rev-parse HEAD`
sed -e "s|@PATH@|file://$(pwd)|" -e "s|@COMMIT@|$COMMIT|" .travis/linux-flatpak/org.citra_emu.Citra.json.in > org.citra_emu.Citra.json

flatpak remote-add flathub https://dl.flathub.org/repo/flathub.flatpakrepo
flatpak-builder build --force-clean --repo=repo --install-deps-from=flathub --sandbox org.citra_emu.Citra.json
flatpak build-bundle repo org.citra_emu.Citra.flatpak org.citra_emu.Citra
