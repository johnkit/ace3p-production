# docker build -f ace3p.dockerfile -t johnkit/cmb-ace3p-win-ace3p -m 20g --no-cache .

FROM johnkit/cmb-ace3p-win-projectmanager

SHELL [ "powershell", "-command"]

# HACK for testing interim fixes
# RUN cd C:/Users/ContainerUser/code/cmb-superbuild; git fetch origin ace3p-production; git checkout FETCH_HEAD; git log -1
# RUN cmake .

RUN make cumulus/fast; make smtkace3p/fast; C:\Users\ContainerUser\scripts\remove-files.ps1 superbuild\smtkace3p\build; exit 0
