#!/bin/bash

set -e

if [ "$1" = "update" ]; then
    echo "updating filesystem"
    drone_address=${DRONE_ADDRESS:-192.168.42.1}
    rsync \
        --partial --progress \
        --archive \
        --verbose \
        --compress \
        --no-owner \
        --no-group \
        Alchemy-out/linux-parrot-arm/final/ \
        ${drone_address}::root/ \
        --exclude-from=./config/rsync_exclude
    adb shell chmod 640 '/etc/boxinit.d/*.rc'
    adb shell sync
    exit 0
fi

if [ -n "$(which ccache)" ]; then
    export ALCHEMY_USE_CCACHE=1
fi

export ALCHEMY_WORKSPACE_DIR=$(pwd)
export ALCHEMY_HOME=alchemy
if [ -z $ALCHEMY_USE_COLORS ]
then
    export ALCHEMY_USE_COLORS=1
fi
export ALCHEMY_TARGET_CONFIG_DIR=${ALCHEMY_WORKSPACE_DIR}/config

${ALCHEMY_HOME}/scripts/alchemake "$@"
