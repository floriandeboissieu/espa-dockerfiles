
1: build-base-buildpack.sh
    Builds on top of ubuntu:15.04.

    It installs a bunch of stuff that is required to build gcc and or python.


2: build-base-gcc.sh
    Builds on top of base-buildpack.

    It installs gcc 5.1.0.  It takes forever to build.


3: build-base-python.sh
    Builds on top of base-gcc.

    It installs the base python 2.7.10, pip 7.1.0, and virtualenv.
