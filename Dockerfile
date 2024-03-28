FROM fedora:latest

RUN dnf update -y && \
    dnf install -y flatpak-builder dbus-x11 xorg-x11-server-Xvfb && \
    dnf clean all

RUN flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
