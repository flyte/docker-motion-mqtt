#!/bin/bash

set -ex

apt-get update
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

cd /tmp
git clone --depth 1 https://github.com/Motion-Project/motion.git
cd motion

autoreconf -fiv
./configure --prefix /usr/local
make
make install
cd /
rm -rf /tmp/motion

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
rm -rf /var/lib/apt/lists/*
