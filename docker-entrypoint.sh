#!/bin/bash

# Start dockerd in background
nohup dockerd & 

exec "$@"
