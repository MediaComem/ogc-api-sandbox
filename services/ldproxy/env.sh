#!/bin/bash

source ../env.sh

# Change for new service and subpath

export SERVICE_NAME="ldproxy"

# Is subpath (Python web apps only).

export SERVICE_PATH="/${SERVICE_NAME}"

# export SERVICE_PATH_MANAGER="/manager_ldproxy"

# Can be usually left as isunless you want to run specific build and/or version.

export DOCKER_IMAGE_NAME="iide/ldproxy"
export DOCKER_IMAGE_VERSION="latest"
export DOCKER_IMAGE="${DOCKER_IMAGE_NAME}:${DOCKER_IMAGE_VERSION}"

# Add DEPENDS_ON field to wait for the postgis container

export DEPENDS_ON="postgis"