#!/bin/bash

if [ "$1" == "config" ]
then
    exec cat /usr/local/etc/motion/motion-dist.conf
else
    exec /usr/local/bin/motion "$@"
fi
