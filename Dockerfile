FROM fedora:latest

RUN dnf update -y && \
    dnf install -y git meson desktop-file-utils libappstream-glib gtk3-devel dbus-x11 xorg-x11-server-Xvfb && \
    dnf install -y gjs && \
    dnf install -y gcc gobject-introspection-devel vala libhandy-devel && \
    dnf clean all

RUN git clone https://github.com/ptomato/jasmine-gjs.git && \
    cd jasmine-gjs && \
    meson _build && \
    cd _build && \
    sudo ninja install

RUN git clone --branch libhandy-1-6 --single-branch https://gitlab.gnome.org/GNOME/libhandy.git && \
    cd libhandy && \
    meson _build --prefix=/usr --datadir=share && \
    cd _build && \
    sudo ninja install

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
