**Compare station data to REMO output**
=======================================

A step-by-step approach to compare station data to REMO output

1. Create an unstructured grid - for 22 stations NUM=22
-------------------------------------------------------

::

    xvals and yvals are of the station:\\
    \#
    \# gridID 2
    \#
    gridtype  = unstructured
    gridsize  = 22
    xname     = lon
    xunits    = degrees_east
    yname     = lat
    yunits    = degrees_north
    nvertex   = 0
    xvals     = 24.21570 27.020736 24.13184 26.37311 23.191068 26.430780 23.5750679 22.352339 21.011436  23.064745
                21.112153 25.2016275 27.165034 24.065786 25.221784 22.301310 25.074154 24.244387 22.330275 21.321429
                25.5505675 25.542023
    yvals     = 57.520400 57.262248 56.22451 55.521139 56.371165 57.075598 56.3324954 57.444939 56.283135
                57.195964 56.531819 57.1856161 56.324096 56.570216 57.531171 56.403146 56.383328 57.18022 
                57.110021 57.234402 56.3111952 57.080628

2. Create weights for REMO grid for 22 stations
-----------------------------------------------

::

    cdo genbil,r22x1 REMO_file remoweights.nc

3. Interpolation
----------------

::

    cdo -r -remap,unstructured_grid,remoweights.nc -smooth9 REMO_file 22_stations_file

4. Extract stations
-------------------

::

    location = 1...22
    cdo selindexbox,${location},${location},1,1 -setgrid,r${NUM}x1 REMO_file  22_stations_file REMO_Station_1
    cdo outputts REMO_Station_1> REMO_Station_1.txt
