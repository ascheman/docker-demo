#!/bin/sh

: ${WORLD:="world"}

while true; do echo "hello ${WORLD}" > /dev/console; sleep 2; done