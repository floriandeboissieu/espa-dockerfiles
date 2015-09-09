
1: build-base-development.sh
    Builds on top of ubuntu:15.04.

    The folloing default ubuntu packages are installed:
        gcc
        python
        python-pip
        python-virtualenv

    The following version for these development apps are manually compiled and
    installed:

        git-v2.5.0


xx: Python Virtual Env and GDAL
    pip install --no-install GDAL==1.10.0
    cd <pyenv>/build/GDAL/
    python setup.py build_ext --include-dirs=/usr/include/gdal/
    pip install --no-download GDAL

