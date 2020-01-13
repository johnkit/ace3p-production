#!/bin/sh

# Users must manually checkout branch of interest; current default is
# https://gitlab.kitware.com/john.tourtellott/cmb-superbuild.git
# cmb-superbuild:ace3p-plugin

source_path=/Users/john/projects/slac/git/cmb-superbuild
echo Using source path ${source_path}

read -p "Are you sure the source path is correct and up to date? [y/N]: " -n 1 -r
echo    # (optional) move to a new line
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
    echo Exiting
    exit 1
fi

cmake \
  -GNinja \
  -DCMAKE_INSTALL_PREFIX:PATH=install \
  -DCMAKE_OSX_DEPLOYMENT_TARGET:STRING=10.12 \
  -DENABLE_cmbusersguide:BOOL=OFF \
  -DENABLE_cmbworkflows:BOOL=OFF \
  -DENABLE_DOCUMENTATION:BOOL=OFF \
  -DENABLE_python3:BOOL=ON \
  -DQt5_DIR:PATH=/Users/john/projects/qt.io/5.12.6/clang_64/lib/cmake/Qt5 \
  -DENABLE_smtkace3p:BOOL=ON \
  -DENABLE_smtkprojectmanager:BOOL=ON \
  -DENABLE_smtkresourcemanagerstat:BOOL=OFF \
  -DENABLE_smtkusersguide:BOOL=OFF \
  -DTEST_cmb:BOOL=OFF \
  -DTEST_smtk:BOOL=OFF \
  -DUSE_SYSTEM_qt5:BOOL=ON \
  ${source_path}

ninja

ctest -R modelbuilder > ctest.log 2>&1
