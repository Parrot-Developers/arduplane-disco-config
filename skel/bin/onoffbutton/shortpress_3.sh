#!/bin/sh

ulog_tag="APM:Plane Disco"
source /usr/share/ulog/ulog_api.sh

ulogi "Stopping stock autopilot"
kk

ulogi "Starting APM:Plane"
media-ctl -l '"mt9f002 0-0010":0->"avicam.0":0[1]'
media-ctl -l '"avicam_dummy_dev.0":0->"avicam.0":0[0]'
pstart apm-plane-disco
pstart dxowrapperd
pstart pimp

ldc set_pattern apm true
