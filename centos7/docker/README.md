# ACE3P Production Centos 7

Dockerfile files to build cmb on centos.

Adapted from buildbot/machines/cmbbinsdash

## Status Feb 2020

* Build completes but Qt cannot make SSL requests.
* Current theory is that openssl installed with curl too old
* Next step is to installing newer openssl instead of the
  `yum install openssl-devel` in base.dockerfile.
* Built a johnkit/qtssl-test, but not sure what is in it,
  and it likely failed to work.


## Build

To do a "clean" build, we advise first removing all extant containers:

```
docker container prune
./build_all.sh
```

See build_all.sh for the correct build sequence.
