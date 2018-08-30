#!/bin/bash

ARCHIVE=/tmp/src.tar.gz
SRC_DIR=/usr/local/src

# Start dockerd in background
nohup dockerd > /var/log/docker.log 2>&1 &

if [ -f "${ARCHIVE}" ]; then
  tar xzf ${ARCHIVE} -C ${SRC_DIR}
fi

exec "$@"
