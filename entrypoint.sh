#!/bin/sh -l

meson _test && cd _test
xvfb-run --auto-servernum meson test --verbose
