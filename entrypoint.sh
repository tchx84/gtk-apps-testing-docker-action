#!/bin/sh -l

xvfb-run --auto-servernum flatpak-builder --repo=repo --force-clean --install-deps-from=flathub --disable-rofiles-fuse build $MANIFEST_PATH
