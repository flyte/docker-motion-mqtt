#!/bin/bash

set -ex

apt-get install -y \
    autoconf \
    curl \
    build-essential \
    git \
    libtool \
    locales \
    wget \
    pkg-config

echo "en_US.UTF-8 UTF-8" > /etc/locale.gen
DEBIAN_FRONTEND=noninteractive dpkg-reconfigure locales

git clone https://github.com/Motion-Project/motion.git
cd motion

autoreconf -fiv
./configure
make
make install

apt-get purge -y \
    autoconf \
    curl \
    build-essential \
    git \
    libtool \
    locales \
    wget \
    pkg-config

apt-get autoremove --purge -y
apt-get clean
