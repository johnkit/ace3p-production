# Hard-coded to build modelbuilder with ace3p plugin

$ErrorActionPreference = "Stop"

# Generate package name and write to local file
$datecode = Get-Date -Format "yyMMdd"
$package_name = "modelbuilder-ace3p-windows-$datecode"
Write-Output "using package name $package_name"
Set-Content -Path ./.package_name -Value $package_name -NoNewline

# Build docker images
docker build -f tools.dockerfile -t johnkit:cmb-win-tools -m 20g .
docker build -f base.dockerfile -t johnkit:cmb-ace3p-win-base -m 20g --no-cache .
docker build -f paraview.dockerfile -t johnkit:cmb-ace3p-win-paraview -m 20g --no-cache .
docker build -f smtk.dockerfile -t johnkit:cmb-ace3p-win-smtk -m 20g --no-cache .
docker build -f projectmanager.dockerfile -t johnkit:cmb-ace3p-win-projectmanager -m 20g --no-cache .
docker build -f ace3p.dockerfile -t johnkit:cmb-ace3p-win-ace3p -m 20g --no-cache .
docker build -f cmb.dockerfile -t johnkit:cmb-ace3p-win-modelbuilder -m 20g --no-cache .

# Create container so we can copy the package file
docker create -it --name temp johnkit:cmb-ace3p-win-modelbuilder powershell
docker cp temp:C:/Users/ContainerUser/build/cmb-superbuild/$package_name.zip . ; exit 0
docker rm -f temp
