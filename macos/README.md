# macOS builds

At present, macOS builds are done on "bare metal", that is,
without docker containers or other virtual machine environments.
As such, macOS build scripts are specific to each individual machine.

## Build on TalosIV

As of May 2020, Bob's TalosIV system is the preferred build machine because
it runs macOS 10.13, which Cho needs.

1\. Sign into johnt account on Talos:

    $ ssh johnt@talosiv

2\. Get latest source for superbuild and ace3p-production

    $ cd ~/projects/slac/git/cmb-superbuild
    $ git status  ==> make sure nothing is modified
    $ git checkout ace3p-production
    $ git pull
    $ git submodule update

    $ cd ~/projects/slac/git/ace3p-production
    $ git status  ==> make sure nothing is modified
    $ git checkout master
    $ git pull

3\. Clear and start build

    $ cd ~/projects/slac/build/production
    $ rm -rf *
    $ ../../git/ace3p-production/macos/talosiv.sh

That will ask if the superbuild is ready; enter 'y' to proceed.

On success a .dmg file will be generated in the build directory.

4\. Can then scp from TalosIV to local machine. Fill in the DATECODE below:

    $ scp johnt@talosiv:projects/slac/build/production/modelbuilder-ace3p-macos10.14-{DATECODE}.dmg
