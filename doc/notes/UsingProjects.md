# Using projects in modelbuilder

The "Projects" was added to modelbuilder in 2019 to provide an easier way
to manage simulation assets. This document provides a simple example using
the project feature to create a simulation.

Before starting:

* Make sure you have completed the platform-specific install instructions in
  the linuxInstall.md, macosInstall.md, or windowsInstall.md file. In
  particular, be sure you have (i) set the smtkProjectManagerPlugin to load
  automatically, (ii) configured the applications settings/preferences items
  "Workflows Folder" and "Projects Root Folder".
n

## Initial View Setup

When first starting the application, a number of view panels appear on the left-
hand side of the application. Each panel is a Dock Widget that can be closed or
undocked in the same way that ParaView panels work. For simulation preprocessing,
the following setup is recommended, although users can chose whatever
configuration they prefer:

* Close the Properties and Operations panels
* This should leave 3 view panels: Attribute Editor, Resources, Cumulus Jobs.
* Undock the Cumulus Jobs view and drag it over the Attribute Editor view,
  so that it docks as a second tab.
* Undock the Resources view and drag it over the Attribute Editor view,
  so that it docks as a third tab.
* Drag the left-hand panel so that it occupies approximately 1/3 of the
  widown size.You can change any of the fields as preferred, but
* Select the Resoures view (tab).


## Creating a Project

From the Project menu, select "New Project...", which brings up a dialog window
for creating or selecting the directory for storing project files.

* This first dialog will start in the "Projects Roots Folder" if that has been
  defined in the application settings, otherwise it starts in the current
  working directory.
* In this dialog, you cannot enter text to create a directory. Instead, you can
  create directories by clicking the folder icon near the upper right corner
  of the dialog.
* After a directory is selected, modelbuilder will display a warning popup if the
  selected directory contains files or subdirectories. You are then given the
  option to (i) continue, in which case modelbuilder deletes all of the current
  directory contents, (ii) cancel the new-project action, or (iii) select a
  different directory.
* After the directory is selected, modelbuilder displays a "New Project"
  dialog with the project name filled in. If things have been configured
  correctly, you should only need to enter a "Geometry File", which be
  a .gen file or .ncdf file. (If you use a .gen file, modelbuilder will
  automatically run the ACDTool meshconvert when submitting jobs to NERSC.

After entering the geometry file, click the "Apply" button and the project is
project is created and its contents displayed in modelbuilder.

Once the model appears in the 3D view, is it important to SAVE THE PROJECT WHEN
IT IS FIRST CREATED. This is because, at present, the contents of the attribute
resource is typically modified when first displayed in modelbuilder. To save the
project, use the "Save Project" menu item in the "Project" menu.

At this point, you can select the "Attribute Editor" view (tab) and begin
defining the simulation attributes with the same UI as in previous versions of
modelbuilder. When you have completed defining the simulation, be sure to save
the project again.


## Writing Solver Input

To generate the solver file, use the "Project Export" item in the "Project" menu,
which brings up a dialog window. You should only need to enter one field,
"ACE3P Analysis"; later versions of modelbuilder might also set that field.
Click the "Apply" button will write the input file to the local project
directory.

To submit as a simulation job to NERSC, see the next section.


## Submitting to NERSC

Because NERSC now requires multifactor authentication, modelbuilder has changed the
sign-in logic to make it simpler.

Before submitting any jobs, go to the "Cumulus Jobs" panel and click the "NERSC
Login" button, which opens a dialog for entering your username, password, and MFA
token. On successful sign-in, you should see a 32-character string displayed next
to the "NERSC Login" button. This string is a "NEWT session id", which should
provide access for at least 12 hours. It is not save between modelbuilder runs, so
you will need to login once each time you start modelbuilder.

Once you have signed in this way, you can select the "Submit job to NERSC" option
in the project export panel. Note that the NEWT session id appears in one of the
dialog fields.

## Monitoring Jobs

You can view the status of all jobs submitted to NERSC in the Cumulus Jobs
panel. The status column, which is updated approximately every 15 seonds,
displays "created", "queued", "running", "completed", or "error". You can use
the context menu to delete jobs, termanate running jobs, and download results
from completed jobs.


## Saving Projects

Be sure to use the "Project Save" item after making changes to the simulation
attributes.
