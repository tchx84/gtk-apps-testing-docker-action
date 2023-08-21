FROM fedora:latest

RUN dnf update -y && \
    dnf install -y git meson desktop-file-utils libappstream-glib gtk3-devel dbus-x11 xorg-x11-server-Xvfb && \
    dnf install -y gcc python3-devel python3-pip gobject-introspection-devel vala libhandy-devel && \
    dnf install -y libadwaita-devel && \
    dnf clean all

RUN pip install black pyflakes pytest pytest-timeout PyGObject

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
