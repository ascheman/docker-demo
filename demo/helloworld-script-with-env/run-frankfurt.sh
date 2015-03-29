#!/bin/sh

exec docker run -t --name hellofrankfurt -e WORLD=frankfurt helloworld-script-with-env
