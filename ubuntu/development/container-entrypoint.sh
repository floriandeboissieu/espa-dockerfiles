#!/bin/bash
set -e

# THE_USER is defined in the Dockerfile

THE_GID=$1
THE_UID=$2

# Add the user and group to the system
groupadd --gid $THE_GID $THE_USER
useradd -r --gid $THE_GID --uid $THE_UID --system $THE_USER

# Now execute as the user
exec gosu $THE_USER /bin/bash
