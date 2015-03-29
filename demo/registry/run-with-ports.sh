#!/bin/sh

exec docker run -p 5000:5000 --name registry registry
