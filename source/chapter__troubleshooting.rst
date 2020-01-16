**Troubleshooting**
===================

Troubleshooting for PyPlotTools
-------------------------------

Plotting netcdf file
~~~~~~~~~~~~~~~~~~~~

PyPlotTools are for plotting netcdf output data from RCMs.

First you have to download it from the git:

1. Make a directory PyPlotTools in your home directory or favorite
   place, where you store your software!
2. cd PyPlotTools
3. git init
4. git pull https://git.gerics.de/PyREMO/PyPlotTools
5. check with: git status

Now you have all python routines and a **manual pyplottools-1.2.4.pdf**.

There are little things in netcdf files, which can course problemes
using the PyPlotTools:

pyxy
^^^^

Does not read all files
^^^^^^^^^^^^^^^^^^^^^^^

If you want to plot multiple files and pyxy does not read all files,
check, if **all the files have the same file length**.

The time axis is not displayed in years
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

If you excecute:

::

    pyxy snd png.lgout.scr "snd" xyears yauto 0 0.3 infile

and *xyears* does not help to have years (*1996, 1998, 2000*) on the x
axis, you can apply the following to your netcdf input file:

::

    cdo -a copy input output

and then try to plot it again.

pycontf
^^^^^^^

pyvect
^^^^^^

pycontfvect
^^^^^^^^^^^

pyclimdia
^^^^^^^^^
