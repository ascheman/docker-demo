#!/bin/sh

mkdir -p /tmp/local-registry

exec docker run -p 5000:5000 -v /tmp/local-registry:/local-registry -e STORAGE_PATH=/local-registry --name local-registry registry 
