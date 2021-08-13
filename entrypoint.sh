#!/bin/sh -l


meson _test && cd _test

# XXX
(cd ../src; /usr/bin/glib-compile-resources portfolio.gresource.xml; cp portfolio.gresource ../_test/src);

xvfb-run --auto-servernum meson test --verbose
