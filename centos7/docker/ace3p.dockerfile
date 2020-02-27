FROM johnkit/cmb-ace3p-centos7-projectmanager
LABEL maintainer="John Tourtellott <john.tourtellott@kitware.com>"
USER buildslave

# Hack to update cmb-superbuild
# RUN rm -rf /home/buildslave/cmb-superbuild/build/install/share/cmb/workflows
# RUN cd /home/buildslave/cmb-superbuild/src; git fetch origin; git reset --hard origin/ace3p-production; git log -1
# RUN cd /home/buildslave/cmb-superbuild/build; /home/buildslave/misc/root/cmake/bin/cmake .

WORKDIR /home/buildslave/cmb-superbuild/build
RUN scl enable devtoolset-7 -- make cumulus;
RUN scl enable devtoolset-7 -- make smtkace3p/fast; /home/buildslave/remove_build_files.sh; exit 0
