#!/bin/sh -l

meson _test && cd _test

# XXX
(cd ../src; /usr/bin/glib-compile-resources com.github.tchx84.Flatseal.data.gresource.xml; cp com.github.tchx84.Flatseal.data.gresource ../_test/src);
(cd ../src; /usr/bin/glib-compile-resources com.github.tchx84.Flatseal.src.gresource.xml; cp com.github.tchx84.Flatseal.src.gresource ../_test/src);

xvfb-run --auto-servernum meson test --verbose
