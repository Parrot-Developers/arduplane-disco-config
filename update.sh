#!/bin/sh

/usr/bin/ftp -vdin << EOF
open 192.168.42.1
binary
mkdir  internal_000/APM/
put Alchemy-out/linux-parrot-arm/final/usr/bin/apm-plane-disco internal_000/APM/apm-plane-disco
EOF
