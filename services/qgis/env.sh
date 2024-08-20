#!/bin/bash

source ../env.sh

# Change for new service and subpath
export SERVICE_NAME="qgis"

# Is subpath (Python web apps only).
export SERVICE_PATH="/${SERVICE_NAME}"

# Can be usually left as isunless you want to run specific build and/or version.

# Docker image c2c

export DOCKER_IMAGE_NAME="camptocamp/qgis-server"
export DOCKER_IMAGE_VERSION="latest"

# Docker image opengisch (not working --> some parameters probably need to be adapted) 

#export DOCKER_IMAGE_NAME="opengisch/qgis-server"
#export DOCKER_IMAGE_VERSION="stable"

export DOCKER_IMAGE="${DOCKER_IMAGE_NAME}:${DOCKER_IMAGE_VERSION}"

