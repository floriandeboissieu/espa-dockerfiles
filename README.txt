
build-base-image.sh:
    This is ran first to build a base ubuntu image tweaked for docker by the
    phusion folks.

    I modified it to use ubuntu 15.04 instead of 14.04.


build-base-buildpack.sh:
    This is ran second, and builds on top of base-image.

    It installs a bunch of stuff that is required to build gcc and or python.


build-base-gcc.sh:
    This is ran third, and builds on top of base-buildpack.

    It installs gcc 5.1.0.  It takes forever to build.


build-base-python.sh:
    This is ran fourth, and builds on top of base-gcc.

    It installs the base python 2.7.10, pip 7.1.0, and virtualenv.
