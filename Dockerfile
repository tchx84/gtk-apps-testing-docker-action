FROM fedora:33

RUN dnf update -y && \
    dnf install -y git meson desktop-file-utils libappstream-glib gtk3-devel dbus-x11 xorg-x11-server-Xvfb && \
    dnf install -y gcc python3-devel python3-pip gobject-introspection-devel vala && \
    dnf clean all

RUN git clone --single-branch --branch "libhandy-1-2" https://gitlab.gnome.org/GNOME/libhandy.git && \
    cd libhandy && \
    meson _build -Dgtk_doc=false -Dtests=false -Dexamples=false -Dvapi=false -Dglade_catalog=disabled --prefix /usr --libdir lib64 --bindir bin --datadir share && \
    cd _build && \
    sudo ninja install

RUN pip install black pyflakes pytest pytest-timeout PyGObject

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
