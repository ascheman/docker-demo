FROM busybox

MAINTAINER Gerd Aschemann <gerd@aschemann.net>

# This does not work, since we can only refer to files in the current folder or below
ADD ../../data/hello-world.tar.bz2 /
# First copy the file here (e.g., ln ../../data/hello-world.tar.bz2 .), then use the following ADD
# ADD hello-world.tar.bz2 /

CMD /hello-world.sh