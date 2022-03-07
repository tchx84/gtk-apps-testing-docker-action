FROM fedora:latest

RUN dnf update -y && \
    dnf install -y git meson desktop-file-utils libappstream-glib gtk3-devel dbus-x11 xorg-x11-server-Xvfb && \
    dnf install -y gjs && \
    dnf clean all

RUN git clone https://github.com/ptomato/jasmine-gjs.git && \
    cd jasmine-gjs && \
    meson _build && \
    cd _build && \
    sudo ninja install

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
