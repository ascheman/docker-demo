FROM busybox

MAINTAINER Gerd Aschemann <gerd@aschemann.net>

# But don't use this:
WORKDIR / 
RUN wget http://aschemann.net/tmp/hello-world.tar.bz2
RUN bunzip2 hello-world.tar.bz2
# Drop the "DONTWORK" part to make it run (or exchange lines/comments)!
RUN tar xDONTWORKf hello-world.tar
# RUN tar xf hello-world.tar
RUN rm hello-world.tar
# --- Better perform all operations in one step to avoid creation of multiple
# intermediate images (each "RUN" commits to one AUFS layer in the end!)

CMD /hello-world.sh