# CMB Modelbuilder Install Instructions

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
* In the "Local Plugins" panel, look in the list for
  "smtkProjectManagerPlugin" and expand it by clicking the arrow to its left.
  In the expanded section, check the box labeled "Auto Load".
* In the "Local Plugins" panel, click the "Load New ..." button and navigate
  to the smtkACE3PPlugin.dll file. It is under the install "bin" directory, at
  the path bin/smtk-3.3.0/smtkACE3PPlugin/smtkACE3PPlugin.dll. Select the
  dll, which should add smtkACE3PPlugin to the "Local Plugins" panel. Expand
  it by clicking its arrow and check the box labeled "Auto Load".
* Close the panel, then close the application and restart. On restart, the
  "Project" menu should now be visible.


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


## Known Issues

In the 05-jan-2020 build, the resource manager does not display visibility
icons (eyeballs).

There is a known problem on systems using Intel HD graphics, when displaying
data loaded by the SLACTools plugin. At present, the only workaround for this
is to install and use ParaView 5.6 and its SLACTools plugin.
