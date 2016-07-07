#!/bin/bash

export ALCHEMY_WORKSPACE_DIR=$(pwd)
export ALCHEMY_HOME=alchemy
if [ -z $ALCHEMY_USE_COLORS ]
then
    export ALCHEMY_USE_COLORS=1
fi
export ALCHEMY_TARGET_CONFIG_DIR=${ALCHEMY_WORKSPACE_DIR}/config

${ALCHEMY_HOME}/scripts/alchemake "$@"
