#!/bin/sh
set -e  # exit on error

# Builds the entire modelbuilder-ace3p software chain from scratch
datecode=`date +%y%m%d`
package_name=modelbuilder-ace3p-centos7-${datecode}

# Generic (cmb-centos-*)
# docker build -f base.dockerfile --tag=johnkit/cmb-centos7-base .

# ace3p-specific (cmb-ace3p-centos-*)
docker build -f paraview.dockerfile --tag=johnkit/cmb-ace3p-centos7-paraview --no-cache .
docker build -f smtk.dockerfile --tag=johnkit/cmb-ace3p-centos7-smtk --no-cache .
docker build -f projectmanager.dockerfile --tag=johnkit/cmb-ace3p-centos7-projectmanager --no-cache .
docker build -f ace3p.dockerfile --tag=johnkit/cmb-ace3p-centos7-ace3p --no-cache .
docker build -f cmb.dockerfile --build-arg package_name=${package_name} --tag=johnkit/cmb-ace3p-centos7-modelbuilder --no-cache .

# Copy the package file
docker create -it --name temp johnkit/cmb-ace3p-centos7-modelbuilder bash
docker cp temp:/home/buildslave/cmb-superbuild/build/${package_name}.tar.gz . ; exit 0
docker rm -f temp
