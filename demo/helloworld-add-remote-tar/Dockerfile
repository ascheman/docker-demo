FROM busybox

MAINTAINER Gerd Aschemann <gerd@aschemann.net>

# Normally we could get the file from GitHub but busybox' wget is not capable of https!
# https://github.com/ascheman/docker-demo/raw/master/data/hello-world.tar.bz2

# This does not work, since the TAR file is not unpacked!
ADD http://aschemann.net/tmp/hello-world.tar.bz2 /cmd

# Use this instead ...
# RUN cd / && wget http://aschemann.net/tmp/hello-world.tar.bz2 && \
#   bunzip2 hello-world.tar.bz2 && \
#   tar xf hello-world.tar && \
#   rm hello-world.tar
# --- Don't forget to perform all operations in one step to avoid creation of multiple
# intermediate images (each "RUN" commits to one AUFS layer in the end!)

CMD /hello-world.sh