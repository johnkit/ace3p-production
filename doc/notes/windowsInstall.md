# CMB Modelbuilder Install Instructions for Windows

The CMB modelbuilder application can be used to create ACE3P input
files from data entered in form-style attribute panels.


## Install

The Windows version of modelbuilder is distributed as a zip file.
There is no installer program; you only unzip the file to a convenient
location in your user area. The modelbuilder.exe program is in the "bin"
subfolder. You can create a shortcut to it on your desktop, if desired.

Before running modelbuilder, it is recommended that you also create a
projects root folder for modelbuilder projects that you will create.


## Run

The first time you run modelbuilder.exe, your system might display a
blue popup with the title "Windows protected your PC". This because
our packages are not signed with MicroSoft. You can proceed to run
modelbuilder by clicking the "More Info" link, which brings up a
"Run anyway" button.


## Plugin Setup

The first time you run modelbuilder, the plugins used for ACE3P might not
be loaded. Use these steps to update the application to auto-load three
plugins: SLACTools, smtkProjectManagerPlugin, and smtkACE3PPlugin.

* In the "Tools" menu, select "Manager Plugins...", which brings up a dialog
  with two panels labeled "Remote Plugins" (which should be empty) and
  "Local PLugins".
* In the "Local Plugins" panel, look in the list for "SLACTools" and expand
  it by clicking the arrow to its left. In the expanded section, check the
  box labeled "Auto Load".
* In the "Local Plugins" panel, look in the list for "smtkACE3PPlugin" and
  expand it by clicking the arrow to its left. In the expanded section, check
  the box labeled "Auto Load".
* In the "Local Plugins" panel, look in the list for
  "smtkProjectManagerPlugin" and expand it by clicking the arrow to its left.
  In the expanded section, check the box labeled "Auto Load".
* Close the panel, then close the application and restart. On restart, the
  "Project" menu should now be visible.

If any of the three plugins are not shown in the panel, you might have to use
the "Load New..." button to navigate to the plugin dll file in the package.
The dll files can be found under the install "bin" directory, at the path
bin/smtk-3.3.0/*.

Also be aware that the Cumulus Jobs panel is not visible by default. To change
that, open the "View" menu and check the "Cumulus Jobs" box.


## Settings Setup

Before using modelbuilder to create and use ACE3P projects, you also need to
set two items in the application settings that specify the locations of the
workflows and project-root folders:

* From the application's "Edit" menu, select the "Settings..." item to open
  the "Settings" dialog.
* In the dialog, select the tab labeled "Sim Pre-processing".
* Near the bottom of the tab is an item labeled "Workflows Folder". Set this
  to the "Workflows/ACE3P" folder in the unzipped modelbuilder package.
* Below that item is an item labeled "Projects Root Folder". Set this to a
  folder on your file system to use as the default parent for all "projects"
  you create with modelbuilder.

Modelbuilder includes a toolbar icon that can be used to launch the CUBIT
Geometry and Mesh Generation Toolkit, if installed on the same machine.

![Cubit Icon](./cubit-icon.png).

To configure the icon, open the Settings dialog and find the "ACE3P" tab.
Set the path to the CUBIT executable on your file system using the browse
button next to the CUBIT field.  


## "SSL support is required" Error

When using the Cumulus Jobs panel and clicking the "NERSC Login" button, the
system may respond with a popup error message "SSL support is required, you
must rebuild Qt with SSL support." The message is not accurate -- instead the
problem is that the machine does not have OpenSSL installed or has a version
of OpenSSL that is too old for modelbuilder.

As of January 2020, you can get the latest OpenSSL installer at
https://slproweb.com/products/Win32OpenSSL.html. For standard Windows 10
systems, you can use the first download, which is 3MB and labeled
"Win64 OpenSSL v1.1.1d Light". The direct link is
https://slproweb.com/download/Win64OpenSSL_Light-1_1_1d.exe. After installing
OpenSSL, the "NERSC Login" should respond with a dialog for entering your
NERSC account name, password, and MFA token.


## Known Issues

Using SLACTools to display simulation results, there is a known problem on
systems with Intel HD graphics. At present, the only workaround for this
is to install and use ParaView 5.6 and its SLACTools plugin.
