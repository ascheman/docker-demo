# Docker Demos

Some [Docker](https://docker.io) demonstrations for the [Frankfurt Docker Meetup on 30th of March 2015](http://www.meetup.com/Docker-Frankfurt/events/220764718/).

## Docker documentation

* [Dockerfile Reference](https://docs.docker.com/reference/builder/)
* [Dockerfile Best Practices](https://docs.docker.com/articles/dockerfile_best-practices/), 
in particular the [build cache section](https://docs.docker.com/articles/dockerfile_best-practices/#build-cache)

## Preparations

* Install Vagrant box (TBD)
* Pull some Docker images from other local virtual machine (TBD)

## Dockerfile Demos

TODO: Add some generic description about the samples:

* Almost all samples start from _busybox_ image
* Most samples are about _hello world_ in different forms

### Demo 1 - Hello World (embedded)

[Dockerfile](demo/helloworld-embedded/Dockerfile)

* Run [build.sh](demo/helloworld-embedded/build.sh)
* Run [run.sh](demo/helloworld-embedded/run.sh)
* Container will print _hello world_ in a loop
* Dettach container by pressing ^c
* Check _docker ps_ or _docker ps -a_ and _docker images_
* Check _/var/lib/docker/aufs/*_

### Demo 2 - Hello World (scripted)

[Dockerfile](demo/helloworld-script/Dockerfile)

* Perform some operations as in Demo 1 (build, run)
* Difference: _executable_ [hello-world.sh](demo/helloworld-script/hello-world.sh) 
is added to image with _COPY_ instruction, which is preferred over _ADD_ instruction.
* Additional hint: Adding multiple files should be performed in multiple COPY
invocations: Each of them leaves a consistent cache image if successful; if one fails
the previous (successful) steps will not be run again but reused.

### Demo 3 - Hello World (from tar)

[Dockerfile](demo/helloworld-tar/Dockerfile)

* Perform some operations as in Demo 1 (build, run)
* Watch typical problems
- tar file must reside inside Dockerfile context
- Using symlinks is not sufficient!
* _local_ tar is unpacked (despite next demo)

### Demo 4 - Hello World (from remote tar)

[Dockerfile](demo/helloworld-add-remote-tar/Dockerfile)

* Perform some operations as in Demo 1 (build, run)
* Watch typical problems
* wget cannot fetch https URLs
* _remote_ tar is NOT unpacked (despite previous demo) -> _run.sh_ will fail
* Check image (docker run -ti --rm helloworld-add-remote-tar /bin/sh; ls -l /)
* Next try with build.sh but uncomment unpacking instructions in Dockerfile

### Demo 5 - Hello World (multi run commands / remote tar)

[Dockerfile](demo/helloworld-multi-run-tar/Dockerfile)

* Perform some operations as in Demo 1 (build, run)
* Watch typical problems
* Each _RUN_ instruction creates a cache entry
* If it fails previous command executions (commits) are still there 
* Fix tar command
* Rerun build.sh
* Check /var/lib/docker/aufs/* (different layers with different contents)

### Demo 6 - Hello World / Apache (Expose)

[Apache Simple Dockerfile](demo/apache-simple/Dockerfile)
[Apache Hello World Dockerfile](demo/helloworld-apache/Dockerfile)

* Use both (or make use of prepared apache-simple)
* Check for _EXPOSE_ instruction

### Demo 7 - Volumes / Linking

TBD (w. Nexus?)

## Registry

### Demo 8 - Simply run the registry

* First pull it from neighbour Vagrant: [pull-registry.sh](demo/registry/pull-registry.sh)
* Run it with ports exposed: [run-with-ports.sh](demo/registry/run-with-ports.sh)

* Use local directory for contents: [run-with-ports-and-volumes.sh](demo/registry/run-with-ports-and-volumes.sh)
