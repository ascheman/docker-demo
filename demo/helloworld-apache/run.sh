#!/bin/sh

exec docker run -t -p 7777:80 --name apache ascheman/apache
