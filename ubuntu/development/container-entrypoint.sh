#!/bin/bash
set -e

# THE_USER is defined in the Dockerfile

THE_GID=$1
THE_UID=$2

# Add the user and group to the system
groupadd --gid $THE_GID $THE_USER
useradd -r --gid $THE_GID --uid $THE_UID --system --create-home $THE_USER

# Fix the installation directory so that the developer can update it
chown -R $THE_UID.$THE_GID $PREFIX

# Add the espa runtime installation directory to the path
export PATH=$PREFIX/bin:/python-virtual/bin:$PATH

# Corectly set these environment variables for the user
export USER=$THE_USER
export HOME=/home/$THE_USER

# Now execute as the user
#exec gosu $THE_USER /bin/bash
exec gosu root /bin/bash

