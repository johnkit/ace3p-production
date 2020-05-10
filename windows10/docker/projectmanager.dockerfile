# Script to build johnkit/cmb-ace3p-win-projectmanager
# docker build -f projectmanager.dockerfile -t johnkit/cmb-ace3p-win-projectmanager -m 20g --no-cache .

FROM johnkit/cmb-ace3p-win-smtk
SHELL [ "powershell", "-command"]
RUN make smtkprojectmanager/fast; C:\Users\ContainerUser\scripts\remove-files.ps1 superbuild\smtkprojectmanager\build; exit 0
