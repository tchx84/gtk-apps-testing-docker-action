#!/bin/sh -l

meson _test && cd _test && ninja
xvfb-run --auto-servernum meson test --verbose
