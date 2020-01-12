# OpenSSL issues

On some systems you might see an error message on startup like this:

    error while loading shared libraries: libcrypto.so.10: cannot open shared object file: No such file or directory

There are at least two possible causes and ways to resolve this.

## 1. Symbolic links
On some Ubuntu systems, different filenames are used for the ssl libs.
The first solution to add symbolic links as described at
https://askubuntu.com/a/339371

    # Make sure libssl is installed
    sudo apt-get update
    sudo apt-get install libssl1.0.0 libssl-dev

    # Add symbolic links
    cd /lib/x86_64-linux-gnu
    sudo ln -s libssl.so.1.0.0 libssl.so.10
    sudo ln -s libcrypto.so.1.0.0 libcrypto.so.10

## 2. Update OpenSSL
On older systems, the OpenSSL libraries might be older than the internal
libraries (Qt) require. In that case, you will need to update your
openssl as outlined at https://www.openssl.org.

First remove the symbolic links you added in the previous section.

The recommended approach is to build them outside of your system libs,
for example:

* First, be sure to remove any symbolic links you created in the previous
  section.
* Download the current source package from https://www.openssl.org/source/
* Untar the package in a user folder, e.g., ~/apps
* CD to the package folder and run './configure shared' then 'make'.
  The result should create new libssl and libcrypto.so files.
* You might probably need to create symbolic links libcrypto.so.10 and
  libssl.so.10 in that same folder.
* To run modelbuilder, use LD_LIBRARY_PATH=<path-to-new-openssl-folder>
  in the command line.
