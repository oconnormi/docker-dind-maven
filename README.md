# Docker-in-Docker with maven

Useful for testing maven builds that need access to a docker daemon without sharing the host daemon

## Usage

To start a disposable container for running builds simply run: `docker container run --rm -it --privileged oconnormi/dind-maven`

To copy in local changes from a git repository try something like:

```
git archive -o /tmp/src.tar.gz $(git stash create)
docker container run --rm -it \
  --privileged \
  --mount type=bind,source=/tmp/src.tar.gz,target=/usr/local/src/src.tar.gz \
  oconnormi/dind-maven
```

To copy in local changes and share the local m2 repository:

```
git archive -o /tmp/src.tar.gz $(git stash create)
docker container run --rm -it \
  --privileged \
  --mount type=bind,source=/tmp/src.tar.gz,target=/tmp/src/src.tar.gz \
  --mount type=bind,source=${HOME}/.m2,target=/root/.m2 \
  oconnormi/dind-maven
```
