# Script to build johnkit/cmb-ace3p-win-paraview
# This builds all of the prerequisites needed to build smtk in a downstream image.
# docker build -f paraview.dockerfile -t johnkit/cmb-ace3p-win-paraview -m 20g --no-cache .

FROM johnkit/cmb-ace3p-win-base
SHELL [ "powershell", "-command"]

# Build + remove build files + force exit 0 (to save image for debug)
RUN ninja; C:\Users\ContainerUser\scripts\remove-files.ps1 superbuild\*\build\*; exit 0

RUN ls
